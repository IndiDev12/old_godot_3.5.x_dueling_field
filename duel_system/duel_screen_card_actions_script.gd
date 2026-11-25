extends PanelContainer



onready var original_screen_card_controller_size_x = get_node("../main_HSplitContainer/screen_card_controller").get_rect().size[0]
onready var original_current_card_info_screen_size_x = 166.897
onready var original_current_card_info_screen_size_y = 241.379
onready var window_width = get_viewport_rect().size[0]
onready var window_hieght = get_viewport_rect().size[1]
var currenr_offest = -194#-534 # -343

var current_screen_card_texture
var current_screen_card_id

var attr_earth = preload("res://textures/attributes/earth.png")
var attr_water = preload("res://textures/attributes/water.png")
var attr_fire = preload("res://textures/attributes/fire.png")
var attr_wind = preload("res://textures/attributes/wind.png")
var attr_light = preload("res://textures/attributes/light.png")
var attr_dark = preload("res://textures/attributes/dark.png")
var attr_divine = preload("res://textures/attributes/divine.png")
var attr_spell = preload("res://textures/attributes/spell.png")
var attr_trap = preload("res://textures/attributes/trap.png")

var mons_type_warrior = preload("res://textures/monster_types/warrior.png")
var mons_type_aqua = preload("res://textures/monster_types/aqua.png")
var mons_type_beast_warrior = preload("res://textures/monster_types/beast-warrior.png")
var mons_type_dinosaur = preload("res://textures/monster_types/dinosaur.png")
var mons_type_beast = preload("res://textures/monster_types/beast.png")
var mons_type_cyverse = preload("res://textures/monster_types/cyberse.png")
var mons_type_divine_beast = preload("res://textures/monster_types/divine-beast.png")
var mons_type_diviner_beast = preload("res://textures/monster_types/diviner-beast.png")
var mons_type_dragon = preload("res://textures/monster_types/dragon.png")
var mons_type_fairy = preload("res://textures/monster_types/fairy.png")
var mons_type_fiend = preload("res://textures/monster_types/fiend.png")
var mons_type_fish = preload("res://textures/monster_types/fish.png")
var mons_type_insect = preload("res://textures/monster_types/insect.png")
var mons_type_machine = preload("res://textures/monster_types/machine.png")
var mons_type_plant = preload("res://textures/monster_types/plant.png")
var mons_type_psychic = preload("res://textures/monster_types/psychic.png")
var mons_type_pyro = preload("res://textures/monster_types/pyro.png")
var mons_type_reptile = preload("res://textures/monster_types/reptile.png")
var mons_type_rock = preload("res://textures/monster_types/rock.png")
var mons_type_sea_serpent = preload("res://textures/monster_types/sea-serpent.png")
var mons_type_spellcaster = preload("res://textures/monster_types/spellcaster.png")
var mons_type_thunder = preload("res://textures/monster_types/thunder.png")
var mons_type_winged_beast = preload("res://textures/monster_types/winged-beast.png")
var mons_type_wyrm = preload("res://textures/monster_types/wyrm.png")
var mons_type_zombie = preload("res://textures/monster_types/zombie.png")

var sptr_type_Continuous = preload("res://textures/spell_trap_types/Continuous.png")
var sptr_type_Counter = preload("res://textures/spell_trap_types/Counter.png")
var sptr_type_Equip = preload("res://textures/spell_trap_types/Equip.png")
var sptr_type_Field = preload("res://textures/spell_trap_types/Field.png")
var sptr_type_Quick_Play = preload("res://textures/spell_trap_types/Quick-Play.png")
var sptr_type_Ritual = preload("res://textures/spell_trap_types/Ritual.png")

