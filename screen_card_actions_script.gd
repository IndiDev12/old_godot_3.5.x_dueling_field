extends Panel

var current_screen_card_texture

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const deci_to_hex = preload("res://addons/PressAccept/Byter/Hexadecimal.gd")
var new_deci_to_hex = deci_to_hex.new()

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
var mons_type_illusion = preload("res://textures/monster_types/illusion.png")



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



var monster_type_list = [1,2,4,8,16,32,33554432,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288,1048576,2097152,4194304,8388608,16777216]
var attribute_list = [1,2,4,8,16,32,64]
var card_type_list = [33554465,33,16777249,8225,97,8388641,16777313,16785441,25165857,67108897,17,16401,67108865,129,161,16777280,16777344,16777472,4193,12321,8193,65,4161,33558561,50331681,2097185,4129,5153,4113,1057,2081,8388609,18874401,4257,20497,16777233,545,673,16781345,16781329,37748769,4194337,16777377,2101281,33554977,16777761,1048580,524290,262146,131076,131074,65538,16384,130,4,2,    2097313]
var special_card_type_list = [10000000,10000010,10000020]


var monster_type_textures_list = [mons_type_warrior,mons_type_spellcaster,mons_type_fairy,mons_type_fiend,mons_type_zombie,mons_type_machine,mons_type_illusion, mons_type_aqua,mons_type_pyro,mons_type_rock,mons_type_winged_beast,mons_type_plant,mons_type_insect,mons_type_thunder,mons_type_dragon,mons_type_beast,mons_type_beast_warrior,mons_type_dinosaur,mons_type_fish,mons_type_sea_serpent,mons_type_reptile,mons_type_psychic,mons_type_divine_beast,mons_type_diviner_beast,mons_type_wyrm,mons_type_cyverse]
var attribute_texture_list = [attr_earth,attr_water,attr_fire,attr_wind,attr_light,attr_dark,attr_divine]
var card_type_texture_list = [effect_mons_card_type,effect_mons_card_type,effect_p_mons_card_type,synchro_mons_card_type,fusion_mons_card_type,xyz_mons_card_type,fusion_p_mons_card_type,synchro_p_mons_card_type,xyz_p_mons_card_type,link_mons_card_type,normal_mons_card_type,token_mons_card_type,link_mons_card_type,ritual_mons_card_type,ritual_mons_card_type,"","","",fusion_mons_card_type,synchro_mons_card_type,synchro_mons_card_type,fusion_mons_card_type,fusion_mons_card_type,effect_mons_card_type,effect_p_mons_card_type,effect_mons_card_type,effect_mons_card_type,effect_mons_card_type,normal_mons_card_type,effect_mons_card_type,effect_mons_card_type,xyz_mons_card_type,effect_p_mons_card_type,ritual_mons_card_type,token_mons_card_type,normal_p_mons_card_type,effect_mons_card_type,ritual_mons_card_type,effect_p_mons_card_type,normal_p_mons_card_type,effect_mons_card_type,effect_mons_card_type,ritual_p_mons_card_type,effect_mons_card_type,effect_mons_card_type,effect_p_mons_card_type,trap_card,spell_card,spell_card,trap_card,spell_card,spell_card,spell_card,spell_card,trap_card,spell_card ,     ritual_mons_card_type]
var special_card_type_texture_list = [oblisk_mons_card_type,ra_mons_card_type,slifer_mons_card_type]

var monster_type_text_list = ["Warrior","Spellcaster","Fairy","Fiend","Zombie","Machine","Illusion", "Aqua","Pyro","Rock","Winged-Beast","Plant","Insect","Thunder","Dragon","Beast","Beast-Warrior","Dinosaur","Fish","Sea Serpent","Reptile","Psychic","Divine-Beast","Diviner-Beast","Wyrm","Cyverse"]
var card_type_text_list = ["Special-Summon/Effect","Effect","Pendulum/Effect","Synchro/Effect","Fusion/Effect","Xyz/Effect","Fusion/Pendulum/Effect","Synchro/Pendulum/Effect","Xyz/Pendulum/Effect","Link/Effect","Normal","Token","Link","Ritual","Ritual/Effect","","","","Fusion/Tuner/Effect","Synchro/Tuner/Effect","Synchro","Fusion","Fusion/Tuner","Special-Summon/Tuner/Effect","Special-Summon/Pendulum/Effect","Flip/Effect","Tuner/Effect","Union/Tuner/Effect","Normal/Tuner","Union/Effect","Gemini/Effect","Xyz","Pendulum/Flip/Effect","Ritual/Tuner/Effect","Token/Tuner","Pendulum/Normal","Spirit/Effect","Ritual/Spirit/Effect","Pendulum/Tuner/Effect","Pendulum/Tuner/Normal","Special-Summon/Toon/Effect","Toon/Effect","Pendulum/Ritual/Effect","Flip/Tuner/Effect","Special-Summon/Spirit/Effect","Pendulum/Spirit/Effect","Counter/Trap","Field/Spell","Equip/Spell","Continuous/Trap","Continuous/Spell","Quick-Play/Spell","","Ritual/Spell","Trap","Spell",      "Ritual/Flip/Effect"]

