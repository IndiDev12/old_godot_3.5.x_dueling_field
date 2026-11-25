extends Panel

# Initialize.
#onready var queue = preload("res://scripts/resource_queue.gd").new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var thread
var mutex
var semaphore
var exit_thread = false

var time_max = 100 # Milliseconds.

var queue = []
var pending = {}

func _lock(_caller):
	mutex.lock()


func _unlock(_caller):
	mutex.unlock()


func _post(_caller):
	semaphore.post()


func _wait(_caller):
	semaphore.wait()


func queue_resource(path, p_in_front = false):
	_lock("queue_resource")
	if path in pending:
		_unlock("queue_resource")
		return
	elif ResourceLoader.has_cached(path):
		var res = ResourceLoader.load(path)
		pending[path] = res
		_unlock("queue_resource")
		return
	else:
		var res = ResourceLoader.load_interactive(path)
		res.set_meta("path", path)
		if p_in_front:
			queue.insert(0, res)
		else:
			queue.push_back(res)
		pending[path] = res
		_post("queue_resource")
		_unlock("queue_resource")
		return


func cancel_resource(path):
	_lock("cancel_resource")
	if path in pending:
		if pending[path] is ResourceInteractiveLoader:
			queue.erase(pending[path])
		pending.erase(path)
	_unlock("cancel_resource")


func get_progress(path):
	_lock("get_progress")
	var ret = -1
	if path in pending:
		if pending[path] is ResourceInteractiveLoader:
			ret = float(pending[path].get_stage()) / float(pending[path].get_stage_count())
		else:
			ret = 1.0
	_unlock("get_progress")
	return ret


func is_ready(path):
	var ret
	_lock("is_ready")
	if path in pending:
		ret = !(pending[path] is ResourceInteractiveLoader)
	else:
		ret = false
	_unlock("is_ready")
	return ret


func _wait_for_resource(res, path):
	_unlock("wait_for_resource")
	while true:
		VisualServer.sync()
		OS.delay_usec(16000) # Wait approximately 1 frame.
		_lock("wait_for_resource")
		if queue.size() == 0 || queue[0] != res:
			return pending[path]
		_unlock("wait_for_resource")


func get_resource(path):
	_lock("get_resource")
	if path in pending:
		if pending[path] is ResourceInteractiveLoader:
			var res = pending[path]
			if res != queue[0]:
				var pos = queue.find(res)
				queue.remove(pos)
				queue.insert(0, res)

			res = _wait_for_resource(res, path)
			pending.erase(path)
			_unlock("return")
			return res
		else:
			var res = pending[path]
			pending.erase(path)
			_unlock("return")
			return res
	else:
		_unlock("return")
		return ResourceLoader.load(path)


func thread_process():
	_wait("thread_process")
	_lock("process")

	while queue.size() > 0:
		var res = queue[0]
		_unlock("process_poll")
		var ret = res.poll()
		_lock("process_check_queue")

		if ret == ERR_FILE_EOF || ret != OK:
			var path = res.get_meta("path")
			if path in pending: # Else, it was already retrieved.
				pending[res.get_meta("path")] = res.get_resource()
			# Something might have been put at the front of the queue while
			# we polled, so use erase instead of remove.
			queue.erase(res)
	_unlock("process")


func thread_func(_u):
	while true:
		mutex.lock()
		var should_exit = exit_thread # Protect with Mutex.
		mutex.unlock()

		if should_exit:
			break
		thread_process()


func start():
	mutex = Mutex.new()
	semaphore = Semaphore.new()
	thread = Thread.new()
	thread.start(self, "thread_func", 0)

# Triggered by calling "get_tree().quit()".
func _exit_tree():
	mutex.lock()
	exit_thread = true # Protect with Mutex.
	mutex.unlock()

	# Unblock by posting.
	semaphore.post()

	# Wait until it exits.
	thread.wait_to_finish()


# Called when the node enters the scene tree for the first time.
func _ready():
	queue.start()

# Suppose your game starts with a 10 second cutscene, during which the user
# can't interact with the game.
# For that time, we know they won't use the pause menu, so we can queue it
# to load during the cutscene:
	queue.queue_resource("res://pause_menu.tres")
	start_cutscene()

# Later, when the user presses the pause button for the first time:
	pause_menu = queue.get_resource("res://pause_menu.tres").instance()
	pause_menu.show()

# When you need a new scene:
	queue.queue_resource("res://level_1.tscn", true)
# Use "true" as the second argument to put it at the front of the queue,
# pausing the load of any other resource.

# To check progress.
	if queue.is_ready("res://level_1.tscn"):
		show_new_level(queue.get_resource("res://level_1.tscn"))
	else:
		update_progress(queue.get_progress("res://level_1.tscn"))

# When the user walks away from the trigger zone in your Metroidvania game:
	queue.cancel_resource("res://zone_2.tscn")
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