var effect_mons_card_type = preload("res://textures/card_type/deck_plane_effect.png")
var effect_p_mons_card_type = preload("res://textures/card_type/deck_plane_effect_pendulum.png")
var normal_mons_card_type = preload("res://textures/card_type/deck_plane_normal.png")
var normal_p_mons_card_type = preload("res://textures/card_type/deck_plane_normal_pendulum.png")
var fusion_mons_card_type = preload("res://textures/card_type/deck_plane_fusion.png")
var fusion_p_mons_card_type = preload("res://textures/card_type/deck_plane_fusion_pendulum.png")
var ritual_mons_card_type = preload("res://textures/card_type/deck_plane_ritual.png")
var ritual_p_mons_card_type = preload("res://textures/card_type/deck_plane_ritual_pendulum.png")
var synchro_mons_card_type = preload("res://textures/card_type/deck_plane_synchro.png")
var synchro_p_mons_card_type = preload("res://textures/card_type/deck_plane_synchro_pendulum.png")
var xyz_mons_card_type = preload("res://textures/card_type/deck_plane_xyz.png")
var xyz_p_mons_card_type = preload("res://textures/card_type/deck_plane_xyz_pendulum.png")
var link_mons_card_type = preload("res://textures/card_type/deck_plane_link.png")
var spell_card = preload("res://textures/card_type/deck_plane_spell.png")
var trap_card = preload("res://textures/card_type/deck_plane_trap.png")
var token_mons_card_type = preload("res://textures/card_type/deck_plane_token.png")
var slifer_mons_card_type = preload("res://textures/card_type/deck_plane_slifer.png")
var oblisk_mons_card_type = preload("res://textures/card_type/deck_plane_oblisk.png")
var ra_mons_card_type = preload("res://textures/card_type/deck_plane_ra.png")

var level_star = preload("res://textures/level_rank_pendulum_links/level.png")
var rank_star = preload("res://textures/level_rank_pendulum_links/rank.png")
var pendulum_scale = preload("res://textures/level_rank_pendulum_links/pendulum_scale.png")

var oblisk_font = "[color=#5d95ff][center][shake rate=50 level=10]"
var oblisk_font_close = "[/shake][/center][/color]"
var ra_font = "[color=#ffe32f][center][tornado radius=15 freq=1]"
var ra_font_close = "[/color][/center][/tornado]"
var slifer_font = "[color=#ff4848][center][wave amp=80 freq=8]"
var slifer_font_close = "[/color]/[center][/wave]"

#var monster_type_list = [1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216]
#var attribute_list = [1,2,4,8,16,32,64]
#var card_type_list = [33554465,33,16777249,8225,97,8388641,16777313,16785441,25165857,67108897,17,16401,67108865,129,161,16777280,16777344,16777472,4193,12321,8193,65,4161,33558561,50331681,2097185,4129,5153,4113,1057,2081,8388609,18874401,4257,20497,16777233,545,673,16781345,16781329,37748769,4194337,16777377,2101281,33554977,16777761,1048580,524290,262146,131076,131074,65538,16384,130,4,2]
var special_card_type_list = ["10000000","10000010","10000020"]

var monster_type_list = ["Warrior","Spellcaster","Fairy","Fiend","Zombie","Machine","Aqua","Pyro","Rock","Winged-Beast","Plant","Insect","Thunder","Dragon","Beast","Beast-Warrior","Dinosaur","Fish","Sea Serpent","Reptile","Psychic","Divine-Beast","Diviner-Beast","Wyrm","Cyverse"]
var attribute_list = ["Earth","Water","Fire","Wind","Light","Dark","Divine"]
var card_type_list = ["Special-Summon/Effect","Effect","Pendulum/Effect","Synchro/Effect","Fusion/Effect","Xyz/Effect","Fusion/Pendulum/Effect","Synchro/Pendulum/Effect","Xyz/Pendulum/Effect","Link/Effect","Normal","Token","Link","Ritual","Ritual/Effect","","","","Fusion/Tuner/Effect","Synchro/Tuner/Effect","Synchro","Fusion","Fusion/Tuner","Special-Summon/Tuner/Effect","Special-Summon/Pendulum/Effect","Flip/Effect","Tuner/Effect","Union/Tuner/Effect","Normal/Tuner","Union/Effect","Gemini/Effect","Xyz","Pendulum/Flip/Effect","Ritual/Tuner/Effect","Token/Tuner","Pendulum/Normal","Spirit/Effect","Ritual/Spirit/Effect","Pendulum/Tuner/Effect","Pendulum/Tuner/Normal","Special-Summon/Toon/Effect","Toon/Effect","Pendulum/Ritual/Effect","Flip/Tuner/Effect","Special-Summon/Spirit/Effect","Pendulum/Spirit/Effect","Counter/Trap","Field/Spell","Equip/Spell","Continuous/Trap","Continuous/Spell","Quick-Play/Spell","","Ritual/Spell","Trap","Spell"]