var level_rank_texture = [level_star,level_star,level_star,level_star,level_star,rank_star,level_star,level_star,rank_star,rank_star,level_star,level_star,rank_star,level_star,level_star,rank_star,rank_star,rank_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,rank_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,level_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,rank_star,      level_star]
var level_rank_visiblity = [true,true,true,true,true,true,true,true,true,false,true,true,false,true,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,    true]
var pendulume_scale_visiblity = [false,false,true,false,false,false,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,true,false,false,true,true,false,false,true,false,false,true,false,false,false,false,false,false,false,false,false,false,    false]
var link_arrows_visiblity = [false,false,false,false,false,false,false,false,false,true,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,   false]
var monster_attribute_visiblity = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,   true]
var monster_type_visiblity = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,   true]
var spell_trap_attribute_visiblity = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,true,true,    false]

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


var main_deck_cards = []
var extra_deck_cards = []
var side_deck_cards = []

var card_alais = []

var last_main_deck_card = 0
var last_side_deck_card = 0
var last_extra_deck_card = 0

var normal_cards_count = 0
var ritual_cards_count = 0
var effect_cards_count = 0
var fusion_cards_count = 0
var synchro_cards_count = 0
var xyz_cards_count = 0
var link_cards_count = 0
var normal_p_cards_count = 0
var effect_p_cards_count = 0
var ritual_p_cards_count = 0
var fusion_p_cards_count = 0
var synchro_p_cards_count = 0
var xyz_p_cards_count = 0
var spell_cards_count = 0
var trap_cards_count = 0


var ban_list = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_script_send_ban_list(sended_ban_list):
	ban_list = sended_ban_list

func _on_empty_card_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card")

func _on_empty_card2_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card2")

func _on_empty_card3_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card3")
	
func _on_empty_card4_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card4")

func _on_empty_card5_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card5")
	
func _on_empty_card6_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card6")
	
func _on_empty_card7_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card7")
	
func _on_empty_card8_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card8")

func _on_empty_card9_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card9")

func _on_empty_card10_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card10")
	
func _on_empty_card11_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card11")
	
func _on_empty_card12_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card12")

func _on_empty_card13_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card13")
	
func _on_empty_card14_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card14")

func _on_empty_card15_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card15")
	
func _on_empty_card16_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card16")
	
func _on_empty_card17_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card17")
	
func _on_empty_card18_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card18")
	
func _on_empty_card19_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card19")

func _on_empty_card20_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card20")
	
func _on_empty_card21_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card21")
	
func _on_empty_card22_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card22")
	
func _on_empty_card23_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card23")
	
func _on_empty_card24_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/","empty_card24")



