extends PanelContainer


## predfined nodes--------------------------------------------------------------
onready var duel_system = $"."
onready var card_info_bar = $"../duel_screen_card_actions_script"
onready var rtl_phases_vfx = $"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/RTL_phases_vfx"
onready var rtl_turns_vfx = $"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/RTL_turns_vfx"
onready var screen_vfx = $"../screen_vfx"
#onready var hover_on_frame = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/hover_on").duplicate()
onready var cardh_for_draw_anim = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/cardh_for_draw_anim")
onready var cardh_for_summon_anim = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/cardh_for_summon_anim")
onready var tw = create_tween()
onready var tw2 = get_node("../tw")
onready var twNode = get_node("../tw")

onready var cardd_for_deck_anim = $"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/cardd_for_deck_anim"
#===============================================================================

## duel cards dictionary--------------------------------------------------------
var duel_cards = {}
#===============================================================================

## current hover_on event's card------------------------------------------------
var hovered_card = ""
#===============================================================================

var generalCardPath = "../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/"
var testCardsList = ["card5","card3","card4", "card6", "card7"]

#var testDeckCardsList = ["C21","C20","C19","C18","C17","C16","C15","C14","C13","C12","C11","C10","C9","C8","C7","C6","C5","C4","C2","C1",]
var testDeckCardsList = ["C1","C2","C4","C5","C6","C7","C8","C9","C10","C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21"]

var test6DeckCardsList = ["C16","C17","C18","C19","C20","C21"]

#var myHandPos = Vector3(0,2.474,5.3) # will be changed to be dynamic in x pos


var tw2repeatation = 10
var tw2speed = 0.1
var tw2finished = false

var testDeckOrder = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]#, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60]
onready var deck = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/deckParent")

#var duel_paths = {deck = "../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"}

#var myHandRot = Vector3(0,270,50)
#
#onready var active_hand_card = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hc1/hover_on")
#
#

##----------------notes---------------------------------------------------------
##------------------------------------------------------------------------------
## nmw is"need more work"
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------


##----------------duel events signals-------------------------------------------
##------------------------------------------------------------------------------

##------------------------------------------------------------------------------
##------------------------------------------------------------------------------


##----------------duel events history-------------------------------------------
##------------------------------------------------------------------------------
#var duelEvents = {1:{dp= [["pl1",["draw","normal",["c10000c1"]]]]}} #nmw
	# {turn:{ phase :[ [player,[action]],[player,[action]]... ]}}
	# actions:
	#["draw","normal","c10000c1"]
	#["draw","effect","c0000c1e1","c10000c1"]
	#["summon","normal","normal","c10000c1"]
	#["summon","normal","effect","c0000c1e1","c10000c1"]
	#["summon","tribute","normal",["c111c1","c111c2","c111c3"],"c10000c1"]
	#["summon","tribute","effect","c0000c1e1",["c111c1","c111c2","c111c3"],"c10000c1"]
	#["summoned","tribute","c1233c1"]
	#["summonfiled","tribute","c1233c1"]
	#[activate,c11c1e1,destroy.[c111c1,c222c1,c111c2]]
	#[cost,c11c1e1,destroy.[c111c1,c222c1,c111c2]]
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------


##----------------duel statistics--nmw------------------------------------------
##------------------------------------------------------------------------------
   #var pl1lp = 8000
var statistics = {
	pl1AtkCount = {10:[]}, # level: number of cards with that level
	pl1KnownAtkCount = {10:1},
	pl1mTotalAtk = 0,
	pl1mTotalKnownAtk = 0,
	pl1mTotalDef = 0,
	pl1mTotalKnownDef = 0,
}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------


var field_zone_locations = {
	pl1 = { 
		m1= Vector3(-2.966,0.5,1.861),
		m2 = Vector3(-1.483,0.5,1.861),
		m3 = Vector3(-0.015,0.5,1.861),
		m4 = Vector3(1.468,0.5,1.861),
		m5 = Vector3(2.936,0.5,1.861),
		st1= Vector3(-2.966,0.5,3.326),
		st2 = Vector3(-1.483,0.5,3.326),
		st3 = Vector3(-0.015,0.5,3.326),
		st4 = Vector3(1.468,0.5,3.326),
		st5 = Vector3(2.936,0.5,3.326),
		grave = Vector3(4.203,0.5,2.479),
		extraDeck = Vector3(-4.216,0.5,4.088),
		deck = Vector3(4.189,0.5,4.088),
		removed = Vector3(4.203,0.5,0.873),
		spField = Vector3(-4.216,0.5,2.479)
	}
}



var auto_zone_selection_order = ["m3","m2","m4","m1","m5"]
var auto_zone_selection_enable = true

var pl1_m_zones_card = []

##----------------player 1 "pl1" characteristics--------------------------------
##------------------------------------------------------------------------------
var players = {
	pl1 = {
		lifePoint = 8000,  # life point
		field = {m={m1={},m2={},m3={},m4={},m5={}},##,mEx={mEx1={},mEx2={}},
				st1={},st2={},st3={},st4={},st5={},sf={},sp1={},sp2={}},
		deck = [],
		extraDeck = [],
		grave = [],
		removed = [],
		spField = "",
		hand = [],
#		canSummon = { flip = [ {} ], normal = [ {} ], tribute = [ {} ], ritual = [ {} ], special = [ {} ], fusion = [ {} ], synchro = [ {} ], xyz = [ {} ], pendulum = [ {} ], link = [ {} ] },
		canSummon = [ {} ], # element is [ {card with specific props},
		canAdd = [ {} ],
		canDraw = true,
		canSee = [],
		canAttack = [ {} ],
		canChangePosition = [ {} ],
#		canTargetForEffect = [ {} ],
		carTargetForAttack = [ {} ],
		canActivateEffect = [ {} ],
		canSet = [ {} ],
		canChangePhase = [ {} ],
		maxNumberOfSummons = [ {} ],
		maxNumberOfAttacks = [ {} ],
		maxNumberOfEffectActivations = [ {} ],
		maxNumberOfDraws = [ {} ],
		
		},

	pl2 = {
		lifePoint = 8000,  # life point
		field = {m={m1={},m2={},m3={},m4={},m5={}},##,mEx={mEx1={},mEx2={}},
				st1={},st2={},st3={},st4={},st5={},sf={},sp1={},sp2={}},
		deck = [],
		extraDeck = [],
		grave = [],
		removed = [],
		hand = [],
		canSummon = { flip = [ {} ], normal = [ {} ], tribute = [ {} ], ritual = [ {} ], special = [ {} ], fusion = [ {} ], synchro = [ {} ], xyz = [ {} ], pendulum = [ {} ], link = [ {} ] },
		canAdd = [ {} ],
		canDraw = true,
		canSee = [],
		canAttack = [ {} ],
		canChangePosition = [ {} ],
#		canTargetForEffect = [ {} ],
		carTargetForAttack = [ {} ],
		canActivateEffect = [ {} ],
		canSet = [ {} ],
		canChangePhase = [ {} ],
		}
		}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------

## system events----------------------------------------------------------------
var sys_events = {
	draw_for_duel_starting= "",
	#phase_change
}
#===============================================================================

var motionSpeed = 2.1#4


## chain of actions/activations-------------------------------------------------
#var chain = [{activator = "sys",effect_order = 1,function = "draw", parameters = ["pl1",49]}]
#var chain = []
#===============================================================================
#var events_need_to_tween = ["pl1_draw_card"]
var recorded_events = {1:[]}

var current_turn = 1
var turn_owner = "pl1"
#var test_avilabe_effects = {"c11111c1":[1]} #
var is_player_will_activate_effect = false

