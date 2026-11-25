extends Panel

const SQLite = preload("res://addons/godot-sqlite/bin/gdsqlite.gdns")
onready var cards_database = SQLite.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var monster_type_dictionary = [["Warrior"], ["Spellcaster"], ["Fairy"], ["Fiend"], ["Zombie"], ["Machine"], ["Illusion"], ["Aqua"], ["Pyro"], ["Rock"], ["Winged-Beast"], ["Plant"], ["Insect"], ["Thunder"], ["Dragon"], ["Beast"], ["Beast-Warrior"], ["Dinosaur"], ["Fish"], ["Sea-Serpent"], ["Reptile"], ["Psychic"], ["Divine-Beast"], ["Diviner-Beast"], ["Wyrm"], ["Cyverse"]]
var monster_type_values_list =  [1,2,4,8,16,32,33554432,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216]
var attribute_values_list = [1,2,4,8,16,32,64]
var numbers_search_operators_list = ["==",">","<",">=","<=","!=", "BETWEEN"]

var text_search = "In"
var attribute_search = "In"
var monster_card_type_search = "In"
var monster_type_search = "In"
var atk_search_1 = "In"
var atk_search_2 = "In"
var def_search_1 = "In"
var def_search_2 = "In"
var level_rank_search_1 = "In"
var level_rank_search_2 = "In"
var link_marks_search = "In"
var link_size_search_1 = "In"
var link_size_search_2 = "In"
var pendulum_scale_search_1 = "In"
var pendulum_scale_search_2 = "In"
#var atk_search_operation
#var def_search_operation
#var level_rank_search_operation
var link_size_search_operation
var pendulum_scale_operation


var selected_monster_type = 0
var selected_attribute = 0
var selected_monster_card_type = 0

var monster_type_List_animation = false


signal search_complete(saved_search_results)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_text_CheckButton_pressed():
	if get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton").pressed == true and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton2").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton3").pressed == false:
		get_node("../main_search_window/main_VBoxContainer/name_container/TextEdit").editable = true
	elif get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton2").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton3").pressed == false:
		get_node("../main_search_window/main_VBoxContainer/name_container/TextEdit").editable = false
	#pass # Replace with function body.


func _on_text_CheckButton2_pressed():
	if get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton2").pressed == true and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton3").pressed == false:
		get_node("../main_search_window/main_VBoxContainer/name_container/TextEdit").editable = true
	elif get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton2").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton3").pressed == false:
		get_node("../main_search_window/main_VBoxContainer/name_container/TextEdit").editable = false

	#pass # Replace with function body.


func _on_text_CheckButton3_pressed():
	if get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton2").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton3").pressed == true:
		get_node("../main_search_window/main_VBoxContainer/name_container/TextEdit").editable = true
	elif get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton2").pressed == false and get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton3").pressed == false:
		get_node("../main_search_window/main_VBoxContainer/name_container/TextEdit").editable = false

	#pass # Replace with function body.


func _on_atk_def_CheckButton_pressed():
	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer/atk_def_CheckButton").pressed == true:
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").disabled = false
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit2").editable = true
		if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").get_selected_id() == 6:
			get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit3").editable = true

	else:
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").disabled = true
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit2").editable = false
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit3").editable = false
	#pass # Replace with function body.





func _on_atk_def_OptionButton_toggled(button_pressed):
	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").get_selected_id() == 6:
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit3").editable = true
	else:
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit3").editable = false

	#pass # Replace with function body.


func _on_atk_def_CheckButton2_pressed():
	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer/atk_def_CheckButton2").pressed == true:
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").disabled = false
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit4").editable = true
		if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").get_selected_id() == 6:
			get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit5").editable = true
		get_node("../main_search_window/Panel/monster_search_window/link_container/link_CheckButton").pressed = false
		get_node("../main_search_window/Panel/monster_search_window/link_container/link_Button").disabled = true

	else:
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").disabled = true
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit4").editable = false
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit5").editable = false

	#pass # Replace with function body.


