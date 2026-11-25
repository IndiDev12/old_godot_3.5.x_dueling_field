extends VideoPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var thread = Thread.new()
var mutex = Mutex.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	mutex.lock()
	thread.start(self,"run_video",null)
	mutex.unlock()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_animated_backgound2_finished():
	mutex.lock()
	thread.start(self,"run_video",null)
	mutex.unlock()
	#pass # Replace with function body.

func run_video():
	mutex.lock()
	self.play()
	mutex.unlock()