#var events_list = [ ["phase_change_animation",["Standby"]] ,  ["phase_change_animation",["Draw"]] , ["pl1_draw_card",[]] , ["pl1_draw_card",[]] , ["pl1_draw_card",[]] , ["phase_change_animation",["Main1"]] , ]
var events_list = [ ["phase_change_animation",["Standby"]] ,  ["phase_change_animation",["Draw"]]  , ["pl1_draw_card",[5]] , ["phase_change_animation",["Main1"]] , ]

var card_textures = {}
#var events_list = [ ["phase_change_animation",["Standby"]] ,  ["phase_change_animation",["Draw"]] , ["pl1_draw_card_old",[]] , ["pl1_draw_card_old",[]] , ["pl1_draw_card_old",[]] , ["pl1_draw_card_old",[]] , ["pl1_draw_card_old",[]] , ["phase_change_animation",["Main1"]] , ]
# Called when the node enters the scene tree for the first time.
var current_state = ""
var current_selected_cards = []
var min_current_card_selection_number = 0
var max_current_card_selection_number = 0

signal selection_completed


func _ready():
	cardh_for_draw_anim.visible = false
	cardd_for_deck_anim.visible = false

#	tw.connect("finished",duel_system,"on_tw_finished")
#
	deck_loading("test_deck")
	apply_changes()
#	yield(pl1_hand_loading(),"completed")
#	pl1_draw_card(5)
	run_event()
#	print("aaaaa")
#	pl1_draw_card()
#	pl1_draw_card_pt2()
#	pl1_draw_card2()
#	yield(pl1_draw_card2(),"completed")
#	phase_change_animation("Standby")
#	phase_change_animation("Draw")
#	yield(card_draw_yielded("pl1",3), "completed")
#	phase_change_animation("Main1")
	
	#yield(try_card_draw("pl1",3), "completed")#.resume()
#	for i in range(0,3):
##		yield(get_tree(), "idle_frame")
##		yield(pl1_draw_card(), "completed")
#		pl1_draw_card().resume()
##		yield(get_tree().create_timer(0.5), "timeout")
##		yield(tw,"loop_finished")
#	print("YAAAAAAAAASSSSS")
#	phase_change_animation("Draw")
#
##	card_draw("deck",players["pl1"]["deck"],5,motionSpeed-1.2)


func selection_finished(n1,n2):
	if current_selected_cards.size() in range(n1,n2):
		emit_signal("selection_completed")


func available_cards(card_props, place): #card_props = {original={},current={}
	var cards = []
	for card in place:#duel_cards.keys():
		for originality in card_props:
			#(card_props)
			#print(originality)
			print('card_prop is',card_props[originality].keys())
			#print(duel_cards[card][originality])
			for card_prop in card_props[originality].keys():# originality.keys():
				print('duel_cards['+card+']['+originality+']['+card_prop+']')
#				if (card_prop in duel_cards[card][originality][card_prop]) == false or (card_props[originality][card_prop] != duel_cards[card][originality][card_prop]):
				if (card_prop in duel_cards[card][originality].keys()) == false or (card_props[originality][card_prop] != duel_cards[card][originality][card_prop]):
					continue
				else:
					cards.append(card)
	print(cards)
	return cards



func apply_changes():
	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_deck_counter".text = str(players["pl1"]["deck"].size())
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/my_deck_cards_array".set("blend_shapes/cards_counter",players["pl1"]["deck"].size()*0.01)
	if players["pl1"]["deck"].size() ==0:
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_deck_counter".visible = false
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/my_deck_cards_array".visible = false
	else:
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_deck_counter".visible = true
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/my_deck_cards_array".visible = true

	
	
	for card in players["pl1"]["hand"]:
		print(card, " :b")
		if duel_cards[card]["current"]["level"] < 5:
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/options/normalSummBtn").visible = true
#			print($"../main_HSplitContainer/VBoxContainer/myHand/my_hand".get_children()[players["pl1"]["hand"].find("card")].get_children()[1].get_children()[0].get_children()[0].name)
		elif duel_cards[card]["current"]["level"] in [5,6] and available_cards({current = {owner = "pl1"}}, pl1_m_zones_card).size() >=1:
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/options/normalSummBtn").visible = true
		elif duel_cards[card]["current"]["level"] >=7 and available_cards({current = {owner = "pl1"}}, pl1_m_zones_card).size() >=2:
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/options/normalSummBtn").visible = true



func hide_gui_for_animations():
	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_deck_counter".visible = false
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_lv_rk_lables".visible = false
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_atk_def_lables".visible = false
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/op_lv_rk_lables".visible = false
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons".visible = false
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_grave_counter".visible = false
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_banish_counter".visible = false
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_extra_counter".visible = false
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/op_lv_rk_lables".visible = false
#
#	for card in players["pl1"]["hand"]:
#		$"../main_HSplitContainer/VBoxContainer/myHand/my_hand".get_children()[players["pl1"]["hand"].find("card")].get_children()[1].get_children()[0].visible = false
#		print($"../main_HSplitContainer/VBoxContainer/myHand/my_hand".get_children()[players["pl1"]["hand"].find("card")].get_children()[1].get_children()[0].name)

func show_gui_after_animations():
	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_deck_counter".visible = true
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_lv_rk_lables".visible = true
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_atk_def_lables".visible = true
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/op_lv_rk_lables".visible = true
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons".visible = true
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_grave_counter".visible = true
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_banish_counter".visible = true
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/my_extra_counter".visible = true
#	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/op_lv_rk_lables".visible = true
	
#	for card in players["pl1"]["hand"]:
#		$"../main_HSplitContainer/VBoxContainer/myHand/my_hand".get_children()[players["pl1"]["hand"].find("card")].get_children()[1].get_children()[0].visible = true


func activation_confirm(btn):
	if btn == false:
		yield(get_tree(), "idle_frame")
		print("activation refused")
	elif btn == true:
		yield(get_tree(), "idle_frame")
		print("activation confirmed")


func effect_activation_check():
	var test_avilabe_effects = {}#{"c11111c1":[1]}
	
#	for card in duel_cards:
#
	
	# check effects can be activated
	if test_avilabe_effects.size()>0:
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/activation_popup".visible = true
#		yield($"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/activation_popup/HBoxContainer/ap_no","pressed")
		yield($"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/activation_popup","hide")
		yield(activation_confirm(is_player_will_activate_effect),"completed")
#		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/activation_popup".visible = false
	run_event()