func _on_mdeck_card_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card")
func _on_mdeck_card2_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card2")
func _on_mdeck_card3_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card3")
func _on_mdeck_card4_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card4")
func _on_mdeck_card5_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card5")
func _on_mdeck_card6_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card6")
func _on_mdeck_card7_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card7")
func _on_mdeck_card8_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card8")
func _on_mdeck_card9_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card9")
func _on_mdeck_card10_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card10")
func _on_mdeck_card11_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card11")
func _on_mdeck_card12_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card12")
func _on_mdeck_card13_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card13")
func _on_mdeck_card14_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card14")
func _on_mdeck_card15_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card15")
func _on_mdeck_card16_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card16")
func _on_mdeck_card17_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card17")
func _on_mdeck_card18_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card18")
func _on_mdeck_card19_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card19")
func _on_mdeck_card20_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card20")
func _on_mdeck_card21_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card21")
func _on_mdeck_card22_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card22")
func _on_mdeck_card23_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card23")
func _on_mdeck_card24_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card24")
func _on_mdeck_card25_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card25")
func _on_mdeck_card26_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card26")
func _on_mdeck_card27_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card27")
func _on_mdeck_card28_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card28")
func _on_mdeck_card29_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card29")
func _on_mdeck_card30_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card30")
func _on_mdeck_card31_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card31")
func _on_mdeck_card32_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card32")
func _on_mdeck_card33_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card33")
func _on_mdeck_card34_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card34")
func _on_mdeck_card35_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card35")
func _on_mdeck_card36_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card36")
func _on_mdeck_card37_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card37")
func _on_mdeck_card38_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card38")
func _on_mdeck_card39_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card39")
func _on_mdeck_card40_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card40")
func _on_mdeck_card41_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card41")
func _on_mdeck_card42_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card42")
func _on_mdeck_card43_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card43")
func _on_mdeck_card44_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card44")
func _on_mdeck_card45_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card45")
func _on_mdeck_card46_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card46")
func _on_mdeck_card47_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card47")
func _on_mdeck_card48_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card48")
func _on_mdeck_card49_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card49")
func _on_mdeck_card50_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card50")
func _on_mdeck_card51_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card51")
func _on_mdeck_card52_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card52")
func _on_mdeck_card53_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card53")
func _on_mdeck_card54_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card54")
func _on_mdeck_card55_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card55")
func _on_mdeck_card56_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card56")
func _on_mdeck_card57_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card57")
func _on_mdeck_card58_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card58")
func _on_mdeck_card59_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card59")
func _on_mdeck_card60_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card60")

func _on_exdeck_card1_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card1")
func _on_exdeck_card2_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card2")
func _on_exdeck_card3_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card3")
func _on_exdeck_card4_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card4")
func _on_exdeck_card5_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card5")
func _on_exdeck_card6_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card6")
func _on_exdeck_card7_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card7")
func _on_exdeck_card8_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card8")
func _on_exdeck_card9_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card9")
func _on_exdeck_card10_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card10")
func _on_exdeck_card11_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card11")
func _on_exdeck_card12_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card12")
func _on_exdeck_card13_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card13")
func _on_exdeck_card14_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card14")
func _on_exdeck_card15_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card15")

func _on_Scard1_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard1")
func _on_Scard2_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard2")
func _on_Scard3_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard3")
func _on_Scard4_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard4")
func _on_Scard5_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard5")
func _on_Scard6_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard6")
func _on_Scard7_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard7")
func _on_Scard8_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard8")
func _on_Scard9_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard9")
func _on_Scard10_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard10")
func _on_Scard11_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard11")
func _on_Scard12_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard12")
func _on_Scard13_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard13")
func _on_Scard14_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard14")
func _on_Scard15_mouse_entered():
	card_hoverOn_mouse_action("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard15")




func card_hoverOn_mouse_action(card_path,card):
	get_node("../card_frame").rect_global_position = get_node(card_path+"/"+card).rect_global_position - Vector2(5, 5)
	get_node("../card_frame").rect_size = get_node(card_path+"/"+card).rect_size + Vector2(10, 10)
	var atk_text = get_node(card_path+"/"+card).editor_description.split("\n")[5]
	var def_text = get_node(card_path+"/"+card).editor_description.split("\n")[6]
	if get_node(card_path+"/"+card).texture != current_screen_card_texture:
		current_screen_card_texture = get_node(card_path+"/"+card).texture
		get_node("../the_screen_card/screen_card_animation_player").play_backwards("RESET")
		get_node("../the_screen_card/screen_card_animation_player").play("ScreenCardAnimation")
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,0, current_screen_card_texture)
		get_node("../the_screen_card/screen_card_animation_player").get_animation("ScreenCardAnimation").track_set_key_value(2,1, current_screen_card_texture)