func _on_atk_def_OptionButton2_toggled(button_pressed):
	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").get_selected_id() == 6:
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit5").editable = true
	else:
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit5").editable = false
	#pass # Replace with function body.


func _on_monster_type_CheckButton_pressed():
	if get_node("../main_search_window/Panel/monster_search_window/type_container/monster_type_CheckButton").pressed == true:
		get_node("../main_search_window/Panel/monster_search_window/type_container/monster_type_Button").disabled = false
	else:
		get_node("../main_search_window/Panel/monster_search_window/type_container/monster_type_Button").disabled = true
	#pass # Replace with function body.


func _on_monster_type_Button_pressed():
	get_node("../monster_type_List").visible = true
	get_node("../dark_Bg2").visible = true
	#pass # Replace with function body.

func _on_link_Button_pressed():
	get_node("../link_arrows_window").visible = true
	get_node("../dark_Bg2").visible = true
	#pass # Replace with function body.

func _on_included_link_list_item_activated(index):
	get_node("../link_arrows_window").visible = false
	get_node("../dark_Bg2").visible = false

#func _on_monster_type_List_item_selected(index):
#	if selected_monster_type == index:
#		get_node("../monster_type_List").visible = false
#	else:
#		selected_monster_type = index
#	#pass # Replace with function body.


func _on_monster_type_List_item_activated(index):
	get_node("../monster_type_List").visible = false
	get_node("../dark_Bg2").visible = false
	selected_monster_type = index
	get_node("../main_search_window/Panel/monster_search_window/type_container/monster_type_Button").icon = get_node("../monster_type_List").get_item_icon(index)
	get_node("../main_search_window/Panel/monster_search_window/type_container/monster_type_Button").text = get_node("../monster_type_List").get_item_text(index)
	#pass # Replace with function body.


func _on_attribute_CheckButton_pressed():
	if get_node("../main_search_window/Panel/monster_search_window/attribute_container/attribute_CheckButton").pressed == true:
		get_node("../main_search_window/Panel/monster_search_window/attribute_container/attribute_Button").disabled = false
	else:
		get_node("../main_search_window/Panel/monster_search_window/attribute_container/attribute_Button").disabled = true

func _on_attribute_Button_pressed():
	get_node("../attributes_List").visible = true
	get_node("../dark_Bg2").visible = true


func _on_attributes_List_item_activated(index):
	get_node("../attributes_List").visible = false
	get_node("../dark_Bg2").visible = false
	selected_attribute = index
	get_node("../main_search_window/Panel/monster_search_window/attribute_container/attribute_Button").icon = get_node("../attributes_List").get_item_icon(index)
	get_node("../main_search_window/Panel/monster_search_window/attribute_container/attribute_Button").text = get_node("../attributes_List").get_item_text(index)



func _on_monster_card_type_CheckButton_pressed():
	if get_node("../main_search_window/Panel/monster_search_window/card_type_container/monster_card_type_CheckButton").pressed == true:
		get_node("../main_search_window/Panel/monster_search_window/card_type_container/monster_card_type_Button").disabled = false
	else:
		get_node("../main_search_window/Panel/monster_search_window/card_type_container/monster_card_type_Button").disabled = true



func _on_link_CheckButton_pressed():
	if get_node("../main_search_window/Panel/monster_search_window/link_container/link_CheckButton").pressed == false:
		get_node("../main_search_window/Panel/monster_search_window/link_container/link_Button").disabled = true
	else:
		get_node("../main_search_window/Panel/monster_search_window/link_container/link_Button").disabled = false
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer/atk_def_CheckButton2").pressed = false
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").disabled = true
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit4").editable = false
		get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit5").editable = false


func _on_monster_card_type_Button_pressed():
	get_node("../monster_card_type_window").visible = true
	get_node("../dark_Bg2").visible = true