func summon(cards,summon_type):
	
	yield(get_tree(),"idle_frame")
	var selected_zone = "m3"#["pl1","m3"]
	for card in cards:

		print(pl1_m_zones_card)
		if auto_zone_selection_enable:
			for zone in auto_zone_selection_order:
				if players["pl1"]["field"]["m"][zone].empty():
					selected_zone = zone
					duel_cards[card]["current"]["place"] = selected_zone
					print(selected_zone)
					break

		if duel_cards[card]["current"]["level"] in [5,6] and available_cards({current = {owner = "pl1"}}, pl1_m_zones_card).size() >=1:
			min_current_card_selection_number = 1
			max_current_card_selection_number = 1
			get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg").visible = true
			get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/message_popup").visible = true
			get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/message_popup/massege").text = "select 1 monster for tribute summon"
			yield(get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/message_popup/ok"),"pressed")
			get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg").visible = false
			get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/message_popup").visible = false
			get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg2").visible = true
			get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg2/selection_popup").visible = true
#			yield(get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/message_popup/ok"),"pressed")
#			get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/tribute_popup").visible = false
			for tr_card in available_cards({current = {owner = "pl1"}}, pl1_m_zones_card):
				current_state = "tribute"
				get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/selection_frame_container/pl1/"+duel_cards[tr_card]["current"]["place"]).visible = true
				get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/selection_frame_container/pl1/"+duel_cards[tr_card]["current"]["place"]).playing = true
#				yield(self,)
				yield(get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg2/selection_popup/confirm"),"pressed")

	
	
		var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")
		var card_in_hand_container = my_hand_container.get_children()[players["pl1"]["hand"].find(card)]
		$"../screen_vfx".get_animation("summon_from_hand").track_set_key_value(0,0,Vector3((card_in_hand_container.rect_position[0]-364)/100,2,4.5))
		$"../screen_vfx".get_animation("summon_from_hand").track_set_key_value(0,1,field_zone_locations["pl1"][selected_zone])
		card_in_hand_container.visible = false
#		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/cardd_for_deck_anim".visible = true
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/cardd_for_deck_anim".get_surface_material(0).albedo_texture = card_textures[card]
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/pl1_field/"+selected_zone).get_surface_material(0).albedo_texture = card_textures[card]
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/screen_card_summ_act".texture = card_textures[card]
		$"../screen_vfx".play("summon_from_hand")
		yield($"../screen_vfx","animation_finished")
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/pl1_field/"+selected_zone).visible =true
#		yield($"../screen_vfx","animation_finished")
#		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/screen_card_summ_act".visible=true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/References/pl1/"+selected_zone).connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],card_textures[card]])
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/References/pl1/"+selected_zone).connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
		
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/pl1_field_vfx/"+selected_zone).visible =true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/pl1_field_vfx/"+selected_zone).play("default")
		yield(get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/pl1_field_vfx/"+selected_zone),"animation_finished")
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/pl1_field_vfx/"+selected_zone).visible = false
		
		$"../screen_vfx".play("summon")
		players["pl1"]["hand"].remove(players["pl1"]["hand"].find(card))
		#print(players["pl1"]["field"][selected_zone])
		players["pl1"]["field"]["m"][selected_zone][card] = ""
#		print(players["pl1"]["field"][selected_zone].keys())
		for node in my_hand_container.get_children():
			if node.visible == true and node.get_index()>card_in_hand_container.get_index():
				my_hand_container.move_child(node,node.get_index()-1)
#		yield($"../screen_vfx","animation_finished")
#		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/screen_card_summ_act".visible = false
#		pass
		pl1_m_zones_card.append(card)
#		print("summond",card)
	apply_changes()
	


#func on_tw_finished():
#	if events_list.size()>0:
#		run_event()

func run_event():
#	tw.stop()
#	queue_free()
#	if events_list[0][0] in events_need_to_tween:
#		tw.kill()
#	tw.kill()
#	if events_list[0][0] == "pl1_draw_card":
#		var new_empty_card = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[-1].duplicate()
#		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(new_empty_card)

### apply non quick-play effects

	if events_list.size()>0:
#		callv(events_list[0][0],events_list[0][1])
		hide_gui_for_animations()
		yield(callv(events_list[0][0],events_list[0][1]),"completed")
		show_gui_after_animations()
		events_list.remove(0)
#		yield($"../screen_vfx","animation_finished")
#		apply_changes()
		
		effect_activation_check()


#func _on_screen_vfx_animation_finished(anim_name):
#	if events_list.size()>0:
#		run_event()



"""
func card_draw_yielded(pl,number):
	tw.play()
#	yield(get_tree(), "idle_frame")
	
	var cards = players[pl]["deck"]
	cards.invert()
	var cards_will_be_drawed = []
	var cards_will_be_drawed_count = 0
	if cards.size()<number:
		cards_will_be_drawed_count = cards.size()
	else:
		cards_will_be_drawed_count = number

	for i in range(0,cards_will_be_drawed_count):
		cards_will_be_drawed.append(cards[i])
	
	if pl == "pl1":
		for card in cards_will_be_drawed:
			var drawed_card_location 
			var drawed_card_separation
			var separation_error = 0#57.5*(cards.find(card)/844)
			var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+card)
			var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

			var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
			card_in_hand_container.name = card
			
			players[pl]["hand"].append(card_in_hand_container.name)
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container)
			var card_in_hand = card_in_hand_container.get_children()[0]
			card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
			card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],cardMesh.get_surface_material(0).albedo_texture])
			
			
			tw.tween_property(cardMesh,"translation",Vector3(-0.8,2.5,1),motionSpeed-1)
			tw.parallel().tween_property(cardMesh,"rotation_degrees",Vector3(0,-90,50),motionSpeed-1)
			tw.tween_property(cardh_for_draw_anim,"texture", cardMesh.get_surface_material(0).albedo_texture,0)#motionSpeed-2)
			tw.tween_property(cardMesh,"visible",false,0)#motionSpeed-2)
			tw.parallel().tween_property(cardh_for_draw_anim,"visible", true,0)#motionSpeed-2)
			
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = cardMesh.get_surface_material(0).albedo_texture
			
			tw.parallel().tween_property(card_in_hand,"texture", cardMesh.get_surface_material(0).albedo_texture,0)
			tw.tween_property(card_in_hand_container,"visible", true,0)
			
#			var drawed_card_separation = ((my_hand_container.get_rect().size[0]/2)/(cards.find(card)+1))-115+(1/(cards.find(card)+1))
#			var drawed_card_separation = (((my_hand_container.get_rect().size[0]*cards.find(card))/(cards.find(card)+1)))
			if cards.find(card) ==0:
				drawed_card_separation = 0
				drawed_card_location =Vector2((((my_hand_container.get_rect().size[0])/(cards.find(card)+2))*(cards.find(card)+1))+separation_error,0)
			else:
#				drawed_card_separation = cards.find(card) * (my_hand_container.get_rect().size[0]/((cards.find(card)+1)*cards.find(card))) - (115/cards.find(card))
				drawed_card_separation = -((844/(cards.find(card)+1))+115)
#				drawed_card_location =Vector2((((my_hand_container.get_rect().size[0])/(cards.find(card)+2))*(cards.find(card)+1))+separation_error+drawed_card_separation,0)
#				drawed_card_location =Vector2((my_hand_container.get_rect().size[0] / ((cards.find(card)+1)) * cards.find(card))-((115*cards.find(card))/(cards.find(card)+1)),0)#-(115*(cards.find(card)+1)),0)
				drawed_card_location =Vector2((my_hand_container.get_rect().size[0] / ((cards.find(card)+1)) * cards.find(card))-((115*(cards.find(card)-1))/(cards.find(card))),0)#-(115*(cards.find(card)+1)),0)
#			print( drawed_card_location, get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card).get_index())
			tw.tween_property(my_hand_container,"custom_constants/separation",drawed_card_separation,0)
			tw.tween_property(cardh_for_draw_anim,"rect_position:x",drawed_card_location[0],motionSpeed-1)
			tw.parallel().tween_property(cardh_for_draw_anim,"rect_scale",Vector2(1,1),motionSpeed-1)
			tw.tween_property(cardh_for_draw_anim,"visible", false,0)
			tw.tween_property(card_in_hand,"visible", true,0)
			tw.tween_property(cardh_for_draw_anim,"rect_position",Vector2(726,413),0)
			tw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0)
"""


"""
func pl1_draw_card_pt2():
	for i in range(0,3):
#		yield(pl1_draw_card_pt1(i),"completed").resume()
		pl1_draw_card_pt1(i)
		var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_child(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_child_count()-1)
		var card_in_hand = card_in_hand_container.get_children()[0]
		var card = players["pl1"]["deck"][i]
		var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+card)
		var drawTw = create_tween()
		drawTw.play()
		drawTw.tween_property(cardMesh,"translation",Vector3(-0.8,2.5,1),motionSpeed-1)
		drawTw.parallel().tween_property(cardMesh,"rotation_degrees",Vector3(0,-90,50),motionSpeed-1)
		drawTw.tween_property(cardh_for_draw_anim,"texture", cardMesh.get_surface_material(0).albedo_texture,0)#motionSpeed-2)
		drawTw.tween_property(cardMesh,"visible",false,0)#motionSpeed-2)
		drawTw.parallel().tween_property(cardh_for_draw_anim,"visible", true,0)#motionSpeed-2)
			
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = cardMesh.get_surface_material(0).albedo_texture
			
		drawTw.parallel().tween_property(card_in_hand,"texture", cardMesh.get_surface_material(0).albedo_texture,0)
		drawTw.tween_property(card_in_hand_container,"visible", true,0)
		drawTw.tween_property(cardh_for_draw_anim,"rect_global_position:x",card_in_hand_container.rect_global_position[0],motionSpeed-1)
		drawTw.parallel().tween_property(cardh_for_draw_anim,"rect_scale",Vector2(1,1),motionSpeed-1)
		drawTw.tween_property(cardh_for_draw_anim,"visible", false,0)
		drawTw.tween_property(card_in_hand,"visible", true,0)
		drawTw.tween_property(cardh_for_draw_anim,"rect_position",Vector2(726,413),0)
		drawTw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0)
		yield(drawTw,"finished")


func pl1_draw_card_pt1(n):
#	yield()
	var card = players["pl1"]["deck"][n]
	var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+card)
	var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

	var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
#	var card_in_hand_container = yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate(),"child_entered_tree")
	card_in_hand_container.name = card
	
#	yield(get_tree().create_timer(0.5), "timeout")
	
	players["pl1"]["hand"].append(card_in_hand_container.name)
	
#	yield(get_tree().create_timer(0.5), "timeout")
	
	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container)
	
#	yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container),"sort_childern")
	var card_in_hand = card_in_hand_container.get_children()[0]
	card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
	card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],cardMesh.get_surface_material(0).albedo_texture])


func pl1_draw_card2():
	for i in range(0,3):
		var card = players["pl1"]["deck"][i]
		var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+card)
		var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

		var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
#		var card_in_hand_container = yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate(),"ready")
		card_in_hand_container.name = card
	
#		yield(get_tree().create_timer(0.5), "timeout")
	
		players["pl1"]["hand"].append(card_in_hand_container.name)
	
#		yield(get_tree().create_timer(0.5), "timeout")
	
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container)
		yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand"),"item_rect_changed")
		
#		yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container),"sort_childern")
		var card_in_hand = card_in_hand_container.get_children()[0]
		card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
		card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],cardMesh.get_surface_material(0).albedo_texture])

		card_in_hand.hint_tooltip = card
#		players["pl1"]["deck"].remove(players["pl1"]["deck"][-1])
	
#		yield(card_in_hand_container,"ready")
#		yield(cardh_for_draw_anim,"hide")
		var drawTw = create_tween()
		drawTw.play()
		drawTw.tween_property(cardMesh,"translation",Vector3(-0.8,2.5,1),motionSpeed-1)
		drawTw.parallel().tween_property(cardMesh,"rotation_degrees",Vector3(0,-90,50),motionSpeed-1)
		drawTw.tween_property(cardh_for_draw_anim,"texture", cardMesh.get_surface_material(0).albedo_texture,0)#motionSpeed-2)
		drawTw.tween_property(cardMesh,"visible",false,0)#motionSpeed-2)
		drawTw.parallel().tween_property(cardh_for_draw_anim,"visible", true,0)#motionSpeed-2)
			
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = cardMesh.get_surface_material(0).albedo_texture
			
		drawTw.parallel().tween_property(card_in_hand,"texture", cardMesh.get_surface_material(0).albedo_texture,0)
		drawTw.tween_property(card_in_hand_container,"visible", true,0)
		drawTw.tween_property(cardh_for_draw_anim,"rect_global_position:x",card_in_hand_container.rect_global_position[0],motionSpeed-1)
		drawTw.parallel().tween_property(cardh_for_draw_anim,"rect_scale",Vector2(1,1),motionSpeed-1)
		drawTw.tween_property(cardh_for_draw_anim,"visible", false,0)
		drawTw.tween_property(card_in_hand,"visible", true,0)
		drawTw.tween_property(cardh_for_draw_anim,"rect_position",Vector2(726,413),0)
		drawTw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0)
		yield(drawTw,"step_finished")
#		yield(cardh_for_draw_anim,"hide")
#		yield(get_tree().create_timer(0.5), "timeout")
#		yield(tw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0),"finished")
"""

"""func new_card_in_hand():
	yield(get_tree(), "idle_frame")
	var new_empty_card = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[-1].duplicate()
	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(new_empty_card)"""


func pl1_draw_card_3d(n):
	yield(get_tree(),"idle_frame")
	for i in range(0,n):
		var card = players["pl1"]["deck"][players["pl1"]["deck"].size()-1]
		players["pl1"]["hand"].append(card)
		players["pl1"]["deck"].remove(players["pl1"]["deck"].size()-1)
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/my_deck_cards_array".set("blend_shapes/cards_counter",players["pl1"]["deck"].size()*0.01)
		var cardMesh = cardd_for_deck_anim
		cardMesh.get_surface_material(0).albedo_texture = card_textures[card]
		var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")
		
		var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1]
		
		card_in_hand_container.name = card


### 	connect normal button summon
		card_in_hand_container.get_children()[1].get_children()[0].get_children()[0].connect("pressed",duel_system,"normalSummBtn_pressed",[card])
		
		var card_in_hand = card_in_hand_container.get_children()[0]
		card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
		card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],card_textures[card]])#cardMesh.get_surface_material(0).albedo_texture])
		
		cardh_for_draw_anim.texture = card_textures[card]
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = card_textures[card]#cardMesh.get_surface_material(0).albedo_texture
		
		card_in_hand_container.visible = true
		yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand"),"sort_children")
		var new_pos = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1].rect_position[0]#.rect_global_position[0]+(115/2)+get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").rect_position[0]#.rect_position[0]#card_in_hand_container.rect_global_position[0]
		
		$"../screen_vfx".get_animation("pl1_card_draw").track_set_key_value(0,1,Vector2(new_pos,413))

		$"../screen_vfx".play("pl1_card_draw")
		yield($"../screen_vfx","animation_finished")
		card_in_hand.texture= card_textures[card]
		recorded_events[current_turn].append([["pl","cause","e","asCoast"],card," drawed"])




