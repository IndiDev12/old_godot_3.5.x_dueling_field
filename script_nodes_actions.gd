extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var scriptGraphEdit = get_node("../HSplitContainer/VBoxContainer/TabContainer/Card Effects/ScriptGraphEdit")
onready var effectNode =  get_node("../EffectGraphNode")

var effectNo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_GraphEdit_connection_request(from, from_slot, to, to_slot):
	scriptGraphEdit.connect_node(from, from_slot, to, to_slot)
	print(scriptGraphEdit.get_connection_list())
	print(scriptGraphEdit.get_node(scriptGraphEdit.get_connection_list()[0].from).get_node("TimingOption").get_item_text(scriptGraphEdit.get_node(scriptGraphEdit.get_connection_list()[0].from).get_node("TimingOption").get_selected_id()))
	pass # Replace with function body.


func _on_NewEffectButton_pressed():
	var newEffctNode = effectNode.duplicate()
	newEffctNode.name = "Effect"+str(effectNo+1)
	newEffctNode.title = newEffctNode.name
	effectNo +=1
	newEffctNode.visible = true
	scriptGraphEdit.add_child(newEffctNode)
	pass # Replace with function body.