func _on_monster_card_type_List_item_activated(index):
	get_node("../monster_card_type_window").visible = false
	get_node("../dark_Bg2").visible = false
	selected_monster_card_type = index
	get_node("../main_search_window/Panel/monster_search_window/card_type_container/monster_card_type_Button").icon = get_node("../monster_card_type_window/monster_card_type_List").get_item_icon(index)
	get_node("../main_search_window/Panel/monster_search_window/card_type_container/monster_card_type_Button").text = get_node("../monster_card_type_window/monster_card_type_List").get_item_text(index)



func _on_level_rank_CheckButton_pressed():
	if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_CheckButton").pressed == true and get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_CheckButton2").pressed == false:
		get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit").editable = true
		get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").disabled = false
		if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").get_selected_id() == 6:
			get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit2").editable = true
		else:
			get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit2").editable = false
	elif get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_CheckButton").pressed == false and get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_CheckButton2").pressed == false:
		get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit").editable = false
		get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit2").editable = false
		get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").disabled = true

	#pass # Replace with function body.


func _on_level_rank_OptionButton_toggled(button_pressed):
	if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").get_selected_id() == 6:
		get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit2").editable = true
	else:
		get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit2").editable = false



func _on_apply_search_filters_pressed():
	
	var type_effect = [33554465,33,16777249,33558561,50331681,2097185,4129,5153,1057,2081,18874401,545,16781345,37748769,2101281,33554977,16777761]
	var type_synchro = [8225,16785441,12321,8193]
	var type_fusion = [97,16777313,4193,65,4161]
	var type_xyz = [8388641,25165857,8388609]
	var type_link = [67108897,67108865]
	var type_normal = [17,4113,16777233,16781329]
	var type_token = [16401,20497]
	var type_ritual = [129,161,4257,673,16777377,     2097313]
	var type_spell = [524290,262146,131074,65538,130,2]
	var type_trap = [1048580,131076,4]
	var subtype_effect = [33,2097185,4129,5153,2081,18874401,545,16781345,37748769,4194337,2101281,33554977,16777761,33554465,33558561,50331681,16777249,8225,12321,97,4193,8388641,67108897,161,4257,673,16777377,16785441,16777313,25165857]
	var subtype_special_summon = [33554465,33558561,50331681,37748769,33554977]
	var subtype_pendulum = [16777249,50331681,18874401,16781345,16777761,16785441,16777313,25165857,16777233,16781329,16777377]
	var subtype_tuner = [33558561,4129,5153,16781345,2101281,12321,4193,4161,4113,16781329,20497,4257]
	var subtype_flip = [2097185,18874401,2101281]
	var subtype_union = [5153,1057]
	var subtype_gemini = [2081]
	var subtype_spirit = [545,33554977,16777761,673]
	var subtype_toon = [37748769,4194337]
	var subtype_none_effect_nor_normal = [8193,65,4161,8388609,67108865,129]
	
	var t_arrow =  [128,130,131,132,133,134,135,136,138,139,160,161,162,163,166,168,170,173,175,196,387,388,390,422,448,490,384]
	var tl_arrow =  [64,66,68,69,77,196,325,448,490]
	var l_arrow =  [8,9,10,12,14,40,41,42,43,45,46,47,77,136,138,139,168,170,173,175,490]
	var bl_arrow =  [1,3,5,7,9,33,39,41,43,45,47,69,77,131,133,135,139,161,163,173,175,257,325,387,37]
	var b_arrow =  [2,3,6,7,10,14,34,38,39,42,43,46,47,66,130,131,134,135,138,139,162,163,166,170,175,387,390,422,490]
	var br_arrow =  [4,5,6,7,12,14,36,38,39,45,46,47,68,69,77,132,133,134,135,166,173,175,196,260,325,388,390,422,37]
	var r_arrow =  [32,33,34,36,38,39,40,41,42,43,45,46,47,160,161,162,163,166,168,170,173,175,422,490,37,288]
	var tr_arrow = [256,257,260,325,387,388,390,422,448,490,288,384]
	
	
	