func pl1_draw_card(n):
	# draw until condition is right
#	var previous_separation_hand = $"../screen_vfx".get_animation("pl1_card_draw").track_get_key_value(6,1)
#	$"../screen_vfx".get_animation("pl1_card_draw").track_set_key_value(6,0,previous_separation_hand)
	yield(get_tree(),"idle_frame")
	for i in range(0,n):
	
#		print(players["pl1"]["deck"][players["pl1"]["deck"].size()-1])
		
		var card = players["pl1"]["deck"][players["pl1"]["deck"].size()-1]
		players["pl1"]["hand"].append(card)
		players["pl1"]["deck"].remove(players["pl1"]["deck"].size()-1)
		$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/my_deck_cards_array".set("blend_shapes/cards_counter",players["pl1"]["deck"].size()*0.01)
#		print(duel_cards[card])
		
		var cardMesh = cardd_for_deck_anim
		cardMesh.get_surface_material(0).albedo_texture = card_textures[card]
		var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")
		
		var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1]
		
		card_in_hand_container.name = card
		
### 	connect normal button summon
		card_in_hand_container.get_children()[1].get_children()[0].get_children()[0].connect("pressed",duel_system,"normalSummBtn_pressed",[card])
		
		var card_in_hand = card_in_hand_container.get_children()[0]
		card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
		card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],card_textures[card]])#cardMesh.get_surface_material(0).albedo_texture])
		
		cardh_for_draw_anim.texture = card_textures[card]
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = card_textures[card]#cardMesh.get_surface_material(0).albedo_texture
		
		card_in_hand_container.visible = true
		yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand"),"sort_children")
		var new_pos = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1].rect_position[0]#.rect_global_position[0]+(115/2)+get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").rect_position[0]#.rect_position[0]#card_in_hand_container.rect_global_position[0]
