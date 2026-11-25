extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#signal tw2_completed


onready var duel_system = get_node("../duel_field_animations")
onready var card_info_bar = $"../duel_screen_card_actions_script"
onready var rtl_phases_vfx = $"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/RTL_phases_vfx"
onready var rtl_turns_vfx = $"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/RTL_turns_vfx"
onready var screen_vfx = $"../screen_vfx"


onready var hover_on_frame = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/hover_on").duplicate()

var duel_cards = {}
var my_deck_cards = []
var my_hand_cards = []
var hovered_card = ""
var card_in_drawing_state = 0
var card_waiting_hand_tween = 0

onready var cardh_for_draw_anim = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/cardh_for_draw_anim")
onready var cardh_for_summon_anim = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/cardh_for_summon_anim")

onready var tw = create_tween()
onready var tw2 = get_node("../tw")
onready var twNode = get_node("../tw")
var generalCardPath = "../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/"
var testCardsList = ["card5","card3","card4", "card6", "card7"]

#var testDeckCardsList = ["C21","C20","C19","C18","C17","C16","C15","C14","C13","C12","C11","C10","C9","C8","C7","C6","C5","C4","C2","C1",]
var testDeckCardsList = ["C1","C2","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21"]

var test6DeckCardsList = ["C16","C17","C18","C19","C20","C21"]

var myHandPos = Vector3(0,2.474,5.3) # will be changed to be dynamic in x pos
var motionSpeed = 4

var tw2repeatation = 10
var tw2speed = 0.1
var tw2finished = false

var testDeckOrder = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]#, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60]
onready var deck = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/deckParent")

var duel_paths = {deck = "../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"}

var myHandRot = Vector3(0,270,50)

onready var active_hand_card = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hc1/hover_on")


# Called when the node enters the scene tree for the first time.
func _ready():

	deck_loading("test_deck")
	phase_change_animation("Draw")



func _on_AnimationPlayer2_animation_finished(anim_name):
#	var deck = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/deckParent")
	print("anim finished")
	if tw2finished == false:
		alt_rearrenging_deck(testDeckOrder, deck.get_children(),0.01,tw2speed)
		tw2.start()
	else:
		tw2finished = false


















func _on_screen_vfx_animation_finished(anim_name):
	rtl_phases_vfx.visible=false
	rtl_turns_vfx.visible=false
#	call_deferred("card_draw(n\"deckn\",my_deck_cards,5,motionSpeed-1.8)")
#	if rtl_phases_vfx.text  == "DRAW \n PHASE":
#		card_draw("deck",my_deck_cards,5,motionSpeed-1.8)
	pass # Replace with function body.







func phase_change_animation(current_phase):
	rtl_phases_vfx.visible = true
	if current_phase == "Draw":
		rtl_phases_vfx.text = "DRAW \n PHASE"
	elif current_phase == "Standby":
		rtl_phases_vfx.text = "STANDBY \n PHASE"
	elif current_phase == "Main1":
		rtl_phases_vfx.text = "MAIN \n PHASE1"
	elif current_phase == "Battle":
		rtl_phases_vfx.text = "BATTLE \n PHASE"
	elif current_phase == "Main2":
		rtl_phases_vfx.text = "MAIN \n PHASE2"
	elif current_phase == "End":
		rtl_phases_vfx.text = "END \n PHASE"
	screen_vfx.play("phase_change")

	pass



func deck_loading(deck):
	var loaded_deck = load("res://decks/"+deck+".gd").new()
	for card in loaded_deck.main:
		var card_properties = load("res://card_scripts/c"+card+".gd").new()
		var card_copy= 1
		if my_deck_cards.count(card) >0:
			card_copy += my_deck_cards.count(card)
		duel_cards["c"+card+"c"+str(card_copy)] = card_properties.cardProps
		duel_cards["c"+card+"c"+str(card_copy)]["modified"] = {}
		duel_cards["c"+card+"c"+str(card_copy)]["modified"]["place"] = "my_deck"
		my_deck_cards.append("c"+card+"c"+str(card_copy))
		var card_image = Image.new()
		var card_texture = ImageTexture.new()
		card_image.load("/Users/egycn/Downloads/484x700/"+card+".jpg")
		card_texture.create_from_image(card_image)
		var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/deck_card").duplicate()
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent").add_child(cardMesh)
		cardMesh.translation[1] = (loaded_deck.main.find(card)*0.01)
		cardMesh.set_surface_material(0, cardMesh.get_surface_material(0).duplicate())
		cardMesh.get_surface_material(0).albedo_texture = card_texture
		cardMesh.visible = true
		cardMesh.name = "c"+card+"c"+str(card_copy)
	randomize()
	my_deck_cards.shuffle()
	for deck_card in my_deck_cards:
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+deck_card).translation[1] = my_deck_cards.find(deck_card)*0.01
#	print(duel_cards)