#-------------------------------------------------------------------------------------------------------------------------------------
		#print(get_node(card_path+"/"+card).editor_description)
		get_node("../att_lv_type/HBoxContainer/monster_type").texture = monster_type_textures_list[monster_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[8]))]
		get_node("../att_lv_type/HBoxContainer/monster_attribute").texture = attribute_texture_list[attribute_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[9]))]
		if int(get_node(card_path+"/"+card).editor_description.split("\n")[0]) in special_card_type_list:
			get_node("../att_lv_type/TextureRect").texture = special_card_type_texture_list[special_card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[0]))]
		else:
			get_node("../att_lv_type/TextureRect").texture = card_type_texture_list[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		#print(new_deci_to_hex.to_hexadecimal("101056520"))
		get_node("../disc/VBoxContainer/PanelContainer3/card_type").text = card_type_text_list[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		get_node("../att_lv_type/HBoxContainer/level_rank_star/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[7]
		get_node("../disc/VBoxContainer/PanelContainer/name_text").text = get_node(card_path+"/"+card).editor_description.split("\n")[11]
		get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = ""
		
		#get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text = get_node(card_path+"/"+card).editor_description.split("\n")[-1]
		for a_line in range(21,get_node(card_path+"/"+card).editor_description.split("\n").size()):
			if a_line != get_node(card_path+"/"+card).editor_description.split("\n").size():
				 get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text += get_node(card_path+"/"+card).editor_description.split("\n")[a_line]+"\n"
			else:
				get_node("../disc/VBoxContainer/ScrollContainer/disc_text").text += get_node(card_path+"/"+card).editor_description.split("\n")[a_line]
		
		
		if get_node(card_path+"/"+card).editor_description.split("\n")[5] == "-2":
			atk_text = "?"
		if get_node(card_path+"/"+card).editor_description.split("\n")[6] == "-2":
			def_text = "?"
		get_node("../disc/VBoxContainer/PanelContainer2/atk_def").text = "ATK/ "+atk_text+" "+"DEF/ "+def_text
		
		get_node("../att_lv_type/HBoxContainer/level_rank_star").visible = level_rank_visiblity[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		get_node("../att_lv_type/HBoxContainer/level_rank_star").texture = level_rank_texture[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		
		get_node("../att_lv_type/HBoxContainer/pendulum_scale").visible = pendulume_scale_visiblity[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		get_node("../att_lv_type/HBoxContainer/pendulum_scale/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[12]
		
		get_node("../att_lv_type/HBoxContainer/link_arrows").visible = link_arrows_visiblity[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		get_node("../att_lv_type/HBoxContainer/link_arrows/empty/Label").text = get_node(card_path+"/"+card).editor_description.split("\n")[7]
		
		get_node("../att_lv_type/HBoxContainer/monster_attribute").visible =  monster_attribute_visiblity[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		get_node("../att_lv_type/HBoxContainer/spell_trap_attribute").visible =  spell_trap_attribute_visiblity[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		get_node("../att_lv_type/HBoxContainer/monster_type").visible = monster_type_visiblity[card_type_list.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[4]))]
		
		get_node("../att_lv_type/HBoxContainer/link_arrows/t/t").visible = t_arrow_visiblty[t_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[13]))]
		get_node("../att_lv_type/HBoxContainer/link_arrows/tl/tl").visible = tl_arrow_visiblty[tl_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[20]))]
		get_node("../att_lv_type/HBoxContainer/link_arrows/l/l").visible = l_arrow_visiblty[l_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[19]))]
		get_node("../att_lv_type/HBoxContainer/link_arrows/bl/bl").visible = bl_arrow_visiblty[bl_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[18]))]
		get_node("../att_lv_type/HBoxContainer/link_arrows/b/b").visible = b_arrow_visiblty[b_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[17]))]
		get_node("../att_lv_type/HBoxContainer/link_arrows/br/br").visible = br_arrow_visiblty[br_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[16]))]
		get_node("../att_lv_type/HBoxContainer/link_arrows/r/r").visible = r_arrow_visiblty[r_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[15]))]
		get_node("../att_lv_type/HBoxContainer/link_arrows/tr/tr").visible = tr_arrow_visiblty[tr_arrow.find(int(get_node(card_path+"/"+card).editor_description.split("\n")[14]))]
		#print(get_node(card_path+card).editor_description)

	#pass # Replace with function body.


func _on_empty_card_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card")

func _on_empty_card2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card2")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card2")

func _on_empty_card3_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card3")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card3")

func _on_empty_card4_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card4")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card4")

func _on_empty_card5_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card5")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card5")

func _on_empty_card6_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card6")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card6")

func _on_empty_card7_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card7")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card7")

func _on_empty_card8_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card8")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card8")

func _on_empty_card9_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card9")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card9")

