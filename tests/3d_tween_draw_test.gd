extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hlength = -4.785


# Called when the node enters the scene tree for the first time.
func _ready():
	test3draw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func test3draw():
	
	var tween = get_tree().create_tween()
	for card in range(1,7):
		var card_order = float(float(7-card)/4)
		var card_hand_place = hlength*card_order
		var ncard = get_node("../ViewportContainer/Viewport/3dtestcard").duplicate()
		get_node("../ViewportContainer/Viewport").add_child(ncard)
		tween.parallel().tween_property(ncard,"translation",Vector3(card_hand_place,-0.9,-1.3),card)
		tween.parallel().tween_property(ncard,"rotation_degrees",Vector3(0,-90,45),(float(card)/2))
