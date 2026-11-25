extends PanelContainer


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
var duelEvents = {1:{dp= [["pl1",["draw","normal",["c10000c1"]]]]}} #nmw
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





##----------------player 1 "pl1" characteristics--------------------------------
##------------------------------------------------------------------------------
var players = {
	pl1 = {
		lifePoint = 8000,  # life point
		field = {m1={},m2={},m3={},m4={},m5={},mEx={mEx1={},mEx2={}},
				st1={},st2={},st3={},st4={},st5={},sf={},sp1={},sp2={}},
		deck = [],
		extraDeck = [],
		grave = [],
		removed = [],
		hand = [],
		cannotSummon = {normal = [],} },

	pl2 = {
		lifePoint = 8000,  # life point
		field = {m1={},m2={},m3={},m4={},m5={},mEx={mEx1={},mEx2={}},
				st1={},st2={},st3={},st4={},st5={},sf={},sp1={},sp2={}},
		deck = [],
		extraDeck = [],
		grave = [],
		removed = [],
		hand = [],
		cannotSummon = {normal = [],} }
		}
##------------------------------------------------------------------------------
##------------------------------------------------------------------------------


var fake_external_cards_deck = ["c10000"]

var duelCards = []

func _ready():
	print(the_card("c11111c3"))
	####for card in fake_external_cards_deck:
		####var cardScript = load("res://card_scripts/"+card+".gd").new()
#		cardScript.set("card" , cardScript.CardProps)
#		cardScript.set("players" , players)
#		cardScript.set("contr", cardScript.CardProps["contr"]
		####duelCards.append(cardScript.CardProps)

		####players["pl2"]["hand"].append(cardScript.CardProps)
		#print(players["pl2"]["hand"])
		#myMonsterZone[3] = cardScript.CardProps
		#duelCards.append(cp)
	#print(duelCards)
	
	####activable_effects(duelCards)
	
	pass 

func activable_effects(targList):
	var activable = [{}] # [ {c111=[0,1]} , {c222=[0]} ] 
	for card in targList:
		var expression = Expression.new()
		expression.parse(card["effect"][0][0],["card","players","contr","test"])
		var result = expression.execute([card,players,card["contr"],"test"],null,true )
		print("card ",result)




func the_card(card):
	var cardCopy = card[-1]
	card.erase(-1,1)
	var cardId = card
	return cardCopy



#		var script = GDScript.new()
#
#		script.set_source_code(card["effect"][0][0])
#		script.reload()

#		var players = players
#		var contr = targList[card]["contr"]
		#print("card ",Expression(card["effect"][0][0]))# players[contr]
		#pass
#		var 
	
