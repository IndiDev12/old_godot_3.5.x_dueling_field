extends PanelContainer


#signal new_screen_card_texture
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
onready var cards_database = SQLite.new()

onready var window_width = get_viewport_rect().size[0]
onready var window_hieght = get_viewport_rect().size[1]
onready var original_current_card_info_screen_size_x = 166.897
onready var original_current_card_info_screen_size_y = 241.379
onready var original_main_deck_container_size_x = 745
onready var original_screen_card_controller_size_x = get_node("../main_HSplitContainer/screen_card_controller").get_rect().size[0]
#onready var searched_cards = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children()
onready var current_screen_card_texture = preload("res://test_items/20654247.jpg")

onready var card_cover = preload("res://textures/card_images/cover.jpg")

var card_objects : Dictionary = {}
var cards_in_deck = []
var number_of_cards_in_side_deck = 0

#onready var search_panel_col = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").columns

var number_of_search_reasults = 48 # 12141

var first_search_range = 0
var last_search_range = 5
var scrollbar_addition = 0


var previous_number_of_colums = 1

var previous_first_search_range = 0
var previous_last_search_range = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	var current_screen_card_controller_size_x = get_node("../main_HSplitContainer/screen_card_controller").get_rect().size[0]
	var current_screen_card_size_x = get_node("../the_screen_card").get_rect().size[0]
	var the_ratio = original_screen_card_controller_size_x/current_screen_card_controller_size_x
	var screen_card_position = Vector2(5,5)
	var screen_card_size = Vector2(original_current_card_info_screen_size_x / (the_ratio), original_current_card_info_screen_size_y / (the_ratio))

	var card_size_x = 63
	var original_space = 10



	#list_card_images_in_directory("res://textures/96x140/")





	get_node("../the_screen_card").set_position(screen_card_position)
	get_node("../the_screen_card").set_size(Vector2(original_current_card_info_screen_size_x / (the_ratio), original_current_card_info_screen_size_y / (the_ratio)))

	get_node("../att_lv_type").set_position(Vector2(0, (original_current_card_info_screen_size_y / (the_ratio)+10)))
	get_node("../att_lv_type").set_size(Vector2((original_current_card_info_screen_size_x / (the_ratio))+6, 31))
	get_node("../disc").set_position(Vector2(0, get_node("../att_lv_type").get_rect().position[1]+31))
	get_node("../disc").set_size(Vector2(get_node("../att_lv_type").get_rect().size[0], window_hieght-get_node("../the_screen_card").get_rect().size[1]-40))
#	get_node("../search_card_BG").set_size(Vector2(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_rect().size[0]+21, 650))
	#get_node("../search_card_BG").set_position(Vector2(window_width - get_node("../search_card_BG").get_rect().size[0],-2))



	cards_database.path = "res://cards_data/cards.db"
	cards_database.open_db()
	cards_database.query("SELECT id FROM datas ;")
#