func _on_empty_card10_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card10")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card10")

func _on_empty_card11_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card11")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card11")

func _on_empty_card12_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card12")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card12")

func _on_empty_card13_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card13")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card13")

func _on_empty_card14_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card14")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card14")

func _on_empty_card15_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card15")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card15")

func _on_empty_card16_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card16")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card16")

func _on_empty_card17_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card17")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card17")

func _on_empty_card18_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card18")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card18")

func _on_empty_card19_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card19")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card19")

func _on_empty_card20_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card20")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card20")

func _on_empty_card21_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card21")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card21")

func _on_empty_card22_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card22")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card22")

func _on_empty_card23_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card23")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card23")

func _on_empty_card24_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			card_leftClick_mouse_action("empty_card24")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			card_rightClick_mouse_action("empty_card24")





func _on_mdeck_card_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card")

func _on_mdeck_card2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card2")

func _on_mdeck_card3_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card3")

func _on_mdeck_card4_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card4")

func _on_mdeck_card5_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card5")

func _on_mdeck_card6_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card6")

func _on_mdeck_card7_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card7")

func _on_mdeck_card8_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card8")

func _on_mdeck_card9_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card9")

func _on_mdeck_card10_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card10")

func _on_mdeck_card11_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card11")

func _on_mdeck_card12_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card12")

func _on_mdeck_card13_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card13")

func _on_mdeck_card14_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card14")

func _on_mdeck_card15_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card15")

func _on_mdeck_card16_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card16")

func _on_mdeck_card17_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card17")

func _on_mdeck_card18_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card18")

func _on_mdeck_card19_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card19")

func _on_mdeck_card20_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card20")

func _on_mdeck_card21_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card21")

func _on_mdeck_card22_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card22")

func _on_mdeck_card23_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card23")

func _on_mdeck_card24_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card24")

func _on_mdeck_card25_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card25")

func _on_mdeck_card26_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card26")

func _on_mdeck_card27_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card27")

func _on_mdeck_card28_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card28")

func _on_mdeck_card29_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card29")

func _on_mdeck_card30_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card30")

func _on_mdeck_card31_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card31")

func _on_mdeck_card32_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card32")

func _on_mdeck_card33_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card33")

func _on_mdeck_card34_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card34")

func _on_mdeck_card35_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card35")

func _on_mdeck_card36_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card36")

func _on_mdeck_card37_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card37")

func _on_mdeck_card38_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card38")

func _on_mdeck_card39_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card39")

func _on_mdeck_card40_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card40")

func _on_mdeck_card41_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card41")

func _on_mdeck_card42_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card42")

func _on_mdeck_card43_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card43")

func _on_mdeck_card44_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card44")

func _on_mdeck_card45_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card45")

func _on_mdeck_card46_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card46")

func _on_mdeck_card47_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card47")

func _on_mdeck_card48_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card48")

func _on_mdeck_card49_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card49")

func _on_mdeck_card50_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card50")

func _on_mdeck_card51_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card51")

func _on_mdeck_card52_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card52")

func _on_mdeck_card53_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card53")

func _on_mdeck_card54_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card54")

func _on_mdeck_card55_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card55")

func _on_mdeck_card56_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card56")

func _on_mdeck_card57_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card57")

func _on_mdeck_card58_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card58")

func _on_mdeck_card59_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card59")

func _on_mdeck_card60_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer","mdeck_card60")




func _on_exdeck_card1_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card1")

func _on_exdeck_card2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card2")

func _on_exdeck_card3_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card3")

func _on_exdeck_card4_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card4")

func _on_exdeck_card5_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card5")

func _on_exdeck_card6_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card6")

func _on_exdeck_card7_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card7")

func _on_exdeck_card8_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card8")

func _on_exdeck_card9_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card9")

func _on_exdeck_card10_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card10")

func _on_exdeck_card11_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card11")

func _on_exdeck_card12_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card12")

func _on_exdeck_card13_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card13")

func _on_exdeck_card14_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card14")

func _on_exdeck_card15_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer","exdeck_card15")


func _on_Scard1_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard1")

func _on_Scard2_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard2")

func _on_Scard3_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard3")

func _on_Scard4_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard4")

func _on_Scard5_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard5")

func _on_Scard6_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard6")

func _on_Scard7_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard7")

func _on_Scard8_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard8")

func _on_Scard9_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard9")