var monster_type_textures_list = [mons_type_warrior,mons_type_spellcaster,mons_type_fairy,mons_type_fiend,mons_type_zombie,mons_type_machine,mons_type_aqua,mons_type_pyro,mons_type_rock,mons_type_winged_beast,mons_type_plant,mons_type_insect,mons_type_thunder,mons_type_dragon,mons_type_beast,mons_type_beast_warrior,mons_type_dinosaur,mons_type_fish,mons_type_sea_serpent,mons_type_reptile,mons_type_psychic,mons_type_divine_beast,mons_type_diviner_beast,mons_type_wyrm,mons_type_cyverse]
var attribute_texture_list = [attr_earth,attr_water,attr_fire,attr_wind,attr_light,attr_dark,attr_divine]
var card_type_texture_list = [effect_mons_card_type,effect_mons_card_type,effect_p_mons_card_type,synchro_mons_card_type,fusion_mons_card_type,xyz_mons_card_type,fusion_p_mons_card_type,synchro_p_mons_card_type,xyz_p_mons_card_type,link_mons_card_type,normal_mons_card_type,token_mons_card_type,link_mons_card_type,ritual_mons_card_type,ritual_mons_card_type,"","","",fusion_mons_card_type,synchro_mons_card_type,synchro_mons_card_type,fusion_mons_card_type,fusion_mons_card_type,effect_mons_card_type,effect_p_mons_card_type,effect_mons_card_type,effect_mons_card_type,effect_mons_card_type,normal_mons_card_type,effect_mons_card_type,effect_mons_card_type,xyz_mons_card_type,effect_p_mons_card_type,ritual_mons_card_type,token_mons_card_type,normal_p_mons_card_type,effect_mons_card_type,ritual_mons_card_type,effect_p_mons_card_type,normal_p_mons_card_type,effect_mons_card_type,effect_mons_card_type,ritual_p_mons_card_type,effect_mons_card_type,effect_mons_card_type,effect_p_mons_card_type,trap_card,spell_card,spell_card,trap_card,spell_card,spell_card,spell_card,spell_card,trap_card,spell_card]
var special_card_type_texture_list = [oblisk_mons_card_type,ra_mons_card_type,slifer_mons_card_type]
var special_card_type_font_list = [oblisk_font,ra_font,slifer_font]
var special_card_type_font_close_list = [oblisk_font_close,ra_font_close,slifer_font_close]

var monster_type_text_list = ["Warrior","Spellcaster","Fairy","Fiend","Zombie","Machine","Aqua","Pyro","Rock","Winged-Beast","Plant","Insect","Thunder","Dragon","Beast","Beast-Warrior","Dinosaur","Fish","Sea Serpent","Reptile","Psychic","Divine-Beast","Diviner-Beast","Wyrm","Cyverse"]
var card_type_text_list = ["Special-Summon/Effect","Effect","Pendulum/Effect","Synchro/Effect","Fusion/Effect","Xyz/Effect","Fusion/Pendulum/Effect","Synchro/Pendulum/Effect","Xyz/Pendulum/Effect","Link/Effect","Normal","Token","Link","Ritual","Ritual/Effect","","","","Fusion/Tuner/Effect","Synchro/Tuner/Effect","Synchro","Fusion","Fusion/Tuner","Special-Summon/Tuner/Effect","Special-Summon/Pendulum/Effect","Flip/Effect","Tuner/Effect","Union/Tuner/Effect","Normal/Tuner","Union/Effect","Gemini/Effect","Xyz","Pendulum/Flip/Effect","Ritual/Tuner/Effect","Token/Tuner","Pendulum/Normal","Spirit/Effect","Ritual/Spirit/Effect","Pendulum/Tuner/Effect","Pendulum/Tuner/Normal","Special-Summon/Toon/Effect","Toon/Effect","Pendulum/Ritual/Effect","Flip/Tuner/Effect","Special-Summon/Spirit/Effect","Pendulum/Spirit/Effect","Counter/Trap","Field/Spell","Equip/Spell","Continuous/Trap","Continuous/Spell","Quick-Play/Spell","","Ritual/Spell","Trap","Spell"]