#var subtype_normal_spell = []

	var included_monster_card_type = [type_normal,type_effect,type_ritual,type_fusion,type_synchro,type_xyz,type_link]
	var excluded_monster_card_subtype = [subtype_special_summon,subtype_spirit,subtype_toon,subtype_gemini,subtype_flip,subtype_union,subtype_tuner,subtype_pendulum,type_token]

	
	
	
	
	var text_search_value
	var attribute_value
	var monster_type_value
	var monster_card_type_value
	var level_rank1_value
	var level_rank2_value
	var atk1_value
	var atk2_value
	var def1_value
	var def2_value
	var atk_search_operation
	var def_search_operation
	var level_rank_search_operation


	var atk_search_statement
	var def_search_statement
	var level_rank_search_statement
	var finale_search_statement


	var error_msg = ""
	var there_is_an_error = false
	
	var name_text_search = ""
	var desc_text_search = ""
	
	var monster_card_type_list_search = ""
	var temp_monster_card_type_list = []
	
	var temp_link_arrows_list = []
	var link_arrows_itemlist = [tl_arrow,t_arrow,tr_arrow,l_arrow,"",r_arrow,bl_arrow,b_arrow,br_arrow]


	if get_node("../main_search_window/Panel/monster_search_window/link_container/link_CheckButton").pressed == true:
		if get_node("../link_arrows_window/included_link_list").get_selected_items().empty():
			temp_link_arrows_list = [64,66,68,69,77,196,325,448]
		else:
			for item in get_node("../link_arrows_window/included_link_list").get_selected_items():
				print("item", item)
				for subitem in link_arrows_itemlist[item]:
					temp_link_arrows_list.append(subitem)
#					print("subitem", subitem)
#					#temp_link_arrows_list += subitem
#				#temp_link_arrows_list.append()
#					for arrow in subitem:
#						print("arrow",arrow)
#						temp_link_arrows_list.append(arrow)
					
		#print("test1", temp_link_arrows_list)
		if get_node("../link_arrows_window/excluded_link_list").get_selected_items().empty() == false:
			for item in get_node("../link_arrows_window/excluded_link_list").get_selected_items():
				for subitem in link_arrows_itemlist[item]:
					if subitem in temp_link_arrows_list:
						temp_link_arrows_list.remove(temp_link_arrows_list.find(subitem))
#					for arrow in subitem:
#						if arrow in temp_link_arrows_list:
#							temp_link_arrows_list.remove(temp_link_arrows_list.find(arrow))
		#print("test2", temp_link_arrows_list)
		
		def_search_statement ="" #"in ("
		for arrows in temp_link_arrows_list:
			def_search_statement += "," + str(arrows)
		def_search_statement.erase(0,1)
#		def_search_statement+=")"
		def_search_statement = "in (" + def_search_statement + ")"
		print("test3",def_search_statement)
		#print(temp_link_arrows_list)
	
	
	
	
	
	
	if get_node("../main_search_window/Panel/monster_search_window/card_type_container/monster_card_type_CheckButton").pressed == true:
		if get_node("../monster_card_type_window/monster_card_type_List").get_selected_items().empty():
			monster_card_type_list_search = "17,4113,16777233,16781329"
		else:
			temp_monster_card_type_list = included_monster_card_type[get_node("../monster_card_type_window/monster_card_type_List").get_selected_items()[0]]
				
		if get_node("../monster_card_type_window/monster_subtype_List").get_selected_items().empty()==false:
			print("list test ")
			for item in get_node("../monster_card_type_window/monster_subtype_List").get_selected_items():
				#print("item",item)
				for subtype in excluded_monster_card_subtype[item]:
					temp_monster_card_type_list.remove(temp_monster_card_type_list.find(subtype))
					#print(temp_monster_card_type_list)
					#print("sub",subtype)