func hover_on_card(card_pos):
	if hovered_card != "":
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+ hovered_card+"/hover_on").visible = false
	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+ card_pos+"/hover_on").visible = true
	
	hovered_card = card_pos
	pass







func card_draw(from,cards,number,speed):
	cards.invert()
	var cards_will_be_drawed = []
	var cards_will_be_drawed_count = 0
	if cards.size()<number:
		cards_will_be_drawed_count = cards.size()
	else:
		cards_will_be_drawed_count = number

	for i in range(0,cards_will_be_drawed_count):
		cards_will_be_drawed.append(cards[i])
	for card in cards_will_be_drawed:
		var drawed_card_location 
		var separation_error = 0#57.5*(cards.find(card)/844)
		var cardMesh = get_node(duel_paths[from]+card)
		var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

		var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
		card_in_hand_container.name = card
		
		my_hand_cards.append(card_in_hand_container.name)
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container)
		var card_in_hand = card_in_hand_container.get_children()[0]
		card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
		card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["original"],cardMesh.get_surface_material(0).albedo_texture])
		
		tw.tween_property(cardMesh,"translation",Vector3(-0.8,2.5,1),speed-2)
		tw.parallel().tween_property(cardMesh,"rotation_degrees",Vector3(0,-90,50),speed-2)
		tw.tween_property(cardh_for_draw_anim,"texture", cardMesh.get_surface_material(0).albedo_texture,0)#speed-2)
		tw.tween_property(cardMesh,"visible",false,0)#speed-2)
		tw.parallel().tween_property(cardh_for_draw_anim,"visible", true,0)#speed-2)
		
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = cardMesh.get_surface_material(0).albedo_texture
		
		tw.parallel().tween_property(card_in_hand,"texture", cardMesh.get_surface_material(0).albedo_texture,0)
		tw.tween_property(card_in_hand_container,"visible", true,0)
		
		var drawed_card_separation = ((my_hand_container.get_rect().size[0]/2)/(cards.find(card)+1))-115+(1/(cards.find(card)+1))
		if cards.find(card) ==0:
			drawed_card_location =Vector2((((my_hand_container.get_rect().size[0])/(cards.find(card)+2))*(cards.find(card)+1))+separation_error,0)
		else:
			drawed_card_location =Vector2((((my_hand_container.get_rect().size[0])/(cards.find(card)+2))*(cards.find(card)+1))+separation_error+drawed_card_separation,0)
		print( drawed_card_location, get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card).get_index())
		tw.parallel().tween_property(cardh_for_draw_anim,"rect_position:x",drawed_card_location[0],speed-2)
		tw.parallel().tween_property(cardh_for_draw_anim,"rect_scale",Vector2(1,1),speed-2)
		tw.parallel().tween_property(my_hand_container,"custom_constants/separation",drawed_card_separation,0)
		tw.tween_property(cardh_for_draw_anim,"visible", false,0)
		tw.tween_property(card_in_hand,"visible", true,0)
		tw.tween_property(cardh_for_draw_anim,"rect_position",Vector2(726,413),0)
		tw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0)
		




#func change_position(cards,option,speed):
#	for card in cards:
#		var cardMesh = get_node(generalCardPath+card)
#		if option == "face_up":
#			print("face upp")
#			to_faceup(cardMesh,speed)
#		elif option == "face_down":
#			to_facedown(cardMesh,speed)
#		elif option == "inverse_battle":
#			pass
#		elif option == "def":
#			to_def(cardMesh,speed)