var level_rank_texture = [level_star,level_star,level_star,level_star,level_star,rank_star,level_star,level_star,rank_star,rank_star,level_star,level_star,rank_star,level_star,level_star,rank_star,rank_star,rank_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,rank_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star]
var spell_trap_type_texture = [sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Counter,sptr_type_Field,sptr_type_Equip,sptr_type_Continuous,sptr_type_Continuous,sptr_type_Quick_Play,sptr_type_Field,sptr_type_Ritual,sptr_type_Field,sptr_type_Field]
var spell_trap_attribute_texture = [sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,sptr_type_Field,attr_trap,attr_spell,attr_spell,attr_trap,attr_spell,attr_spell,attr_spell,attr_spell,attr_trap,attr_spell]
var level_rank_visiblity = [true,true,true,true,true,true,true,true,true,false,true,true,false,true,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false]
var pendulume_scale_visiblity = [false,false,true,false,false,false,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,true,false,false,true,true,false,false,true,false,false,true,false,false,false,false,false,false,false,false,false,false]
var link_arrows_visiblity = [false,false,false,false,false,false,false,false,false,true,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
var monster_attribute_visiblity = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false]
var monster_type_visiblity = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false]
var spell_trap_attribute_visiblity = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,true,true]
var spell_trap_type_visiblity = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,false,true,false,false]


var t_arrow = [0,1]
var tl_arrow = [0,1]
var l_arrow = [0,1]
var bl_arrow = [0,1]
var b_arrow = [0,1]
var br_arrow = [0,1]
var r_arrow = [0,1]
var tr_arrow = [0,1]

var t_arrow_visiblty = [false,true]
var tl_arrow_visiblty = [false,true]
var l_arrow_visiblty = [false,true]
var bl_arrow_visiblty = [false,true]
var b_arrow_visiblty = [false,true]
var br_arrow_visiblty = [false,true]
var r_arrow_visiblty = [false,true]
var tr_arrow_visiblty = [false,true]


#var bbcode_name
#var bbcode_atk 
#var bbcode_def
#var bbcode_card_type

var atk_def_text #= "\n[center]ATK/ "+bbcode_atk+" "+"DEF/ "+bbcode_def+"[/center]"

#var atk_def_text_visiblity = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text]

# Called when the node enters the scene tree for the first time.
func _ready():
#	print( "flippy",card_type_list.find("Flip/Effect"))
	get_node("../main_HSplitContainer").split_offset = -100#-193#-533





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currenr_offest != get_node("../main_HSplitContainer").split_offset and currenr_offest>=-194:#-534:# and currenr_offest<-400:#-343:
		var current_screen_card_controller_size_x = get_node("../main_HSplitContainer/screen_card_controller").get_rect().size[0]
		var current_screen_card_size_x = get_node("../the_screen_card").get_rect().size[0]
		var the_ratio = original_screen_card_controller_size_x/current_screen_card_controller_size_x
		var screen_card_position = Vector2(5,5)
		var screen_card_size = Vector2(original_current_card_info_screen_size_x / (the_ratio), original_current_card_info_screen_size_y / (the_ratio))
		get_node("../the_screen_card").set_position(screen_card_position)
		get_node("../the_screen_card").set_size(Vector2(original_current_card_info_screen_size_x / (the_ratio), original_current_card_info_screen_size_y / (the_ratio)))
#
		get_node("../att_lv_type").set_position(Vector2(0, (original_current_card_info_screen_size_y / (the_ratio)+10)))
		get_node("../att_lv_type").set_size(Vector2((original_current_card_info_screen_size_x / (the_ratio))+6, 31))
		get_node("../disc").set_position(Vector2(0, get_node("../att_lv_type").get_rect().position[1]+31))
		get_node("../disc").set_size(Vector2(get_node("../att_lv_type").get_rect().size[0], window_hieght-get_node("../the_screen_card").get_rect().size[1]-40))
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(0,0, Vector2(0, get_node("../the_screen_card").get_rect().size[1]))
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(0,1, Vector2(get_node("../the_screen_card").get_rect().size[0], get_node("../the_screen_card").get_rect().size[1]))
#
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(1,0, Vector2((get_node("../the_screen_card").get_rect().size[0]/2)+5,5))
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(1,1, Vector2(5,5))
		currenr_offest =  get_node("../main_HSplitContainer").split_offset
#	pass