func _on_Scard10_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard10")

func _on_Scard11_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard11")

func _on_Scard12_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard12")

func _on_Scard13_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard13")

func _on_Scard14_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard14")

func _on_Scard15_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_RIGHT and event.pressed:
			remove_a_card_from_deck("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer","Scard15")






func card_leftClick_mouse_action(card):
	var ban_card_count = 3
#	var appropriate_deck = []
#	var max_number_of_card = 60

	print("add firsrt",last_main_deck_card)
	
	if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0] in ban_list["0"]:
		ban_card_count = 0
	elif get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0] in ban_list["1"]:
		ban_card_count = 1
	elif get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0] in ban_list["2"]:
		ban_card_count = 2


	if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4] in ["8225","16785441","12321","8193","97","16777313","4193","65","4161","8388641","25165857","8388609","67108897","67108865"]:
		#max_number_of_card = 15
		if extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])  < 3 and extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])+ side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < 3 and card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])< 3 and extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < ban_card_count and last_extra_deck_card < 15:
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer").get_child(last_extra_deck_card).visible = true
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer").get_child(last_extra_deck_card).texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).texture
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer").get_child(last_extra_deck_card).editor_description = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description
			
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer").get_child(last_extra_deck_card).get_child(0).get_child(0).text = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card+"/OTB/b").text
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer").get_child(last_extra_deck_card).get_child(0).get_child(1).text = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card+"/OTB/ot").text

			
			extra_deck_cards.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])
			if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2] !="0":
				card_alais.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
#			card_alais.append(get_node("../extra_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
			last_extra_deck_card += 1
			
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [97,4193,65,4161]:
				fusion_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [8225,12321,8193]:
				synchro_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [8388641,8388609]:
				xyz_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [67108897,67108865]:
				link_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16777313]:
				fusion_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16785441]:
				synchro_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [25165857]:
				xyz_p_cards_count += 1

	else:
		#max_number_of_card = 60
		if main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])  < 3 and main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])+ side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < 3 and card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])< 3 and main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < ban_card_count and last_main_deck_card < 60:
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_child(last_main_deck_card).visible = true
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_child(last_main_deck_card).texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).texture

			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_child(last_main_deck_card).get_child(0).get_child(0).text = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card+"/OTB/b").text
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_child(last_main_deck_card).get_child(0).get_child(1).text = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card+"/OTB/ot").text

			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_child(last_main_deck_card).editor_description = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description
			main_deck_cards.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])
			if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2] !="0":
				card_alais.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
#			card_alais.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
			last_main_deck_card += 1
			
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [17,4113,16781329]:
				normal_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [33,2097185,4129,5153,2081,18874401,545,16781345,37748769,4194337,2101281,33554977,16777761,33554465,33558561,50331681,16777249,33554465,33558561,50331681,37748769,33554977,33558561,4129,5153,16781345,2101281,2097185,18874401,2101281,5153,1057,2081,545,33554977,16777761,37748769,4194337]:
				effect_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [129,161,4257,673]:
				ritual_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16777233,16781329]:
				normal_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16777249,50331681,18874401,16781345,16777761]:
				effect_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16777377]:
				ritual_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [524290,262146,131074,65538,130,2]:
				spell_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [1048580,131076,4]:
				trap_cards_count += 1

	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/normal/label").text = str(normal_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/effect/label").text = str(effect_cards_count)

	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/ritual/label").text = str(ritual_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/fusion/label").text = str(fusion_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/synchro/label").text = str(synchro_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/xyz/label").text = str(xyz_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/link/label").text = str(link_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/normal_pendulum/label").text = str(normal_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/effect_pendulum/label").text = str(effect_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/ritual_pendulum/label").text = str(ritual_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/fusion_pendulum/label").text = str(fusion_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/synchro_pendulum/label").text = str(synchro_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/xyz_pendulum/label").text = str(xyz_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/spell/label").text = str(spell_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/trap/label").text = str(trap_cards_count)
	
	print("add last",last_main_deck_card)

#	if main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])  < 3 and main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])+ side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < 3 and card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])< 3 and main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < ban_card_count:#and last_main_deck_card < 60:
#		get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_child(last_main_deck_card).visible = true
#		get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_child(last_main_deck_card).texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).texture
#		get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_child(last_main_deck_card).editor_description = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description
#		main_deck_cards.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])
#		if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2] !="0":
#			card_alais.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
##		card_alais.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
#		last_main_deck_card += 1
#		get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer").texture = 

func card_rightClick_mouse_action(card):
	var ban_card_count = 3

	if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0] in ban_list["0"]:
		ban_card_count = 0
	elif get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0] in ban_list["1"]:
		ban_card_count = 1
	elif get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0] in ban_list["2"]:
		ban_card_count = 2


	if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4] in ["8225","16785441","12321","8193","97","16777313","4193","65","4161","8388641","25165857","8388609","67108897","67108865"]:
		if extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])  < 3 and extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])+ side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < 3 and card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])< 3 and extra_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < ban_card_count and last_side_deck_card < 15:
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).visible = true
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).texture
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).editor_description = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description

			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).get_child(0).get_child(0).text = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card+"/OTB/b").text
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).get_child(0).get_child(1).text = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card+"/OTB/ot").text

			side_deck_cards.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])
			if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2] !="0":
				card_alais.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
			last_side_deck_card += 1

			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [97,4193,65,4161]:
				fusion_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [8225,12321,8193]:
				synchro_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [8388641,8388609]:
				xyz_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [67108897,67108865]:
				link_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16777313]:
				fusion_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16785441]:
				synchro_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [25165857]:
				xyz_p_cards_count += 1