#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():#range(0,20):
#		#print(cards_database.query_result[card]["id"])
#		#var a_card = get_node("../main_HSplitContainer/HSplitContainer/ScrollContainer/FlexGridContainer/empty_card").duplicate()
#		#get_node("../main_HSplitContainer/HSplitContainer/ScrollContainer/FlexGridContainer").add_child(a_card)
#		#a_card.visible = true
#		#print(card.get_index())
#		#print("division is:::",6/number_of_search_reasults)
#		if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()]["id"])+".jpg"):
#		#	a_card.texture = load("res://textures/card_images/"+str(cards_database.query_result[card]["id"])+".jpg")
#			card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()]["id"])+".jpg")
#		else:
#		#	a_card.texture = load("res://textures/card_images/cover.jpg")
#			card.texture = load("res://textures/card_images/cover.jpg")
#		#	print(cards_database.query_result)
#		if number_of_search_reasults - 1 >= card.get_index():
#			if search_panel_col == 1 and card.get_index() < 6:
#				card.visible = true
#			elif search_panel_col == 2 and card.get_index() < 12:
#				card.visible = true
#			elif search_panel_col == 3 and card.get_index() < 18:
#				card.visible = true
#			elif search_panel_col == 4 and card.get_index() < 24:
#				card.visible = true
#			else:
#				card.visible = false
#		else:
#			card.visible = false
#
#	if search_panel_col == 1:
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(6.0/number_of_search_reasults)*547))
#	elif search_panel_col == 2:
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(12.0/number_of_search_reasults)*547))
#	elif search_panel_col == 3:
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(18.0/number_of_search_reasults)*547))
#	elif search_panel_col == 4:
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(24.0/number_of_search_reasults)*547))
#
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	var current_main_deck_container_size_x = get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container").get_rect().size[0]
#	var main_deck_size_x_ratio = current_main_deck_container_size_x/original_main_deck_container_size_x
#	var original_space = 10
#	var space_between_cards_in_main_deck = ((current_main_deck_container_size_x-(63*11))/(11))#+0.362#*(10/10)
#	var space_between_cards_in_extra_deck = ((((current_main_deck_container_size_x-(63*11))/(11))))#+0.362#*(15/10)#+((63*15)*(12/15))
#	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer").add_constant_override("hseparation", space_between_cards_in_extra_deck)
#	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").add_constant_override("hseparation", space_between_cards_in_extra_deck)
#
#
#	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").add_constant_override("hseparation", space_between_cards_in_main_deck)
#	get_node("../search_card_BG").set_size(Vector2(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_rect().size[0]+21, 650))
#	get_node("../search_card_BG").set_position(Vector2(window_width - get_node("../search_card_BG").get_rect().size[0],-2))
#
#
##	cards_database.path = "res://cards_data/cards.db"
##	cards_database.open_db()
##	cards_database.query("SELECT id FROM datas ;")
#
#	search_panel_col = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").columns
#
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():#range(0,20):
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
#			if number_of_search_reasults - 1 >= card.get_index():
#				if search_panel_col == 1 and card.get_index() < 6:
#					card.visible = true
#				elif search_panel_col == 2 and card.get_index() < 12:
#					card.visible = true
#				elif search_panel_col == 3 and card.get_index() < 18:
#					card.visible = true
#				elif search_panel_col == 4 and card.get_index() < 24:
#					card.visible = true
#				else:
#					card.visible = false
#			else:
#				card.visible = false
#
##
##
###	for i in get_node("../main_HSplitContainer/HSplitContainer/ScrollContainer/FlexGridContainer").get_children():#searched_cards:
###		if get_global_mouse_position()[0] >= i.get_global_position()[0] and get_global_mouse_position()[0] <= i.get_global_position()[0] + i.get_rect().size[0] and get_global_mouse_position()[1] >= i.get_global_position()[1] and get_global_mouse_position()[1] <= i.get_global_position()[1] + i.get_rect().size[1] and current_screen_card_texture != i.texture and i.visible == true:
###			current_screen_card_texture = i.texture
###			get_node("../the_screen_card/screen_card_animation_player").play_backwards("RESET")
###			get_node("../the_screen_card/screen_card_animation_player").play("ScreenCardAnimation")
###			get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,0, current_screen_card_texture)
###			get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,1, current_screen_card_texture)
###
###
###	for ii in get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_children():#searched_cards:
###		if get_global_mouse_position()[0] >= ii.get_global_position()[0] and get_global_mouse_position()[0] <= ii.get_global_position()[0] + ii.get_rect().size[0] and get_global_mouse_position()[1] >= ii.get_global_position()[1] and get_global_mouse_position()[1] <= ii.get_global_position()[1] + ii.get_rect().size[1] and current_screen_card_texture != ii.texture and ii.visible == true:
###			current_screen_card_texture = ii.texture
###			get_node("../the_screen_card/screen_card_animation_player").play_backwards("RESET")
###			get_node("../the_screen_card/screen_card_animation_player").play("ScreenCardAnimation")
###			get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,0, current_screen_card_texture)
###			get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,1, current_screen_card_texture)
###
###
###	for iii in get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_children():#searched_cards:
###		if get_global_mouse_position()[0] >= iii.get_global_position()[0] and get_global_mouse_position()[0] <= iii.get_global_position()[0] + iii.get_rect().size[0] and get_global_mouse_position()[1] >= iii.get_global_position()[1] and get_global_mouse_position()[1] <= iii.get_global_position()[1] + iii.get_rect().size[1] and current_screen_card_texture != iii.texture and iii.visible == true:
###			current_screen_card_texture = iii.texture
###			get_node("../the_screen_card/screen_card_animation_player").play_backwards("RESET")
##			get_node("../the_screen_card/screen_card_animation_player").play("ScreenCardAnimation")
##			get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,0, current_screen_card_texture)
##			get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,1, current_screen_card_texture)
#
##-----------------------------------------------------------------------------------------------------
##-----------------------------------------------------------------------------------------------------
##-----------------------------------------------------------------------------------------------------
#
#
#	var space_between_cards_in_deck = 10*main_deck_size_x_ratio
#
#
#
#
#	#---------------------------------------------------------------------------------------------------------------------
#	#---------------------------------------------------------------------------------------------------------------------
#	#pass
#
#func _input(event):
#	#var cards_in_deck = []
##	for a in range(1, get_node("../main_HSplitContainer/HSplitContainer/ScrollContainer/FlexGridContainer").get_children().size()):
##		var i = get_node("../main_HSplitContainer/HSplitContainer/ScrollContainer/FlexGridContainer").get_children()[a]
##		if get_global_mouse_position()[0] >= i.get_global_position()[0] and get_global_mouse_position()[0] <= i.get_global_position()[0] + i.get_rect().size[0] and get_global_mouse_position()[1] >= i.get_global_position()[1] and get_global_mouse_position()[1] <= i.get_global_position()[1] + i.get_rect().size[1] and cards_in_deck.count(i.name) < 3:#and i.name != "empty_card":#i.visible == true:
##			if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and cards_in_deck.size() < 60:
##
##				var b_card = get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer/empty_card").duplicate()
##				get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").add_child(b_card)
##				b_card.visible = true
##				b_card.name = i.name
##				b_card.texture = i.texture
##				b_card.material = ShaderMaterial.new()
##				b_card.material.shader = load("res://shaders/jitter_fixer.shader")
##				cards_in_deck.append(i.name)
##
##			elif event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and event.pressed and number_of_cards_in_side_deck < 15:
##
##				var b_card = get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer/empty_card").duplicate()
##				get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").add_child(b_card)
##				b_card.visible = true
##				b_card.name = i.name
##				b_card.texture = i.texture
##				b_card.material = ShaderMaterial.new()
##				b_card.material.shader = load("res://shaders/jitter_fixer.shader")
##				cards_in_deck.append(i.name)
##				number_of_cards_in_side_deck = number_of_cards_in_side_deck + 1
##
##
##	for b in range(1, get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_children().size()):
##		var ii = get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_children()[b]
##		if get_global_mouse_position()[0] >= ii.get_global_position()[0] and get_global_mouse_position()[0] <= ii.get_global_position()[0] + ii.get_rect().size[0] and get_global_mouse_position()[1] >= ii.get_global_position()[1] and get_global_mouse_position()[1] <= ii.get_global_position()[1] + ii.get_rect().size[1] :#and cards_in_deck.count(ii.name) < 3:
##			if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and event.pressed:
##				cards_in_deck.remove(ii.name)
##				ii.visible = false
#				#get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").remove_child(ii)
#
#
#				pass
#
#
#func _on_HSplitContainer_dragged(offset):
#
#	pass # Replace with function body.
#
#
#func _on_search_pressed():
#	get_node("../main_search_window").visible = true
#	#pass # Replace with function body.
#
#
#func _on_apply_search_filters_pressed():
#	#cards_database.path = "res://cards_data/cards.db"
#	#cards_database.open_db()
#	get_node("../main_search_window").visible = false
#	#pass # Replace with function body.


