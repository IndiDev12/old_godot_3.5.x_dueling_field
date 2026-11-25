extends PanelContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var current_card_info_screen_size_x = get_node("../HSplitContainer3/VSplitContainer").get_rect().size[0]#.get_size()[0]
#onready var original_current_card_info_screen_size_x = get_node("../HSplitContainer4/TextureRect16").get_rect().size[0]
onready var original_current_card_info_screen_size_x = 120
onready var original_current_panel_info_screen_size_x = 120
onready var original_current_panel_info_screen_size_y = 472
onready var original_current_card_info_screen2_size_x = 184
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_card_info_screen_size_x = get_node("../HSplitContainer4/TextureRect16").get_rect().size[0]
	var window_w = get_viewport_rect().size[0]
	var window_hieght = get_viewport_rect().size[1]
	var the_diffrence = current_card_info_screen_size_x - original_current_card_info_screen_size_x
	get_node("../PanelContainer2").set_size(Vector2(current_card_info_screen_size_x, window_hieght - current_card_info_screen_size_x))
	get_node("../PanelContainer2").set_position(Vector2(0, the_diffrence+128))
	get_node("../PanelContainer2").set_position(Vector2(0, window_hieght- ( window_hieght - current_card_info_screen_size_x) ))
#	pass


func _on_VSplitContainer_dragged(offset):
	#print(current_card_info_screen_size_x)
	pass # Replace with function body.


func _on_HSplitContainer3_dragged(offset):
	var current_card_info_screen_size_x = get_node("../HSplitContainer3/VSplitContainer").get_rect().size[0]
	if current_card_info_screen_size_x > original_current_card_info_screen_size_x:
		get_node("../HSplitContainer3/VSplitContainer/PanelContainer2").size_flags_stretch_ratio -=0.014018692
		original_current_card_info_screen_size_x = current_card_info_screen_size_x
	elif current_card_info_screen_size_x < original_current_card_info_screen_size_x:
		get_node("../HSplitContainer3/VSplitContainer/PanelContainer2").size_flags_stretch_ratio +=0.014018692
		original_current_card_info_screen_size_x = current_card_info_screen_size_x
	#print(current_card_info_screen_size_x)



	#if current_card_info_screen_size_x > original_current_card_info_screen_size_x and current_card_info_screen_size_x < 613:
		#var panel_size = get_node("../HSplitContainer4/TextureRect16/PanelContainer2").get_rect().size
		#var the_diffrence = current_card_info_screen_size_x - original_current_card_info_screen_size_x
		#get_node("../PanelContainer2").set_size(Vector2((original_current_panel_info_screen_size_x + the_diffrence), original_current_panel_info_screen_size_y - the_diffrence))
		#get_node("../PanelContainer2").set_position(Vector2(0, the_diffrence + 128))
		#original_current_card_info_screen_size_x = current_card_info_screen_size_x
	#elif current_card_info_screen_size_x < original_current_card_info_screen_size_x:
		#var panel_size = get_node("../HSplitContainer4/TextureRect16/PanelContainer2").get_rect().size
		#var the_diffrence = current_card_info_screen_size_x - original_current_card_info_screen_size_x
		#get_node("../PanelContainer2").set_size(Vector2(original_current_panel_info_screen_size_x - the_diffrence, original_current_panel_info_screen_size_y + the_diffrence))
		#get_node("../PanelContainer2").set_position(Vector2(0, the_diffrence + 128))
		#original_current_card_info_screen_size_x = current_card_info_screen_size_x
	#print(current_card_info_screen_size_x)
	#pass # Replace with function body.