#				for subtype in item:
#					if subtype in temp_monster_card_type_list:
#						temp_monster_card_type_list.remove(subtype)
						
		for temp_type in temp_monster_card_type_list:
			monster_card_type_list_search += "," + str(temp_type)
	else:
		monster_card_type_list_search = "33554465,33,16777249,8225,97,8388641,16777313,16785441,25165857,67108897,17,16401,67108865,129,161,16777280,16777344,16777472,4193,12321,8193,65,4161,33558561,50331681,2097185,4129,5153,4113,1057,2081,8388609,18874401,4257,20497,16777233,545,673,16781345,16781329,37748769,4194337,16777377,2101281,33554977,16777761,1048580,524290,262146,131076,131074,65538,16384,130,4,2"
	
	
	
	
	
	
	if get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton").pressed == true:
		name_text_search = get_node("../main_search_window/main_VBoxContainer/name_container/TextEdit").text
	else:
		name_text_search = ""
	
	if get_node("../main_search_window/main_VBoxContainer/name_container/text_CheckButton2").pressed == true:
		desc_text_search = get_node("../main_search_window/main_VBoxContainer/name_container/TextEdit").text
	else:
		desc_text_search = ""
	
	
	
	
	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer/atk_def_CheckButton").pressed == true:
		if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit2").text.is_valid_integer():
			atk1_value =get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit2").text
		else:
			error_msg += "atk 1 must be integer number \n"
			there_is_an_error = true
			#print("atk must be integer number")
	else:
		atk1_value = "BETWEEN -2 and 5001"




	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").disabled == false and get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").get_selected_id() == 6:
		if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit3").text.is_valid_integer():
			atk2_value = get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit3").text
		else:
			error_msg += "atk 2 must be integer number \n"
			there_is_an_error = true
	else:
		pass


	



	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer/atk_def_CheckButton2").pressed == true:
		if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit4").text.is_valid_integer():
			def1_value = get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit4").text
		else:
			error_msg += "def 1 must be integer number \n"
			there_is_an_error = true
			#print("atk must be integer number")
	else:
		def1_value = "BETWEEN -2 and 5001"




	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").disabled == false and get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").get_selected_id() == 6:
		if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit5").text.is_valid_integer():
			def2_value = get_node("../main_search_window/Panel/monster_search_window/atk_def_container/GridContainer/TextEdit5").text
		else:
			error_msg += "def 2 must be integer number \n"
			there_is_an_error = true
	else:
		pass




	if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_CheckButton").pressed == true:
		if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit").text.is_valid_integer():
			level_rank1_value = get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit").text
		else:
			error_msg += "level/rank 1 must be integer number \n"
			there_is_an_error = true
			#print("atk must be integer number")
	else:
		level_rank1_value = "BETWEEN 0 and 14"
		
	if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").disabled == false and get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").get_selected_id() == 6:
		if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit2").text.is_valid_integer():
			level_rank2_value = get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_TextEdit2").text
		else:
			error_msg += "level/rank 2 must be integer number \n"
			there_is_an_error = true
	else:
		pass


	if get_node("../main_search_window/Panel/monster_search_window/type_container/monster_type_CheckButton").pressed == true:
		if get_node("../monster_type_List").get_selected_items().empty():
			monster_type_value = "=="+str(monster_type_values_list[0])
		else:
			monster_type_value = "=="+str(monster_type_values_list[get_node("../monster_type_List").get_selected_items()[0]])
	else:
		monster_type_value = "BETWEEN 0 and 16777217"
	
	if get_node("../main_search_window/Panel/monster_search_window/attribute_container/attribute_CheckButton").pressed == true:
		if get_node("../attributes_List").get_selected_items().empty():
			attribute_value = "=="+str(attribute_values_list[0])
		else:
			attribute_value = "=="+str(attribute_values_list[get_node("../attributes_List").get_selected_items()[0]])
	else:
		attribute_value = "BETWEEN 0 and 65"
		
	
	
	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").disabled == false:
		if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").get_selected_id() != 6:
			atk_search_statement = numbers_search_operators_list[get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").get_selected_id()]+" "+atk1_value
		else:
			atk_search_statement = numbers_search_operators_list[get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton").get_selected_id()]+" "+atk1_value+" and "+atk2_value
	else:
		atk_search_statement = atk1_value

	if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").disabled == false:
		if get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").get_selected_id() != 6:
			def_search_statement = numbers_search_operators_list[get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").get_selected_id()]+" "+def1_value
		else:
			def_search_statement = numbers_search_operators_list[get_node("../main_search_window/Panel/monster_search_window/atk_def_container/VBoxContainer2/atk_def_OptionButton2").get_selected_id()]+" "+def1_value+" and "+def2_value
	else:
		if get_node("../main_search_window/Panel/monster_search_window/link_container/link_CheckButton").pressed == false:
			def_search_statement = def1_value


	if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").disabled == false:
		if get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").get_selected_id() != 6:
			level_rank_search_statement = numbers_search_operators_list[get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").get_selected_id()]+" "+level_rank1_value
		else:
			level_rank_search_statement = numbers_search_operators_list[get_node("../main_search_window/Panel/monster_search_window/level_rank_container/level_rank_OptionButton").get_selected_id()]+" "+level_rank1_value+" and "+level_rank2_value
	else:
		level_rank_search_statement = level_rank1_value
		
	if monster_card_type_list_search[0] == ",":
		monster_card_type_list_search.erase(0,1)
#	print("aaaaaaaaaaaaaaaa>>>>>>>>>>>>>>>>> "+ monster_card_type_list_search[0])
#	print("monster_card_type_list_search : "+monster_card_type_list_search)
#	print("monster_card_type_list_search[0]: "+ monster_card_type_list_search[0])
#	monster_card_type_list_search.erase(0,1)
	#name_text_search.erase(0,1)
	#desc_text_search.erase(0,1)

#	finale_search_statement = "SELECT * FROM datas WHERE (ot BETWEEN 0 and 11) and (alias BETWEEN 0 and 99267150) and (setcode BETWEEN 0 and 36592129229979791) and (atk " + str(atk_search_statement)+") and (def "+str(def_search_statement)+") and (level "+str(level_rank_search_statement)+") and (attribute "+str(attribute_value)+ ") and (race "+str(monster_type_value)+") and (category BETWEEN -2147483648 and 3758358528);"
	finale_search_statement = "SELECT * FROM datas INNER JOIN texts ON texts.id = datas.id WHERE (ot BETWEEN 0 and 11) and (alias BETWEEN 0 and 99267150) and (setcode BETWEEN 0 and 36592129229979791) and (atk " + str(atk_search_statement)+") and (def "+str(def_search_statement)+") and (level "+str(level_rank_search_statement)+") and (attribute "+str(attribute_value)+ ") and (race "+str(monster_type_value)+") and (category BETWEEN -2147483648 and 3758358528) and (name LIKE \"%"+name_text_search+"%\") and (desc LIKE \"%"+desc_text_search+"%\") and type in ("+monster_card_type_list_search+");"


	if there_is_an_error == true:
		get_node("../error_window").visible = true
		get_node("../dark_Bg2").visible = true
		get_node("../error_window/error_Label").text = error_msg
	else:
		cards_database.path = "res://cards_data/cards.db"
		cards_database.open_db()
		print(finale_search_statement)
		cards_database.query(finale_search_statement)
#		print(cards_database.query_result)
#		print(finale_search_statement)
		print(cards_database.query_result.size())
		cards_database.close_db()
		get_node("../main_search_window").visible = false
		get_node("../dark_Bg").visible = false
		get_node("../error_window").visible = true
		get_node("../dark_Bg2").visible = true
		get_node("../error_window/error_Label").text = "search completed, number of founded results: \n" + str(cards_database.query_result.size())
		emit_signal("search_complete",cards_database.query_result)

#		print(atk_search_statement , def_search_statement, level_rank_search_statement, attribute_value, monster_type_value)

func _on_error_Button_pressed():
		get_node("../error_window").visible = false
		get_node("../dark_Bg2").visible = false