func _on_main_HSplitContainer_dragged(offset):
	var current_screen_card_controller_size_x = get_node("../main_HSplitContainer/screen_card_controller").get_rect().size[0]
	var current_screen_card_size_x = get_node("../the_screen_card").get_rect().size[0]
	var the_ratio = original_screen_card_controller_size_x/current_screen_card_controller_size_x
	var screen_card_position = Vector2(5,5)
	var screen_card_size = Vector2(original_current_card_info_screen_size_x / (the_ratio), original_current_card_info_screen_size_y / (the_ratio))
	get_node("../the_screen_card").set_position(screen_card_position)
	get_node("../the_screen_card").set_size(Vector2(original_current_card_info_screen_size_x / (the_ratio), original_current_card_info_screen_size_y / (the_ratio)))

	get_node("../att_lv_type").set_position(Vector2(0, (original_current_card_info_screen_size_y / (the_ratio)+10)))
	get_node("../att_lv_type").set_size(Vector2((original_current_card_info_screen_size_x / (the_ratio))+6, 31))
	get_node("../disc").set_position(Vector2(0, get_node("../att_lv_type").get_rect().position[1]+31))
	get_node("../disc").set_size(Vector2(get_node("../att_lv_type").get_rect().size[0], window_hieght-get_node("../the_screen_card").get_rect().size[1]-40))
	get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(0,0, Vector2(0, get_node("../the_screen_card").get_rect().size[1]))
	get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(0,1, Vector2(get_node("../the_screen_card").get_rect().size[0], get_node("../the_screen_card").get_rect().size[1]))
	
	get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(1,0, Vector2((get_node("../the_screen_card").get_rect().size[0]/2)+5,5))
	get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(1,1, Vector2(5,5))
	