#func send_to_hand(player,cards,speed):
#
#	for card in cards:
#		var cardMesh = get_node(generalCardPath+card)
#		#cardMesh.rotation_degrees[0] = 90
#		print(card,int(cardMesh.rotation_degrees[0]))
#		if int(cardMesh.get_rotation_degrees()[0]) == 180:
#			to_faceup(cardMesh,tw2speed)
#		else:
#			tw.tween_property(cardMesh, "rotation_degrees",Vector3(cardMesh.rotation_degrees[0],cardMesh.rotation_degrees[1],cardMesh.rotation_degrees[2]),speed+2)
#		tw.parallel().tween_property(cardMesh, "translation" , myHandPos, speed+2)

func card_movement_action(cardMesh,action,send_to, speed):
	#cardMesh.material/0:albedo_color= Color(1,1,1,0)
	
	var vfx_layer = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/AnimatedSprite3D")
	var vfx_particle = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/Sprite3D")
	if action == "tribute":
		cardMesh.get_surface_material(0).flags_transparent = true
		cardMesh.get_surface_material(1).flags_transparent = true
		cardMesh.get_surface_material(2).flags_transparent = true
		cardMesh.get_surface_material(1).albedo_color[3] = 0
		cardMesh.get_surface_material(2).albedo_color[3] = 0
		vfx_layer.play("card_tribution")
		tw.tween_property(cardMesh, "material/0:albedo_color",Color(1,1,1,0),speed+2)
		tw.parallel().tween_property(vfx_layer, "opacity",0.0,speed+2.8)
		tw.tween_property(vfx_particle,"translation",Vector3(4.24,0.4,2.33),speed+2)
#		tw.parallel().tween_property(cardMesh, "material/1:albedo_color",Color(0,0,0,0),speed)
#		tw.parallel().tween_property(cardMesh, "material/2:albedo_color",Color(0,0,0,0),speed)
	elif action == "destroy":
		pass
	elif action == "send":
		pass


#func to_faceup(cardMesh, speed) :
#	tw.tween_property(cardMesh, "rotation_degrees",Vector3(180,cardMesh.rotation_degrees[1],cardMesh.rotation_degrees[2]),speed+2)
#	#tw2.interpolate_property(cardMesh,"rotation_degrees:x",cardMesh.rotation["x"],180, speed,0,0, speed)
#
#func to_facedown(cardMesh, speed) :
#	tw.tween_property(cardMesh, "rotation_degrees",Vector3(-180,cardMesh.rotation_degrees[1],cardMesh.rotation_degrees[2]),speed+2)
#
#func to_def(cardMesh, speed) :
#	tw.tween_property(cardMesh, "rotation_degrees",Vector3(cardMesh.rotation_degrees[0],180,cardMesh.rotation_degrees[2]),speed+2)






func alt_rearrenging_deck(deckOrder, deckCards, cardH, speed):
	#deckOrder.erase(deckOrder.size())
#	tw2repeatation -=1
	var tempDeckOrder  = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
	for card in deckCards:
#	for c in range(0,tempDeckOrder.size()):
#		var card = deckCards[c]
#		if tempDeckOrder.size() != 0:
#			tw2.repeat = 0
		tempDeckOrder.shuffle()
		var scale: Vector3 = Vector3(card.global_transform[0][0], card.global_transform[1][1], card.global_transform[2][2])
		#print(card)
		var cardDeckOrder = tempDeckOrder[0]
		#tempDeckOrder.erase(carddeckOrder)
		var cardDeckMothion = sin(cardDeckOrder)
		var cardDeckMothion2 = sin(cardDeckOrder)
		var cardDeckMothion3 = sin(cardDeckOrder)
		var cardZaxis = card.translation[1]

		tw2.interpolate_property(card,"translation:y",card.translation["y"],((cardDeckOrder+1)*0.01), speed,0,0, speed)
		tw2.interpolate_property(card,"translation:z",card.translation["z"],cardDeckMothion/8, speed)
#		tw2.interpolate_property(card,"translation:y",card.translation["y"],((cardDeckOrder+1)*0.01), speed,0,0, speed)
#		tw2.interpolate_property(card,"translation:y",card.translation["y"],cardZaxis+0.2, speed,0,0, speed)
		tw2.interpolate_property(card,"translation:y",((cardDeckOrder+1)*0.01),((cardDeckOrder)*0.02), speed,0,0, speed)
		tw2.interpolate_property(card,"translation:z",cardDeckMothion/8,cardDeckMothion2/8, speed,0,1, speed)
		tw2.interpolate_property(card,"translation:y",((cardDeckOrder+1)*0.02),((cardDeckOrder)*0.01), speed,0,0, speed)
		tw2.interpolate_property(card,"translation:z",cardDeckMothion2/8,cardDeckMothion3/8, speed,0,1, speed)
		tw2.interpolate_property(card,"translation:y",((cardDeckOrder+1)*0.01),cardZaxis, speed,0,0, speed)