#			card_alais.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
	else:
		if main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])  < 3 and main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])+ side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < 3 and card_alais.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])< 3 and main_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) + side_deck_cards.count(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0]) < ban_card_count and last_side_deck_card < 15:
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).visible = true
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).texture = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).texture
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).editor_description = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description
			
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).get_child(0).get_child(0).text = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card+"/OTB/b").text
			get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_child(last_side_deck_card).get_child(0).get_child(1).text = get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card+"/OTB/ot").text
			
			side_deck_cards.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[0])
			if get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2] !="0":
				card_alais.append(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[2])
			last_side_deck_card += 1

			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [17,4113,16781329]:
				normal_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [33,2097185,4129,5153,2081,18874401,545,16781345,37748769,4194337,2101281,33554977,16777761,33554465,33558561,50331681,16777249,33554465,33558561,50331681,37748769,33554977,33558561,4129,5153,16781345,2101281,2097185,18874401,2101281,5153,1057,2081,545,33554977,16777761,37748769,4194337]:
				effect_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [129,161,4257,673]:
				ritual_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16777233,16781329]:
				normal_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16777249,50331681,18874401,16781345,16777761]:
				effect_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [16777377]:
				ritual_p_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [524290,262146,131074,65538,130,2]:
				spell_cards_count += 1
			if int(get_node("../main_HSplitContainer/HSplitContainer/searched_card_container/FlexGridContainer/"+card).editor_description.split("\n")[4]) in [1048580,131076,4]:
				trap_cards_count += 1

	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/normal/label").text = str(normal_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/effect/label").text = str(effect_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/ritual/label").text = str(ritual_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/fusion/label").text = str(fusion_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/synchro/label").text = str(synchro_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/xyz/label").text = str(xyz_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/link/label").text = str(link_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/normal_pendulum/label").text = str(normal_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/effect_pendulum/label").text = str(effect_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/ritual_pendulum/label").text = str(ritual_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/fusion_pendulum/label").text = str(fusion_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/synchro_pendulum/label").text = str(synchro_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/xyz_pendulum/label").text = str(xyz_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/spell/label").text = str(spell_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/trap/label").text = str(trap_cards_count)
#	last_side_deck_card += 1







func _on_y_Button_pressed():
	for main_deck_card in get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer").get_children():
		main_deck_card.visible = false
	
	for extra_deck_card in get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer").get_children():
		extra_deck_card.visible = false
	
	for side_deck_card in get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer").get_children():
		side_deck_card.visible = false

	main_deck_cards = []
	extra_deck_cards = []
	side_deck_cards = []
	card_alais = []
	
	last_main_deck_card = 0
	last_side_deck_card = 0
	last_extra_deck_card = 0
	normal_cards_count = 0
	ritual_cards_count = 0
	effect_cards_count = 0
	fusion_cards_count = 0
	synchro_cards_count = 0
	xyz_cards_count = 0
	link_cards_count = 0
	normal_p_cards_count = 0
	effect_p_cards_count = 0
	ritual_p_cards_count = 0
	fusion_p_cards_count = 0
	synchro_p_cards_count = 0
	xyz_p_cards_count = 0
	spell_cards_count = 0
	trap_cards_count = 0
	
	get_node("../dark_Bg").visible = false
	get_node("../clean_deck_window").visible = false


func _on_n_Button_pressed():
	get_node("../dark_Bg").visible = false
	get_node("../clean_deck_window").visible = false


func remove_a_card_from_deck(card_path,card):
	
	print("remove firsrt",last_main_deck_card)
	get_node(card_path+"/"+card).visible = false
#	get_node(card_path).move_child(get_node(card_path+"/"+card),-1)
	
	if card_path == "../main_HSplitContainer/HSplitContainer/VBoxContainer/main_deck/main_deck_container/GridContainer":
		get_node(card_path).move_child(get_node(card_path+"/"+card),last_main_deck_card)
		last_main_deck_card -= 1
		main_deck_cards.erase(get_node(card_path+"/"+card).editor_description.split("\n")[0])
		get_node(card_path).move_child(get_node(card_path+"/"+card),last_main_deck_card)
	
	if card_path == "../main_HSplitContainer/HSplitContainer/VBoxContainer/extra_deck/extra_deck_container/GridContainer":
		get_node(card_path).move_child(get_node(card_path+"/"+card),last_extra_deck_card)
		last_extra_deck_card -= 1
		extra_deck_cards.erase(get_node(card_path+"/"+card).editor_description.split("\n")[0])

	if card_path == "../main_HSplitContainer/HSplitContainer/VBoxContainer/side_deck/side_deck_container/GridContainer":
		get_node(card_path).move_child(get_node(card_path+"/"+card),last_side_deck_card)
		last_side_deck_card -= 1
		side_deck_cards.erase(get_node(card_path+"/"+card).editor_description.split("\n")[0])

	
	
	if get_node(card_path+"/"+card).editor_description.split("\n")[2] !="0":
		card_alais.erase(get_node(card_path+"/"+card).editor_description.split("\n")[2])

 

	#if get_node(card_path+"/"+card).editor_description.split("\n")[4] in ["8225","16785441","12321","8193","97","16777313","4193","65","4161","8388641","25165857","8388609","67108897","67108865"]:
		#last_extra_deck_card -=1

	#extra_deck_cards.erase(get_node(card_path+"/"+card).editor_description.split("\n")[0])

	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [97,4193,65,4161]:
		fusion_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [8225,12321,8193]:
		synchro_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [8388641,8388609]:
		xyz_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [67108897,67108865]:
		link_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [16777313]:
		fusion_p_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [16785441]:
		synchro_p_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [25165857]:
		xyz_p_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [17,4113,16781329]:
		normal_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [33,2097185,4129,5153,2081,18874401,545,16781345,37748769,4194337,2101281,33554977,16777761,33554465,33558561,50331681,16777249,33554465,33558561,50331681,37748769,33554977,33558561,4129,5153,16781345,2101281,2097185,18874401,2101281,5153,1057,2081,545,33554977,16777761,37748769,4194337]:
		effect_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [129,161,4257,673]:
		ritual_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [16777233,16781329]:
		normal_p_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [16777249,50331681,18874401,16781345,16777761]:
		effect_p_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [16777377]:
		ritual_p_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [524290,262146,131074,65538,130,2]:
		spell_cards_count -= 1
	if int(get_node(card_path+"/"+card).editor_description.split("\n")[4]) in [1048580,131076,4]:
		trap_cards_count -= 1

	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/normal/label").text = str(normal_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/effect/label").text = str(effect_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/ritual/label").text = str(ritual_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/fusion/label").text = str(fusion_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/synchro/label").text = str(synchro_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/xyz/label").text = str(xyz_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/link/label").text = str(link_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/normal_pendulum/label").text = str(normal_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/effect_pendulum/label").text = str(effect_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/ritual_pendulum/label").text = str(ritual_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/fusion_pendulum/label").text = str(fusion_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/synchro_pendulum/label").text = str(synchro_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/xyz_pendulum/label").text = str(xyz_p_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/spell/label").text = str(spell_cards_count)
	get_node("../main_HSplitContainer/HSplitContainer/VBoxContainer/cards_counter/HBoxContainer/trap/label").text = str(trap_cards_count)
	
	print("remove last ",last_main_deck_card)