#		print("pos is:", new_pos, "  and index: ",players["pl1"]["hand"].size()-1)
		$"../screen_vfx".get_animation("pl1_card_draw").track_set_key_value(0,1,Vector2(new_pos,413))
		
#		$"../screen_vfx".get_animation("pl1_card_draw").track_set_key_value(6,1,(  (players["pl1"]["hand"].size()/60) *-110 ))
		
		$"../screen_vfx".play("pl1_card_draw")
		yield($"../screen_vfx","animation_finished")
		card_in_hand.texture= card_textures[card]
		recorded_events[current_turn].append([["pl","cause","e","asCoast"],card," drawed"])
#	print(recorded_events)


"""func pl1_draw_card(): # spare
#	var previous_separation_hand = $"../screen_vfx".get_animation("pl1_card_draw").track_get_key_value(6,1)
#	$"../screen_vfx".get_animation("pl1_card_draw").track_set_key_value(6,0,previous_separation_hand)
	
	print(players["pl1"]["deck"][players["pl1"]["deck"].size()-1])

	var card = players["pl1"]["deck"][players["pl1"]["deck"].size()-1]
	players["pl1"]["hand"].append(card)
	players["pl1"]["deck"].remove(players["pl1"]["deck"].size()-1)

	var cardMesh = cardd_for_deck_anim
	cardMesh.get_surface_material(0).albedo_texture = card_textures[card]
	var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

	var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1]

	card_in_hand_container.name = card

### connect normal button summon
	card_in_hand_container.get_children()[1].get_children()[0].get_children()[0].connect("pressed",duel_system,"normalSummBtn_pressed",[card])

	var card_in_hand = card_in_hand_container.get_children()[0]
	card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
	card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],card_textures[card]])#cardMesh.get_surface_material(0).albedo_texture])

	cardh_for_draw_anim.texture = card_textures[card]
	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = card_textures[card]#cardMesh.get_surface_material(0).albedo_texture

	card_in_hand_container.visible = true
	yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand"),"sort_children")
	var new_pos = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1].rect_position[0]#.rect_global_position[0]+(115/2)+get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").rect_position[0]#.rect_position[0]#card_in_hand_container.rect_global_position[0]
	print("pos is:", new_pos, "  and index: ",players["pl1"]["hand"].size()-1)
	$"../screen_vfx".get_animation("pl1_card_draw").track_set_key_value(0,1,Vector2(new_pos,413))
	
#	$"../screen_vfx".get_animation("pl1_card_draw").track_set_key_value(6,1,(  (players["pl1"]["hand"].size()/60) *-110 ))
	
	$"../screen_vfx".play("pl1_card_draw")
	yield($"../screen_vfx","animation_finished")
	card_in_hand.texture= card_textures[card]"""


"""func pl1_draw_card(): #spare
#	tw.play()
#	yield(new_card_in_hand(),"completed")
#	yield(get_tree().create_timer(0.8), "timeout")
	print(players["pl1"]["deck"][players["pl1"]["deck"].size()-1])
#	yield()
#	tw.stop()
	var card = players["pl1"]["deck"][players["pl1"]["deck"].size()-1]
	players["pl1"]["hand"].append(card)
	players["pl1"]["deck"].remove(players["pl1"]["deck"].size()-1)
#	yield(get_tree().create_timer(0.5), "timeout")
#	var cardMesh_texture_resource = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+card)
	var cardMesh = cardd_for_deck_anim
	cardMesh.get_surface_material(0).albedo_texture = card_textures[card]
	var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

#	var new_empty_card = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
#	var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card")#.duplicate()
#	var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[-1]#.duplicate()
	var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1]
#	var card_in_hand_container = yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate(),"child_entered_tree")
#	card_in_hand_container.visible = true
	card_in_hand_container.name = card
	
#	yield(get_tree().create_timer(0.5), "timeout")
	
#	players["pl1"]["hand"].append(card)#card_in_hand_container.name)
	
#	yield(get_tree().create_timer(0.5), "timeout")
	
#	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(new_empty_card)
#	yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container),"sort_childern")
#	print(new_empty_card.get_index())
### connect normal button summon
	card_in_hand_container.get_children()[1].get_children()[0].get_children()[0].connect("pressed",duel_system,"normalSummBtn_pressed",[card])
#	get_node("main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/options/normalSummBtn").connect("pressed",duel_system,"normalSummBtn_pressed",[card])
	var card_in_hand = card_in_hand_container.get_children()[0]
	card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
	card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],card_textures[card]])#cardMesh.get_surface_material(0).albedo_texture])

#	card_in_hand.hint_tooltip = card
#	players["pl1"]["deck"].remove(players["pl1"]["deck"][-1])

	cardh_for_draw_anim.texture = card_textures[card]#cardMesh.get_surface_material(0).albedo_texture
	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = card_textures[card]#cardMesh.get_surface_material(0).albedo_texture

#	card_in_hand.texture= cardMesh.get_surface_material(0).albedo_texture
	card_in_hand_container.visible = true#.get_children()[0].visible = true
#	yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1].get_children()[0],"draw")
	yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand"),"sort_children")
#	yield(get_tree().create_timer(0.5), "timeout")
#	card_in_hand_container.get_children()[0].visible = true
#	var hand_size = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_child_count()-1
	var new_pos = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").get_children()[players["pl1"]["hand"].size()-1].rect_position[0]#.rect_global_position[0]+(115/2)+get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").rect_position[0]#.rect_position[0]#card_in_hand_container.rect_global_position[0]
	print("pos is:", new_pos, "  and index: ",players["pl1"]["hand"].size()-1)
	$"../screen_vfx".get_animation("pl1_card_draw").track_set_key_value(0,1,Vector2(new_pos,413))
	
#	$"../screen_vfx".get_animation("pl1_card_draw").add_track(-1)
#	$"../screen_vfx".get_animation("pl1_card_draw").track_set_path(-1,"../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card_in_hand_container.name+":visible")
#	$"../screen_vfx".get_animation("pl1_card_draw").track_insert_key(-1,0.0,false)
#	$"../screen_vfx".get_animation("pl1_card_draw").track_insert_key(-1,1.0,true)
	$"../screen_vfx".play("pl1_card_draw")
	yield($"../screen_vfx","animation_finished")
#	print("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture")
#	get_node("main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/options/normalSummBtn").connect("pressed",duel_system,"normalSummBtn_pressed",[card])
#	card_in_hand.modulate = Color(255,255,255,255)
	card_in_hand.texture= card_textures[card]#cardMesh.get_surface_material(0).albedo_texture
	
#	yield(get_tree().create_timer(1), "timeout")
#	print(99999)
#	card_in_hand.texture= cardMesh.get_surface_material(0).albedo_texture
##	tw.parallel().tween_property(card_in_hand,"texture", cardMesh.get_surface_material(0).albedo_texture,0)
##	tw.tween_property(card_in_hand_container,"visible", true,0)
##	tw.tween_property(cardh_for_draw_anim,"rect_global_position:x",card_in_hand_container.rect_global_position[0],motionSpeed-1)
##	tw.parallel().tween_property(cardh_for_draw_anim,"rect_scale",Vector2(1,1),motionSpeed-1)
##	tw.tween_property(cardh_for_draw_anim,"visible", false,0)
##	tw.tween_property(card_in_hand,"visible", true,0)
##	tw.tween_property(cardh_for_draw_anim,"rect_position",Vector2(726,413),0)
##	tw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0)"""