func card_hoverOn_mouse_action(card_props,card_texture):
	var card_name
	var card_type
	atk_def_text = "\n[center]ATK/ "+str(card_props["atk"])+" "+"DEF/ "+str(card_props["def"])+"[/center]"
	var atk_def_text_visiblity =[atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,atk_def_text,"","","","","","","","","",""] 
	var atk_def
	if card_texture != current_screen_card_texture:
		current_screen_card_texture = card_texture
		get_node("../the_screen_card/screen_card_animation_player").play_backwards("RESET")
		get_node("../the_screen_card/screen_card_animation_player").play("ScreenCardAnimation")
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,0, current_screen_card_texture)
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,1, current_screen_card_texture)
#-------------------------------------------------------------------------------------------------------------------------------------
	if card_props["id"] != current_screen_card_id:
		get_node("../att_lv_type/HBoxContainer/monster_type").texture = monster_type_textures_list[monster_type_list.find(card_props["race"])]
		get_node("../att_lv_type/HBoxContainer/monster_attribute").texture = attribute_texture_list[attribute_list.find(card_props["attribute"])]
		if card_props["id"] in special_card_type_list:
			get_node("../att_lv_type/TextureRect").texture = special_card_type_texture_list[special_card_type_list.find(card_props["id"])]
			card_name = special_card_type_font_list[special_card_type_list.find(card_props["id"])]+card_props["card_name"]+special_card_type_font_close_list[special_card_type_list.find(card_props["id"])]
		else:
			get_node("../att_lv_type/TextureRect").texture = card_type_texture_list[card_type_list.find(card_props["card_type"])]
			card_name = "[center]"+card_props["card_name"]+"[/center]"

		card_type = "[center]"+card_type_text_list[card_type_list.find(card_props["card_type"])]+"[/center]"
		get_node("../att_lv_type/HBoxContainer/level_rank_star/Label").text = str(card_props["level"])
#		get_node("../disc/VBoxContainer/name_text").text = card_props["card_name"]
#		get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = ""
		get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = card_props["description"]
		#get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = get_node(card_path+"/"+card).editor_description.split("\n")[-1]
#		for a_line in range(21,get_node(card_path+"/"+card).editor_description.split("\n").size()):
#			if a_line != get_node(card_path+"/"+card).editor_description.split("\n").size():
#				 get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text += get_node(card_path+"/"+card).editor_description.split("\n")[a_line]+"\n"
#			else:
#				get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text += get_node(card_path+"/"+card).editor_description.split("\n")[a_line]
#
		
#		if get_node(card_path+"/"+card).editor_description.split("\n")[5] == "-2":
#			atk_text = "?"
#		if get_node(card_path+"/"+card).editor_description.split("\n")[6] == "-2":
#			def_text = "?"
		atk_def =atk_def_text_visiblity[card_type_list.find(card_props["card_type"])]#"[center]ATK/ "+str(atk_text)+" "+"DEF/ "+str(def_text)+"[/center]"
		
		get_node("../att_lv_type/HBoxContainer/level_rank_star").visible = level_rank_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/level_rank_star").texture = level_rank_texture[card_type_list.find(card_props["card_type"])]
		
		get_node("../att_lv_type/HBoxContainer/pendulum_scale").visible = pendulume_scale_visiblity[card_type_list.find(card_props["card_type"])]
		#get_node("../att_lv_type/HBoxContainer/pendulum_scale/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[12]
		
		get_node("../att_lv_type/HBoxContainer/link_arrows").visible = link_arrows_visiblity[card_type_list.find(card_props["card_type"])]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/empty/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[7]
		
		get_node("../att_lv_type/HBoxContainer/monster_attribute").visible =  monster_attribute_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_attribute").visible =  spell_trap_attribute_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_attribute").texture = spell_trap_attribute_texture[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/monster_type").visible = monster_type_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_type").texture = spell_trap_type_texture[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_type").visible = spell_trap_type_visiblity[card_type_list.find(card_props["card_type"])]
		
		get_node("../disc/VBoxContainer/name_atk_def_type").bbcode_text = card_name+"\n"+card_type+atk_def
#		get_node("../disc/VBoxContainer/atk_def").visible = not spell_trap_attribute_visiblity[card_type_list.find(card_props["card_type"])]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/t/t").visible = t_arrow_visiblty[t_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[13]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/tl/tl").visible = tl_arrow_visiblty[tl_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[20]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/l/l").visible = l_arrow_visiblty[l_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[19]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/bl/bl").visible = bl_arrow_visiblty[bl_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[18]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/b/b").visible = b_arrow_visiblty[b_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[17]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/br/br").visible = br_arrow_visiblty[br_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[16]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/r/r").visible = r_arrow_visiblty[r_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[15]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/tr/tr").visible = tr_arrow_visiblty[tr_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[14]))]





func old_card_hoverOn_mouse_action(card_props,card_texture):
	var atk_text = card_props["atk"]
	var def_text  = card_props["def"]
	if card_texture != current_screen_card_texture:
		current_screen_card_texture = card_texture
		get_node("../the_screen_card/screen_card_animation_player").play_backwards("RESET")
		get_node("../the_screen_card/screen_card_animation_player").play("ScreenCardAnimation")
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,0, current_screen_card_texture)
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,1, current_screen_card_texture)
#-------------------------------------------------------------------------------------------------------------------------------------
	if card_props["id"] != current_screen_card_id:
		get_node("../att_lv_type/HBoxContainer/monster_type").texture = monster_type_textures_list[monster_type_list.find(card_props["race"])]
		get_node("../att_lv_type/HBoxContainer/monster_attribute").texture = attribute_texture_list[attribute_list.find(card_props["attribute"])]
		if card_props["id"] in special_card_type_list:
			get_node("../att_lv_type/TextureRect").texture = special_card_type_texture_list[special_card_type_list.find(card_props["id"])]
			get_node("../disc/VBoxContainer/name_text").bbcode_text = special_card_type_font_list[special_card_type_list.find(card_props["id"])]+card_props["card_name"]
		else:
			get_node("../att_lv_type/TextureRect").texture = card_type_texture_list[card_type_list.find(card_props["card_type"])]
			get_node("../disc/VBoxContainer/name_text").bbcode_text = "[center]"+card_props["card_name"]+"[/center]"

		get_node("../disc/VBoxContainer/card_type").bbcode_text = "[center]"+card_type_text_list[card_type_list.find(card_props["card_type"])]+"[/center]"
		get_node("../att_lv_type/HBoxContainer/level_rank_star/Label").text = str(card_props["level"])