#	if offset > -841:
#		get_node("../main_HSplitContainer/VBoxContainer/VBoxContainer/ViewportContainer/Viewport/Camera").fov = 68.9 - float(float(-841-offset)/10)

#	search_panel_col = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").columns

#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():#range(0,20):
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
#			if number_of_search_reasults - 1 >= card.get_index():
#				if search_panel_col == 1 and card.get_index() < 6:
#					card.visible = true
#				elif search_panel_col == 2 and card.get_index() < 12:
#					card.visible = true
#				elif search_panel_col == 3 and card.get_index() < 18:
#					card.visible = true
#				elif search_panel_col == 4 and card.get_index() < 24:
#					card.visible = true
#				else:
#					card.visible = false
#			else:
#				card.visible = false
#
#
#
#	if search_panel_col == 1:
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(6.0/number_of_search_reasults)*547))
#	elif search_panel_col == 2:
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(12.0/number_of_search_reasults)*547))
#	elif search_panel_col == 3:
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(18.0/number_of_search_reasults)*547))
#	elif search_panel_col == 4:
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(24.0/number_of_search_reasults)*547))
#
#
#
#	#pass # Replace with function body.
#
#
#
#
#func _on_script_new_search_results():
#	pass # Replace with function body.
#
#
#func _on_ScrollContainer_scroll_ended():
#	print("is it bottom ?")
#	#pass # Replace with function body.
#
#
#
#
##func list_card_images_in_directory(path):
##	var card_images = []
##	var dir = Directory.new()
##	dir.open(path)
##	dir.list_dir_begin()
##
##	while true:
##		var card_image = dir.get_next()
##		if card_image == "":
##			break
##		elif not card_image.begins_with(".") and !card_image.ends_with(".import"):
##			card_images.append(card_image)
##
##	dir.list_dir_end()
##	for card in range(0,3000):#card_images.size:
##		#print(card_images[card])
##		#var img = Image.new()
##		#var tex = ImageTexture.new()
##		var a_card = get_node("../main_HSplitContainer/HSplitContainer/ScrollContainer/FlexGridContainer/empty_card").duplicate()
##		get_node("../main_HSplitContainer/HSplitContainer/ScrollContainer/FlexGridContainer").add_child(a_card)
##		a_card.visible = true
##		a_card.name = str(card_images[card]).replace(".jpg", "")
##		a_card.texture = card_cover
##		a_card.material = ShaderMaterial.new()
##		a_card.material.shader = load("res://shaders/jitter_fixer.shader")
##		#print(a_card.name)
##		#if card_images[card].push_back(load("res://textures/484x700/"+card_images[card])):
##		if load(path+card_images[card]):
##			#a_card.texture = card_images.push_back(load("res://textures/484x700/"+card_images[card]))
##			a_card.texture = load(path+card_images[card])
#			#a_card.material = ShaderMaterial.new()
#			#a_card.material.shader = load("res://shaders/jitter_fixer.shader")
#
#		#else:
#		#	pass#a_card.texture = card_images.push_back(card_cover)
#
#
#	#return card_images
#	#print("function result is:", card_images)
#
#
#
#
#
#
#
#
#
#func _on_Co_1_pressed():
#	previous_number_of_colums = search_panel_col
#	if search_panel_col != 1:
#		get_node("../main_HSplitContainer/HSplitContainer").split_offset = 220
#		search_panel_col = 1
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():
#		if card.get_index() < 6 and number_of_search_reasults - 1 >= card.get_index():
#			card.visible = true
#		else:
#			card.visible = false
#
#
#
#	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(6.0/number_of_search_reasults)*547))
##	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] = (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6)-1)))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])# first_search_range * (1.0/(last_search_range - (5)))#first_search_range*((1.0/5)/number_of_search_reasults)#(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])-((float(last_search_range)/number_of_search_reasults-1))
##	first_search_range = int(first_search_range/1)
##	last_search_range = int(last_search_range/1)
#
#
#	if previous_number_of_colums>1:
#		first_search_range += last_search_range - 5#(search_panel_col -1)*6
###		last_search_range -= (search_panel_col -1)*6
##		first_search_range -= (search_panel_col)*6
##		last_search_range -= (search_panel_col)*6
#
#	if last_search_range> number_of_search_reasults -1:
#		last_search_range = number_of_search_reasults -1
#
#	if last_search_range - first_search_range <5:
#		first_search_range = last_search_range - 5
#
#	if first_search_range < 0:
#		first_search_range = 0
#	if last_search_range < 5:
#		last_search_range = 5
#
#
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():#range(0,20):
#		if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
#			card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#		else:
#			card.texture = load("res://textures/card_images/cover.jpg")
#		if card.get_index() < 6:
#			card.visible = true
##		if first_search_range > 0:#6:
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
##			if card.get_index() < 6:
##				card.visible = true
##		else:
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
##			if card.get_index() < 6:
##				card.visible = true
#
#
##	if first_search_range >=6 :
##		first_search_range -= 6
##		last_search_range -= 6
##	else:
##		last_search_range -= first_search_range
##		first_search_range = 0
#
#	#pass # Replace with function body.
#	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] = (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6))))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])
#
#
#func _on_Co_2_pressed():
#	previous_number_of_colums = search_panel_col
#	if search_panel_col != 2:
#		get_node("../main_HSplitContainer/HSplitContainer").split_offset = 120
#		search_panel_col = 2
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():
#		if card.get_index() < 12 and number_of_search_reasults - 1 >= card.get_index():
#			card.visible = true
#		else:
#			card.visible = false
#
#
#	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(12.0/number_of_search_reasults)*547))
##	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] =  (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6)-1)))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])#first_search_range * (1.0/(last_search_range - (11)))#first_search_range*((1.0/11)/number_of_search_reasults)#(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])-((float(last_search_range)/number_of_search_reasults-1)*6)
#
#	if previous_number_of_colums>2:
#		first_search_range += last_search_range - 11
##		last_search_range -= (search_panel_col)*6
#	elif previous_number_of_colums<2:
#		first_search_range -= (search_panel_col-1)*6
##		last_search_range += (search_panel_col)*6
#
#	if last_search_range> number_of_search_reasults -1:
#		last_search_range = number_of_search_reasults -1
#
#	if last_search_range - first_search_range <11:
#		first_search_range = last_search_range - 11
#
#	if first_search_range < 0:
#		first_search_range = 0
#	if last_search_range < 11:
#		last_search_range = 11
##	first_search_range = int(first_search_range/2)
##	last_search_range = int(last_search_range/2)
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():#range(0,20):
#		if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
#			card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#		else:
#			card.texture = load("res://textures/card_images/cover.jpg")
#		if card.get_index() < 12:
#			card.visible = true
##		if first_search_range > 6:#12:
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range-6]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range-6]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
##			if card.get_index() < 12:
##				card.visible = true
##		else:
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
##			if card.get_index() < 12:
##				card.visible = true
#
##	if first_search_range >=12 :
##		first_search_range -= 12
##		last_search_range -= 12
##	else:
##		last_search_range -= first_search_range
##		first_search_range = 0
#
#
#
#	print("first::=", first_search_range ,", last::=", last_search_range)
#
#	#pass # Replace with function body.
#	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] = (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6))))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])
#
#
#func _on_Co_3_pressed():
#	previous_number_of_colums = search_panel_col
#	if search_panel_col != 3:
#		get_node("../main_HSplitContainer/HSplitContainer").split_offset = 40
#		search_panel_col = 3
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():
#		if card.get_index() < 18 and number_of_search_reasults - 1 >= card.get_index():
#			card.visible = true
#		else:
#			card.visible = false
#
#
#
#	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(18.0/number_of_search_reasults)*547))
##	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] =  (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6)-1)))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])#first_search_range * (1.0/(last_search_range - (17)))#first_search_range*((1.0/17)/number_of_search_reasults) #(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])-((float(last_search_range)/number_of_search_reasults-1)*12)
#
#	if previous_number_of_colums>3:
###		first_search_range -= (search_panel_col -1)*6
###		last_search_range -= (search_panel_col -1)*6
#		first_search_range += last_search_range - 17
##		last_search_range += (search_panel_col)*6
#	elif previous_number_of_colums<3:
#		first_search_range -= (search_panel_col -1)*6
###		last_search_range += (search_panel_col -1)*6
##		first_search_range += (search_panel_col)*6
##		last_search_range += (search_panel_col)*6
#
#	if last_search_range> number_of_search_reasults -1:
#		last_search_range = number_of_search_reasults -1
#
#	if last_search_range - first_search_range <17:
#		first_search_range = last_search_range - 17
#
#	if first_search_range < 0:
#		first_search_range = 0
#	if last_search_range < 17:
#		last_search_range = 17
##	first_search_range = int(first_search_range/3)
##	last_search_range = int(last_search_range/3)
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():#range(0,20):
#		if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
#			card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#		else:
#			card.texture = load("res://textures/card_images/cover.jpg")
#		if card.get_index() < 18:
#			card.visible = true
#
##		if first_search_range > 12:#18:
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range-12]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range-12]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
##			if card.get_index() < 18:
##				card.visible = true
##		else:
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
##			if card.get_index() < 18:
##				card.visible = true
#
##	if first_search_range >=18 :
##		first_search_range -= 18
##		last_search_range -= 18
##	else:
##		last_search_range -= first_search_range
##		first_search_range = 0
#
#
#
#	print("first::=", first_search_range ,", last::=", last_search_range)
#	#pass # Replace with function body.
#	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] = (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6))))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])
#
#
#func _on_Co_4_pressed():
#	previous_number_of_colums = search_panel_col
#	if search_panel_col != 4:
#		get_node("../main_HSplitContainer/HSplitContainer").split_offset = 0
#		search_panel_col = 4
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():
#		if card.get_index() < 24 and number_of_search_reasults - 1 >= card.get_index():
#			card.visible = true
#		else:
#			card.visible = false
#
#	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").set_size(Vector2(6,(24.0/number_of_search_reasults)*547))
##	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] = (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6))))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])#first_search_range * (1.0/(last_search_range - (23)))#first_search_range*((1.0/23)/number_of_search_reasults)#(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])-((float(last_search_range)/number_of_search_reasults-1)*18)#((float(search_panel_col )/ number_of_search_reasults))*(((547))) * (first_search_range+1)    #(first_search_range+1)*(1.0/number_of_search_reasults)+get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1]
#
#
#	if previous_number_of_colums<4:
#
#		first_search_range -= (search_panel_col -1)*6
###		last_search_range += (search_panel_col -1)*6
##
##		first_search_range += (search_panel_col )*6
##		last_search_range += (search_panel_col )*6
#
#	if last_search_range> number_of_search_reasults -1:
#		last_search_range = number_of_search_reasults -1
#	if last_search_range - first_search_range <23:
#		first_search_range = last_search_range - 23
#
#	if first_search_range < 0:
#		first_search_range = 0
#	if last_search_range < 23:
#		last_search_range = 23
##	if first_search_range < 4:
##		first_search_range = 0
##	else:
##		first_search_range -= 4
##	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1]/4
##	first_search_range = int(first_search_range/4)
##	last_search_range = int(last_search_range/4)
#	for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():#range(0,20):
#		if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
#			card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#		else:
#			card.texture = load("res://textures/card_images/cover.jpg")
#		if card.get_index() < 24:
#			card.visible = true
##		if first_search_range > 18:#24:
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range-18]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range-18]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
##			if card.get_index() < 24:
##				card.visible = true
##		else:
##			if load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg"):
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
##			else:
##				card.texture = load("res://textures/card_images/cover.jpg")
##			if card.get_index() < 24:
##				card.visible = true
#
#
##	if last_search_range <= 24:
##		first_search_range = 0
#	#else:
#	#	first_search_range = last_search_range - 24
##	if first_search_range >=18 :
##		first_search_range -= 18
##		last_search_range = number_of_search_reasults - 24 +5
##	else:
##		last_search_range -= first_search_range
##		first_search_range = 0
#
#
#
#	print("first::=", first_search_range ,", last::=", last_search_range)
#	get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] = (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6))))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])
#
#	#pass # Replace with function body.
#
#
#func _on_apply_apperence_filters_pressed():
#	get_node("../apparence_window").visible = false
#	#pass # Replace with function body.
#
#
#func _on_settings_pressed():
#	get_node("../apparence_window").visible = true
#	#pass # Replace with function body.
#
#
#func _on_maxmize_pressed():
#	print(OS.get_window_size())
#	#OS.set_window_maximized(true)
#	OS.window_fullscreen = true
#	#print(OS.window_fullscreen)
#	get_node("../animated_backgound").set_size(Vector2(get_viewport().size))
#	# original (1024, 600)
#	#pass # Replace with function body.
#
#
#func _on_original_pressed():
#	OS.window_fullscreen = false
#	#pass # Replace with function body.
#
#
#func _on_up_Button_pressed():
#	print("range(",first_search_range,",",last_search_range,")")
#	if first_search_range > 0 :#and  last_search_range>= search_panel_col*6:#and  number_of_search_reasults-1> last_search_range:#and last_search_range>(search_panel_col*6)-1: #and last_search_range - first_search_range >= (search_panel_col*6)-1:#and first_search_range > search_panel_col*6:#- 1:#-(6*search_panel_col)+6:
#	#if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] != 547 -get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1]:
#		#print(first_search_range)
##		last_search_range -= 1
##		first_search_range -= 1
#		var previous_first_search_range = first_search_range
#		if first_search_range >= search_panel_col-1:
#			last_search_range -= search_panel_col
#			first_search_range -= search_panel_col
#		elif first_search_range < search_panel_col-1:
#			last_search_range -= first_search_range
#			first_search_range -= first_search_range
#
#		if first_search_range < 0:
#			first_search_range = 0
#		if last_search_range < search_panel_col-1:
#			last_search_range = search_panel_col-1
#
#
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] =  (float(first_search_range)/(number_of_search_reasults-((search_panel_col*6)-1)))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])#- ((6*search_panel_col)-1)))#-= ((float(search_panel_col )/ number_of_search_reasults))*(((547)))#-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])))
#		var inverted_search_panel_cards = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children()
#		inverted_search_panel_cards.invert()
#		for card in inverted_search_panel_cards:
##			#if card.get_index() <= 23 and card.get_index() != 0:
##			if card.get_index() > search_panel_col:
##				card.texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_child(card.get_index()-search_panel_col).texture
##			elif card.get_index() <= search_panel_col:
##				#card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
##				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#
#
#			if first_search_range >= search_panel_col-1:
#				if card.get_index() > search_panel_col:
#					card.texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_child(card.get_index()-search_panel_col).texture
#				elif card.get_index() <= search_panel_col:
#					#card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#					card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#			elif first_search_range < search_panel_col-1:
##				if card.get_index() > first_search_range:
#				if search_panel_col - first_search_range>0:
#					#print("case1")
#					if card.get_index() > search_panel_col - first_search_range:
##						card.texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_child(card.get_index()-first_search_range-(search_panel_col - first_search_range-(0))).texture
#						card.texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_child(card.get_index()-previous_first_search_range).texture
#						print("diff is :",search_panel_col - first_search_range)
#						print("already first range is:", first_search_range)
##					elif card.get_index() <= first_search_range:
#					elif card.get_index() <=search_panel_col - first_search_range:
#						#card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#						card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()]["id"])+".jpg")
#
#				elif search_panel_col - first_search_range==0:
#					print("case2")
#					if card.get_index() > search_panel_col - first_search_range:
#						card.texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_child(card.get_index()-1).texture
##					elif card.get_index() <= first_search_range:
#					elif card.get_index() <=search_panel_col - first_search_range:
#						#card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#						card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()]["id"])+".jpg")
#
##	if first_search_range < 0:
##		first_search_range = 0
#
##	if last_search_range < 5:
##		last_search_range = 5
##	if last_search_range> number_of_search_reasults -1:
##		last_search_range = number_of_search_reasults -1
#	#pass # Replace with function body.
#
#
#func _on_down_Button_pressed():
#	#get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] += (1.0 / number_of_search_reasults)*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])
#	print("range(",first_search_range,",",last_search_range,")")
#	if last_search_range < number_of_search_reasults - 1:#(6*search_panel_col) + 5: #number_of_search_reasults - 1:# number_of_search_reasults - (6*search_panel_col):
##	if last_search_range <= number_of_search_reasults -(2):#- 1:#-(6*search_panel_col)+6:
#	#if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] != 547 -get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1]:
#		#print("last search range is :::::::", last_search_range)
##		last_search_range += 1
##		first_search_range += 1
#		last_search_range += search_panel_col
#		first_search_range += search_panel_col
#
#		if last_search_range> number_of_search_reasults -1:
#			last_search_range = number_of_search_reasults -1
#
#		if last_search_range - first_search_range <search_panel_col-1:
#			first_search_range = last_search_range-search_panel_col-1
#
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").rect_position[1] =(float(first_search_range)/(number_of_search_reasults-((search_panel_col*6))))*(547-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])# - ((6*search_panel_col)-1)))#+= ((float(search_panel_col )/ number_of_search_reasults))*(((547)))#-get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/custom_scrollbar/scrollbar_BG/scrollbar").get_rect().size[1])))
#		for card in get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_children():
#			if card.get_index() < 23- search_panel_col:
#				card.texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").get_child(card.get_index()+search_panel_col).texture
#			else:
#				card.texture = load("res://textures/484x700/"+str(cards_database.query_result[card.get_index()+first_search_range]["id"])+".jpg")
#
##	if last_search_range> number_of_search_reasults -1:
##		last_search_range = number_of_search_reasults -1
###		last_search_range += search_panel_col
###		first_search_range += search_panel_col
##	if last_search_range - first_search_range <5:
##		first_search_range = last_search_range - 5
#	#pass # Replace with function body.


func _on_empty_card4_mouse_entered():
	#get_node("main_HSplitContainer/VBoxContainer/HBoxContainer/empty_card4").si = Vector2()
	pass # Replace with function body.