"""func pl1_draw_card_old():
#	tw.play()
	print(players["pl1"]["deck"][players["pl1"]["deck"].size()-1])
#	yield()
#	tw.stop()
	var card = players["pl1"]["deck"][players["pl1"]["deck"].size()-1]
	players["pl1"]["deck"].remove(players["pl1"]["deck"].size()-1)
#	yield(get_tree().create_timer(0.5), "timeout")
	var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+card)
	var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

	var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
#	var card_in_hand_container = yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate(),"child_entered_tree")
	card_in_hand_container.name = card
	
#	yield(get_tree().create_timer(0.5), "timeout")
	
	players["pl1"]["hand"].append(card_in_hand_container.name)
	
#	yield(get_tree().create_timer(0.5), "timeout")
	
	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container)
#	yield(get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container),"sort_childern")
	var card_in_hand = card_in_hand_container.get_children()[0]
	card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
	card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],cardMesh.get_surface_material(0).albedo_texture])

	card_in_hand.hint_tooltip = card
#	players["pl1"]["deck"].remove(players["pl1"]["deck"][-1])
	
#	yield(card_in_hand,"ready")
#	yield(cardh_for_draw_anim,"hide")
	tw.play()
	tw.tween_property(cardMesh,"translation",Vector3(-0.8,2.5,1),motionSpeed-1)
	tw.parallel().tween_property(cardMesh,"rotation_degrees",Vector3(0,-90,50),motionSpeed-1)
	tw.tween_property(cardh_for_draw_anim,"texture", cardMesh.get_surface_material(0).albedo_texture,0)#motionSpeed-2)
	tw.tween_property(cardMesh,"visible",false,0)#motionSpeed-2)
	tw.parallel().tween_property(cardh_for_draw_anim,"visible", true,0)#motionSpeed-2)
			
	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = cardMesh.get_surface_material(0).albedo_texture
			
	tw.parallel().tween_property(card_in_hand,"texture", cardMesh.get_surface_material(0).albedo_texture,0)
	tw.tween_property(card_in_hand_container,"visible", true,0)
	tw.tween_property(cardh_for_draw_anim,"rect_global_position:x",card_in_hand_container.rect_global_position[0],motionSpeed-1)
	tw.parallel().tween_property(cardh_for_draw_anim,"rect_scale",Vector2(1,1),motionSpeed-1)
	tw.tween_property(cardh_for_draw_anim,"visible", false,0)
	tw.tween_property(card_in_hand,"visible", true,0)
	tw.tween_property(cardh_for_draw_anim,"rect_position",Vector2(726,413),0)
	tw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0)
#	yield(tw,"finished")
#	tw.stop()
#	yield(cardh_for_draw_anim,"hide")
#	yield(get_tree().create_timer(0.5), "timeout")
#	yield(tw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0),"finished")"""


"""func stop_tween():
	print("stoped :)")
	tw.stop()"""


"""func _on_AnimationPlayer2_animation_finished(anim_name):
#	var deck = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/deckParent")
	print("anim finished")
	if tw2finished == false:
		alt_rearrenging_deck(testDeckOrder, deck.get_children(),0.01,tw2speed)
		tw2.start()
	else:
		tw2finished = false"""


"""func activable_effects(targList):
	var activable = [{}] # [ {c111=[0,1]} , {c222=[0]} ] 
	for card in targList:
		var expression = Expression.new()
		expression.parse(card["effect"][0][0],["card","players","contr","test"])
		var result = expression.execute([card,players,card["contr"],"test"],null,true )
		print("card ",result)"""


"""func the_card(card):
	var cardCopy = card[-1]
	card.erase(-1,1)
	var cardId = card
	return cardCopy


func action_manager(chain):
	print("manager works :[")
	chain.invert()
	for action in chain:
		var current_resolvig = chain[-1]
		if current_resolvig["function"] == "draw":
			print("manager works :b")
			card_draw(current_resolvig["parameters"][0],current_resolvig["parameters"][1])
	pass"""


#func _on_screen_vfx_animation_finished(anim_name):

#	rtl_phases_vfx.visible=false
#	rtl_turns_vfx.visible=false
#	action_manager(chain)
#	card_draw("deck",players["pl1"]["deck"],5,motionSpeed-1.8)
#	call_deferred("card_draw(n\"deckn\",players["pl1"]["deck"],5,motionSpeed-1.8)")
#	if rtl_phases_vfx.text  == "DRAW \n PHASE":
#		card_draw("deck",players["pl1"]["deck"],5,motionSpeed-1.8)
#	pass # Replace with function body.


func phase_change_animation(current_phase):
#	tw.stop()
#	yield(get_tree(), "idle_frame")
	rtl_phases_vfx.visible = true
	if current_phase == "Draw":
		rtl_phases_vfx.text = "DRAW \n PHASE"
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton2").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").disabled = true

	elif current_phase == "Standby":
		rtl_phases_vfx.text = "STANDBY \n PHASE"
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton2").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").disabled = true

	elif current_phase == "Main1":
		apply_changes()
		rtl_phases_vfx.text = "MAIN \n PHASE1"
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton2").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").pressed = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").pressed = false

	elif current_phase == "Battle":
		rtl_phases_vfx.text = "BATTLE \n PHASE"
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton2").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").pressed = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").pressed = false

	elif current_phase == "Main2":
		rtl_phases_vfx.text = "MAIN \n PHASE2"
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton2").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").pressed = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").pressed = false

	elif current_phase == "End":
		rtl_phases_vfx.text = "END \n PHASE"
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton2").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").disabled = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").disabled = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton3").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton4").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton5").pressed = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/phase_buttons/TextureButton6").pressed = true

	screen_vfx.play("phase_change")
	yield($"../screen_vfx","animation_finished")
	#check avilabe effects




"""func pl1_hand_loading():
	yield(get_tree().create_timer(0.5), "timeout")
	for i in range(0,59):
		var new_empty_card = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(new_empty_card)"""
		


func deck_loading(deck):
	var loaded_deck = load("res://decks/"+deck+".gd").new()
	var temp_deck = []
#	var current_card_props = load("res://card_scripts/current_card_props.gd").new()
#	print(current_card_props.card_props.keys())
	for card in loaded_deck.main:
		var card_properties = load("res://card_scripts/c"+card+".gd").new()
		var current_card_props = load("res://card_scripts/current_card_props.gd").new()
		var card_copy= 1 + temp_deck.count(card)
#		card_copy += temp_deck.count(card)
		temp_deck.append(card)