#		tw2.interpolate_property(card,"translation:y",cardZaxis+0.2,cardZaxis+0.1, speed,0,0, speed)
		tw2.interpolate_property(card,"translation:z",cardDeckMothion3/8, card.translation["z"] - card.translation["z"] , speed,1,0, speed)
#		tw2.interpolate_property(card,"translation:y",((cardDeckOrder+1)*0.02),cardZaxis, speed,0,0, speed)
#		tw2.interpolate_property(card,"translation:y",cardZaxis+0.1,cardZaxis, speed,0,0, speed)
#		tw2.start()
#		emit_signal("tw2_completed",deckOrder)
		deckOrder.erase(cardDeckOrder)
		print(deckOrder)
		
#		if deckOrder.size() != 0:
#			tw2.start()
		print(deckOrder.size())
#	emit_signal("tw2_completed",deckOrder)
#	tw2.start()


func _on_tw_tween_all_completed():
	print("receved")
#	alt_rearrenging_deck(testDeckOrder, deck.get_children(),0.01,0.5)
	#tw2.start()
	#deckOrder.erase(0)
#	alt_rearrenging_deck(testDeckOrder, deck.get_children(),0.01,0.5)
	tw2repeatation -=1
	if tw2repeatation>0:
		alt_rearrenging_deck(testDeckOrder, deck.get_children(),0.01,tw2speed)
		tw2.start()
#		tw2.repeat =  1
###		deckOrder.erase(deckOrder.size())
#		#alt_rearrenging_deck(testDeckOrder, deck.get_children(),0.01,0.5)
##		tw2.start()
	else:
		tw2.stop_all()
		tw2finished = true
		get_node("../AnimationPlayer2").play_backwards("test2")
#		tw2.repeat =  0
#		tw2repeatation = 5
	print(tw2repeatation,"ppp")
#	print(deckOrder.size())
#	#tw2.stop()
#	alt_rearrenging_deck(deckOrder, deck.get_children(),0.01,0.5)
#
#	pass # Replace with function body.

		
		
		
		
		



func rearrenging_deck( deckCards, cardH, speed):
	var tw2 = get_node("../tw")
	var deckOrder = [0,1,2,3,4,5,6,7,8,9,10]
	for card in deckCards:
		#if deckOrder.size() != 0:
			#tw2.repeat = 1
		var cardDeckOrder = deckOrder[randi()% deckOrder.size()]
		var cardDeckMothion = rand_range(-2,2)
		var cardDeckMothion2 = rand_range(-2,2)
		var cardDeckMothion3 = rand_range(-2,2)
#		tw2.interpolate_property(card,"translation:z",card.translation["z"],pow(-1,card.get_index())/10, speed)
		tw2.interpolate_property(card,"translation:z",card.translation["z"],cardDeckMothion/10, speed)
		tw2.interpolate_property(card,"translation:z",cardDeckMothion/10,cardDeckMothion2/10, speed,0,0, speed)
		tw2.interpolate_property(card,"translation:z",cardDeckMothion2/10,cardDeckMothion3/10, speed,0,0, speed)
#		tw2.interpolate_property(card,"translation:z",pow(-1,card.get_index())/10, card.translation["z"] - card.translation["z"] , speed,Tween.TRANS_ELASTIC,0, 1)
		tw2.interpolate_property(card,"translation:z",cardDeckMothion3/10, card.translation["z"] - card.translation["z"] , speed,0,0, speed)
		tw2.interpolate_property(card,"translation:y",card.translation["y"],cardDeckOrder*cardH*rand_range(-2,2), speed,0,0, speed)
		tw2.start()
#		tw2.repeat = 1
		deckOrder.remove(cardDeckOrder)
		#print(deckOrder.size())







func _on_normalSummBtn_pressed(a):
	print("zzzzzzzzzzzzzzzz ",a)
	pass # Replace with function body.