#		get_node("../disc/VBoxContainer/name_text").text = card_props["card_name"]
#		get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = ""
		get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = card_props["description"]
		#get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = get_node(card_path+"/"+card).editor_description.split("\n")[-1]
#		for a_line in range(21,get_node(card_path+"/"+card).editor_description.split("\n").size()):
#			if a_line != get_node(card_path+"/"+card).editor_description.split("\n").size():
#				 get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text += get_node(card_path+"/"+card).editor_description.split("\n")[a_line]+"\n"
#			else:
#				get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text += get_node(card_path+"/"+card).editor_description.split("\n")[a_line]
#
		
#		if get_node(card_path+"/"+card).editor_description.split("\n")[5] == "-2":
#			atk_text = "?"
#		if get_node(card_path+"/"+card).editor_description.split("\n")[6] == "-2":
#			def_text = "?"
		get_node("../disc/VBoxContainer/atk_def").bbcode_text ="[center]ATK/ "+str(atk_text)+" "+"DEF/ "+str(def_text)+"[/center]"
		
		get_node("../att_lv_type/HBoxContainer/level_rank_star").visible = level_rank_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/level_rank_star").texture = level_rank_texture[card_type_list.find(card_props["card_type"])]
		
		get_node("../att_lv_type/HBoxContainer/pendulum_scale").visible = pendulume_scale_visiblity[card_type_list.find(card_props["card_type"])]
		#get_node("../att_lv_type/HBoxContainer/pendulum_scale/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[12]
		
		get_node("../att_lv_type/HBoxContainer/link_arrows").visible = link_arrows_visiblity[card_type_list.find(card_props["card_type"])]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/empty/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[7]
		
		get_node("../att_lv_type/HBoxContainer/monster_attribute").visible =  monster_attribute_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_attribute").visible =  spell_trap_attribute_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_attribute").texture = spell_trap_attribute_texture[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/monster_type").visible = monster_type_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_type").texture = spell_trap_type_texture[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_type").visible = spell_trap_type_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../disc/VBoxContainer/atk_def").visible = not spell_trap_attribute_visiblity[card_type_list.find(card_props["card_type"])]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/t/t").visible = t_arrow_visiblty[t_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[13]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/tl/tl").visible = tl_arrow_visiblty[tl_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[20]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/l/l").visible = l_arrow_visiblty[l_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[19]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/bl/bl").visible = bl_arrow_visiblty[bl_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[18]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/b/b").visible = b_arrow_visiblty[b_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[17]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/br/br").visible = br_arrow_visiblty[br_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[16]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/r/r").visible = r_arrow_visiblty[r_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[15]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/tr/tr").visible = tr_arrow_visiblty[tr_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[14]))]