#		if players["pl1"]["deck"].count(card) >0:
#		if temp_deck.count(card)>0:
#			card_copy += players["pl1"]["deck"].count(card)
#			card_copy += temp_deck.count(card)
		duel_cards["c"+card+"c"+str(card_copy)] = card_properties.cardProps
		duel_cards["c"+card+"c"+str(card_copy)]["current"] = current_card_props.card_props
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["place"] = "my_deck"
		
		for prop in ["attribute", "level", "race", "atk", "def", "effects"]:
			if prop in duel_cards["c"+card+"c"+str(card_copy)]["original"].keys():
				duel_cards["c"+card+"c"+str(card_copy)]["current"][prop] = duel_cards["c"+card+"c"+str(card_copy)]["original"][prop]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["id"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["id"]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["card_name"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["card_name"]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["card_type"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["card_type"]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["description"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["description"]

		duel_cards["c"+card+"c"+str(card_copy)]["original"]["owner"] ="pl1"#duel_cards["c"+card+"c"+str(card_copy)]["original"]["description"]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["owner"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["owner"]
		
		players["pl1"]["deck"].append("c"+card+"c"+str(card_copy))
		var card_image = Image.new()
		var card_texture = ImageTexture.new()
#		card_image.load("/Users/egycn/Downloads/484x700/"+card+".jpg")
		card_image.load("/home/devadmin/Downloads/card_textures/"+card+".jpg")
		card_texture.create_from_image(card_image)
### will be removed============================================================
		var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/deck_card").duplicate()
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent").add_child(cardMesh)
		cardMesh.translation[1] = (loaded_deck.main.find(card)*0.005)
#		cardMesh.set_surface_material(0, cardMesh.get_surface_material(0).duplicate())
#		cardMesh.get_surface_material(0).albedo_texture = card_texture
		cardMesh.visible = true
#		cardMesh.name = "c"+card+"c"+str(card_copy)
###============================================================
		card_textures["c"+card+"c"+str(card_copy)] = card_texture
		
	randomize()
	players["pl1"]["deck"].shuffle()
	for deck_card in players["pl1"]["deck"].size():
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent").get_children()[deck_card-1].translation[1] = players["pl1"]["deck"].find(deck_card)*0.005
#	print(duel_cards.keys()[0])


"""func deck_loading_old(deck):
	var loaded_deck = load("res://decks/"+deck+".gd").new()
	var temp_deck = []
#	var current_card_props = load("res://card_scripts/current_card_props.gd").new()
#	print(current_card_props.card_props.keys())
	for card in loaded_deck.main:
		var card_properties = load("res://card_scripts/c"+card+".gd").new()
		var current_card_props = load("res://card_scripts/current_card_props.gd").new()
		var card_copy= 1 + temp_deck.count(card)
#		card_copy += temp_deck.count(card)
		temp_deck.append(card)
#		if players["pl1"]["deck"].count(card) >0:
#		if temp_deck.count(card)>0:
#			card_copy += players["pl1"]["deck"].count(card)
#			card_copy += temp_deck.count(card)
		duel_cards["c"+card+"c"+str(card_copy)] = card_properties.cardProps
		duel_cards["c"+card+"c"+str(card_copy)]["current"] = current_card_props.card_props
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["place"] = "my_deck"
		
		for prop in ["attribute", "level", "race", "atk", "def", "effects"]:
			if prop in duel_cards["c"+card+"c"+str(card_copy)]["original"].keys():
				duel_cards["c"+card+"c"+str(card_copy)]["current"][prop] = duel_cards["c"+card+"c"+str(card_copy)]["original"][prop]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["id"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["id"]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["card_name"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["card_name"]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["card_type"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["card_type"]
		duel_cards["c"+card+"c"+str(card_copy)]["current"]["description"] =duel_cards["c"+card+"c"+str(card_copy)]["original"]["description"]
		
		players["pl1"]["deck"].append("c"+card+"c"+str(card_copy))
		var card_image = Image.new()
		var card_texture = ImageTexture.new()
		card_image.load("/Users/egycn/Downloads/484x700/"+card+".jpg")
		card_texture.create_from_image(card_image)
		var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/deck_card").duplicate()
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent").add_child(cardMesh)
		cardMesh.translation[1] = (loaded_deck.main.find(card)*0.005)
		cardMesh.set_surface_material(0, cardMesh.get_surface_material(0).duplicate())
		cardMesh.get_surface_material(0).albedo_texture = card_texture
		cardMesh.visible = true
		cardMesh.name = "c"+card+"c"+str(card_copy)
		
	randomize()
	players["pl1"]["deck"].shuffle()
	for deck_card in players["pl1"]["deck"]:
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+deck_card).translation[1] = players["pl1"]["deck"].find(deck_card)*0.005
#	print(duel_cards)"""


func hover_on_card(card_pos):
#	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+ card_pos+"/hover_on").visible = false
	if $"../screen_vfx".is_playing() == false:
		if hovered_card != "":
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+ hovered_card+"/hover_on").visible = false
		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+ card_pos+"/hover_on").visible = true
		
#		if card_pos in players["pl1"]["hand"]:
#			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+ card_pos+"/hover_on").visible = true
#
		hovered_card = card_pos
	
	
#	if hovered_card != "":
#		get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+ hovered_card+"/hover_on").visible = false
#	get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+ card_pos+"/hover_on").visible = true
#
#	hovered_card = card_pos
#	print(duel_cards[card_pos]["current"]["id"])
	pass


"""func try_card_draw(pl,number):
#	yield(VisualServer, "frame_pre_draw")
	tw.play()
	var cards = players[pl]["deck"]
	cards.invert()
	var cards_will_be_drawed = []
	var cards_will_be_drawed_count = 0
	if cards.size()<number:
		cards_will_be_drawed_count = cards.size()
	else:
		cards_will_be_drawed_count = number

	for i in range(0,cards_will_be_drawed_count):
		cards_will_be_drawed.append(cards[i])
	
	if pl == "pl1":
		for card in cards_will_be_drawed:
			var drawed_card_location 
			var drawed_card_separation
			var separation_error = 0#57.5*(cards.find(card)/844)
			var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+card)
			var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

			var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
			card_in_hand_container.name = card
			
			players[pl]["hand"].append(card_in_hand_container.name)
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container)
			var card_in_hand = card_in_hand_container.get_children()[0]
			card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
			card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],cardMesh.get_surface_material(0).albedo_texture])
			
			yield(get_tree(), "idle_frame")
			tw.tween_property(cardMesh,"translation",Vector3(-0.8,2.5,1),motionSpeed-2)
			tw.parallel().tween_property(cardMesh,"rotation_degrees",Vector3(0,-90,50),motionSpeed-2)
			tw.tween_property(cardh_for_draw_anim,"texture", cardMesh.get_surface_material(0).albedo_texture,0)#motionSpeed-2)
			tw.tween_property(cardMesh,"visible",false,0)#motionSpeed-2)
			tw.parallel().tween_property(cardh_for_draw_anim,"visible", true,0)#motionSpeed-2)
			
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = cardMesh.get_surface_material(0).albedo_texture
			
			tw.parallel().tween_property(card_in_hand,"texture", cardMesh.get_surface_material(0).albedo_texture,0)
			tw.tween_property(card_in_hand_container,"visible", true,0)
			
#			var drawed_card_separation = ((my_hand_container.get_rect().size[0]/2)/(cards.find(card)+1))-115+(1/(cards.find(card)+1))
#			var drawed_card_separation = (((my_hand_container.get_rect().size[0]*cards.find(card))/(cards.find(card)+1)))
			if cards.find(card) ==0:
				drawed_card_separation = 0
				drawed_card_location =Vector2((((my_hand_container.get_rect().size[0])/(cards.find(card)+2))*(cards.find(card)+1))+separation_error,0)
			else:
#				drawed_card_separation = cards.find(card) * (my_hand_container.get_rect().size[0]/((cards.find(card)+1)*cards.find(card))) - (115/cards.find(card))
				drawed_card_separation = -((844/(cards.find(card)+1))+115)
#				drawed_card_location =Vector2((((my_hand_container.get_rect().size[0])/(cards.find(card)+2))*(cards.find(card)+1))+separation_error+drawed_card_separation,0)
#				drawed_card_location =Vector2((my_hand_container.get_rect().size[0] / ((cards.find(card)+1)) * cards.find(card))-((115*cards.find(card))/(cards.find(card)+1)),0)#-(115*(cards.find(card)+1)),0)
				drawed_card_location =Vector2((my_hand_container.get_rect().size[0] / ((cards.find(card)+1)) * cards.find(card))-((115*(cards.find(card)-1))/(cards.find(card))),0)#-(115*(cards.find(card)+1)),0)
#			print( drawed_card_location, get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card).get_index())
			tw.tween_property(my_hand_container,"custom_constants/separation",drawed_card_separation,0)
			tw.tween_property(cardh_for_draw_anim,"rect_position:x",drawed_card_location[0],motionSpeed-2)
			tw.parallel().tween_property(cardh_for_draw_anim,"rect_scale",Vector2(1,1),motionSpeed-2)
			tw.tween_property(cardh_for_draw_anim,"visible", false,0)
			tw.tween_property(card_in_hand,"visible", true,0)
			tw.tween_property(cardh_for_draw_anim,"rect_position",Vector2(726,413),0)
			tw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0)
			yield(get_tree().create_timer(1.0), "timeout")"""


"""func card_draw(pl,number):
	tw.play()
	var cards = players[pl]["deck"]
	cards.invert()
	var cards_will_be_drawed = []
	var cards_will_be_drawed_count = 0
	if cards.size()<number:
		cards_will_be_drawed_count = cards.size()
	else:
		cards_will_be_drawed_count = number

	for i in range(0,cards_will_be_drawed_count):
		cards_will_be_drawed.append(cards[i])
	
	if pl == "pl1":
		for card in cards_will_be_drawed:
			var drawed_card_location 
			var drawed_card_separation
			var separation_error = 0#57.5*(cards.find(card)/844)
			var cardMesh = get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/myDeckParent/"+card)
			var my_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand")

			var card_in_hand_container = get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/hand_card").duplicate()
			card_in_hand_container.name = card
			
			players[pl]["hand"].append(card_in_hand_container.name)
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand").add_child(card_in_hand_container)
			var card_in_hand = card_in_hand_container.get_children()[0]
			card_in_hand.connect("mouse_entered",duel_system,"hover_on_card",[card_in_hand_container.name])
			card_in_hand.connect("mouse_entered",card_info_bar,"card_hoverOn_mouse_action",[duel_cards[card]["current"],cardMesh.get_surface_material(0).albedo_texture])
			
			
			tw.tween_property(cardMesh,"translation",Vector3(-0.8,2.5,1),motionSpeed-2)
			tw.parallel().tween_property(cardMesh,"rotation_degrees",Vector3(0,-90,50),motionSpeed-2)
			tw.tween_property(cardh_for_draw_anim,"texture", cardMesh.get_surface_material(0).albedo_texture,0)#motionSpeed-2)
			tw.tween_property(cardMesh,"visible",false,0)#motionSpeed-2)
			tw.parallel().tween_property(cardh_for_draw_anim,"visible", true,0)#motionSpeed-2)
			
			get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card+"/hover_on/CenterContainer/card_texture").texture = cardMesh.get_surface_material(0).albedo_texture
			
			tw.parallel().tween_property(card_in_hand,"texture", cardMesh.get_surface_material(0).albedo_texture,0)
			tw.tween_property(card_in_hand_container,"visible", true,0)
			
#			var drawed_card_separation = ((my_hand_container.get_rect().size[0]/2)/(cards.find(card)+1))-115+(1/(cards.find(card)+1))
#			var drawed_card_separation = (((my_hand_container.get_rect().size[0]*cards.find(card))/(cards.find(card)+1)))
			if cards.find(card) ==0:
				drawed_card_separation = 0
				drawed_card_location =Vector2((((my_hand_container.get_rect().size[0])/(cards.find(card)+2))*(cards.find(card)+1))+separation_error,0)
			else:
#				drawed_card_separation = cards.find(card) * (my_hand_container.get_rect().size[0]/((cards.find(card)+1)*cards.find(card))) - (115/cards.find(card))
				drawed_card_separation = -((844/(cards.find(card)+1))+115)
#				drawed_card_location =Vector2((((my_hand_container.get_rect().size[0])/(cards.find(card)+2))*(cards.find(card)+1))+separation_error+drawed_card_separation,0)
#				drawed_card_location =Vector2((my_hand_container.get_rect().size[0] / ((cards.find(card)+1)) * cards.find(card))-((115*cards.find(card))/(cards.find(card)+1)),0)#-(115*(cards.find(card)+1)),0)
				drawed_card_location =Vector2((my_hand_container.get_rect().size[0] / ((cards.find(card)+1)) * cards.find(card))-((115*(cards.find(card)-1))/(cards.find(card))),0)#-(115*(cards.find(card)+1)),0)
#			print( drawed_card_location, get_node("../main_HSplitContainer/VBoxContainer/myHand/my_hand/"+card).get_index())
			tw.tween_property(my_hand_container,"custom_constants/separation",drawed_card_separation,0)
			tw.tween_property(cardh_for_draw_anim,"rect_position:x",drawed_card_location[0],motionSpeed-2)
			tw.parallel().tween_property(cardh_for_draw_anim,"rect_scale",Vector2(1,1),motionSpeed-2)
			tw.tween_property(cardh_for_draw_anim,"visible", false,0)
			tw.tween_property(card_in_hand,"visible", true,0)
			tw.tween_property(cardh_for_draw_anim,"rect_position",Vector2(726,413),0)
			tw.tween_property(cardh_for_draw_anim,"rect_scale",Vector2(0.8,0.8),0)"""


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

"""func card_movement_action(cardMesh,action,send_to, speed):
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
		pass"""


#func to_faceup(cardMesh, speed) :
#	tw.tween_property(cardMesh, "rotation_degrees",Vector3(180,cardMesh.rotation_degrees[1],cardMesh.rotation_degrees[2]),speed+2)
#	#tw2.interpolate_property(cardMesh,"rotation_degrees:x",cardMesh.rotation["x"],180, speed,0,0, speed)
#
#func to_facedown(cardMesh, speed) :
#	tw.tween_property(cardMesh, "rotation_degrees",Vector3(-180,cardMesh.rotation_degrees[1],cardMesh.rotation_degrees[2]),speed+2)
#
#func to_def(cardMesh, speed) :
#	tw.tween_property(cardMesh, "rotation_degrees",Vector3(cardMesh.rotation_degrees[0],180,cardMesh.rotation_degrees[2]),speed+2)


"""func alt_rearrenging_deck(deckOrder, deckCards, cardH, speed):
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
#	tw2.start()"""


"""func _on_tw_tween_all_completed():
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
#	pass # Replace with function body."""


"""func rearrenging_deck( deckCards, cardH, speed):
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
		#print(deckOrder.size())"""

func normalSummBtn_pressed(card):
	summon([card],"normal")
#	chain.insert(0,["summon",["normal"]])
	#print("added to chain!!!")
	pass


#func _on_normalSummBtn_pressed(card):
#	summon(card,"normal")
#print("sssssss ",card)
#	pass # Replace with function body.


"""func _on_screen_vfx_caches_cleared():
	print("cleared")
	pass # Replace with function body."""


func _on_ap_no_pressed():
	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/activation_popup".visible = false
	is_player_will_activate_effect = false
#	activation_confirm()
	pass # Replace with function body.


func _on_ap_yes_pressed():
	$"../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/activation_popup".visible = false
	is_player_will_activate_effect = true
	pass # Replace with function body.




func _on_m_pressed(m):
	if (current_state == "tribute" and players["pl1"]["field"]["m"][m]!={}) and ((players["pl1"]["field"]["m"]["m3"] in current_selected_cards) == false):
		current_selected_cards.append(players["pl1"]["field"]["m"][m].keys()[0])
#		print(players["pl1"]["field"]["m"][m], "being selected!!!")
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/selection_frame_container/pl1/"+m).visible = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/selection_frame_container/pl1/"+m).playing = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/summon_vfx_container/pl1/"+m).visible = true
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/summon_vfx_container/pl1/"+m).playing = true

	if current_selected_cards.size()>=min_current_card_selection_number:
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg2/selection_popup/confirm").disabled = false


func _on_duel_system_selection_completed():
	pass # Replace with function body.


func _on_confirm_pressed():
	get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg2/selection_popup/confirm").disabled = true
	get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg2").visible = false
	get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/popup_bg2/selection_popup").visible = false
	for card in current_selected_cards:
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/summon_vfx_container/"+duel_cards[card]["current"]["owner"]+"/"+duel_cards[card]["current"]["place"]).visible = false
		get_node("../main_HSplitContainer/VBoxContainer/duelField/opHandAndField/main_duel_field_screen/ViewportContainer/Viewport/summon_vfx_container/"+duel_cards[card]["current"]["owner"]+"/"+duel_cards[card]["current"]["place"]).playing = false
