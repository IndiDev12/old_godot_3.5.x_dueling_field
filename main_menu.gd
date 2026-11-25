extends VideoPlayer
#
#
## Declare member variables here. Examples:
## var a = 2
## var b = "text"
#var thread = Thread.new()
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	get_node("../animated_backgound").stream = preload("res://background/animated/Abstract - 27726(1).webm")
#	thread.start(self,"play_in_thread")
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
##
##func _process(delta):
##	thread.start(self,"play_in_thread")
##	pass
#
#
#func _on_VideoPlayer_finished():
#	get_node("../animated_backgound").play()
#	#play()
#	pass # Replace with function body.
#
#
#func play_in_thread():
##	var mutex = Mutex.new()
##	mutex.lock()
##	get_node("../animated_backgound").stream = load("res://background/animated/Abstract - 27726(1).webm")
#	get_node("../animated_backgound").call_deferred("play")#.play()
##	mutex.unlock()
#
#
#