func oldest_card_hoverOn_mouse_action(card_props,card_texture):
	var atk_text = card_props["atk"]
	var def_text  = card_props["def"]
	if card_texture != current_screen_card_texture:
		current_screen_card_texture = card_texture
		get_node("../the_screen_card/screen_card_animation_player").play_backwards("RESET")
		get_node("../the_screen_card/screen_card_animation_player").play("ScreenCardAnimation")
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,0, current_screen_card_texture)
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,1, current_screen_card_texture)
#-------------------------------------------------------------------------------------------------------------------------------------
	if card_props["id"] != current_screen_card_id:
		get_node("../att_lv_type/HBoxContainer/monster_type").texture = monster_type_textures_list[monster_type_list.find(card_props["race"])]
		get_node("../att_lv_type/HBoxContainer/monster_attribute").texture = attribute_texture_list[attribute_list.find(card_props["attribute"])]
		if card_props["id"] in special_card_type_list:
			get_node("../att_lv_type/TextureRect").texture = special_card_type_texture_list[special_card_type_list.find(card_props["id"])]
		else:
			get_node("../att_lv_type/TextureRect").texture = card_type_texture_list[card_type_list.find(card_props["card_type"])]

		get_node("../disc/VBoxContainer/PanelContainer3/card_type").text = card_type_text_list[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/level_rank_star/Label").text = str(card_props["level"])
		get_node("../disc/VBoxContainer/PanelContainer/name_text").text = card_props["card_name"]
#		get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = ""
		get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = card_props["description"]
		#get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = get_node(card_path+"/"+card).editor_description.split("\n")[-1]
#		for a_line in range(21,get_node(card_path+"/"+card).editor_description.split("\n").size()):
#			if a_line != get_node(card_path+"/"+card).editor_description.split("\n").size():
#				 get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text += get_node(card_path+"/"+card).editor_description.split("\n")[a_line]+"\n"
#			else:
#				get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text += get_node(card_path+"/"+card).editor_description.split("\n")[a_line]
#
		
#		if get_node(card_path+"/"+card).editor_description.split("\n")[5] == "-2":
#			atk_text = "?"
#		if get_node(card_path+"/"+card).editor_description.split("\n")[6] == "-2":
#			def_text = "?"
		get_node("../disc/VBoxContainer/PanelContainer2/atk_def").text = "ATK/ "+str(atk_text)+" "+"DEF/ "+str(def_text)
		
		get_node("../att_lv_type/HBoxContainer/level_rank_star").visible = level_rank_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/level_rank_star").texture = level_rank_texture[card_type_list.find(card_props["card_type"])]
		
		get_node("../att_lv_type/HBoxContainer/pendulum_scale").visible = pendulume_scale_visiblity[card_type_list.find(card_props["card_type"])]
		#get_node("../att_lv_type/HBoxContainer/pendulum_scale/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[12]
		
		get_node("../att_lv_type/HBoxContainer/link_arrows").visible = link_arrows_visiblity[card_type_list.find(card_props["card_type"])]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/empty/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[7]
		
		get_node("../att_lv_type/HBoxContainer/monster_attribute").visible =  monster_attribute_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_attribute").visible =  spell_trap_attribute_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_attribute").texture = spell_trap_attribute_texture[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/monster_type").visible = monster_type_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_type").texture = spell_trap_type_texture[card_type_list.find(card_props["card_type"])]
		get_node("../att_lv_type/HBoxContainer/spell_trap_type").visible = spell_trap_type_visiblity[card_type_list.find(card_props["card_type"])]
		get_node("../disc/VBoxContainer/PanelContainer2").visible = not spell_trap_attribute_visiblity[card_type_list.find(card_props["card_type"])]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/t/t").visible = t_arrow_visiblty[t_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[13]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/tl/tl").visible = tl_arrow_visiblty[tl_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[20]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/l/l").visible = l_arrow_visiblty[l_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[19]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/bl/bl").visible = bl_arrow_visiblty[bl_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[18]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/b/b").visible = b_arrow_visiblty[b_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[17]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/br/br").visible = br_arrow_visiblty[br_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[16]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/r/r").visible = r_arrow_visiblty[r_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[15]))]
#		get_node("../att_lv_type/HBoxContainer/link_arrows/tr/tr").visible = tr_arrow_visiblty[tr_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[14]))]


### field zones-----------------------------------------------------------------------
func _on_m1_mouse_entered():
	pass # Replace with function body.
