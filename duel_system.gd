extends PanelContainer

### comment key:
####nmw : needs more works : lv,rk
####pl is any player ex me

###emit signal from action to cards in group ,if card's effect run with that action, then card emit signal




var fake_external_cards_deck = ["c12345678"]


var autoMCardFieldLocs = ["m3","m4","m2","m5","m1"]

var currentTrurn = 1
var currentTurnOwner = "pl1"
var currentPhase = "mp1"

var pl1CurrentTurn = 1
var pl2CurrentTurn = 0

var duelHistory = []
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

#var duelField = {
#	my = {
#		m = {
#			m1 = "",
#			m2 = "",
#			m3 = [{id = "c11111c1",cardName = "test",attr = "light",lv = 5,# nmw
#				rk = null, atk = 1000,def =  1000
#				}],
#			m4 = "",
#			m5 = "",
#			mEx = ""
#		},
#		st = {
#			st1 = "",
#			st2 = "",
#			st3 = "",
#			st4 = "",
#			st5 = "",
#			stF = "",
#			stP1 = "",
#			stP2 = "",
#		},
#		g = ""
#	}
#}

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
var testPlayer = { # testPlayerProps
	#player = "pl1",
	lp = 8000,
	#canDraw = [true], ## needs more works (n.m.w)
	#canSummon = [true], ## nmw
	#canActiveEffects = {value = true, cardProps = []}
	#can = [{},{}],
	#cannot = [{},{}]
}


var testPlayer2 = { # testPlayerProps
	#player = "pl2",
	lp = 8000,}


#var players = [testPlayer,testPlayer2] # [testPlayer,"pl2"]
var players = {pl1 = testPlayer,pl2 = testPlayer2}

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

#var testCardEffect = { # e1
#	activation = "manual", # quiic ,auto
#	activator = ["pl1"],
#	phase = {pl1 = ["mp1","mp2"], pl2 = ["bp","dc"]},
#	turn = [], 
#	pl1PassedTurns = [],
#	pl2PassedTurns = [],
#	effect = {
#		conditions = {
#			case1 = {
#				activator = "pl1",
#				cardProps =[ 
#					{cardsRangeCount = range(1,5),id = "c11111",},
#					{cardsRangeCount = range(1,2),id = "c11111",}
#					],
#				cardPropsComparison = {same = [""],different = []},
#				playersProps = {
#					pl1 = {lp = 8000,},  # range(7000,9000)
#					pl2 = {lp = 8000,}}
#				,
#				playerPropsComparison = {same = ["attr"],different = ["atk"]}, # , equal = {}, notEqual = {}
#				cost = {
#					card = [
#						{cardProps = [],action = {action = "send", from = "hand", to = "grave"}},
#						{cardProps = [],action = {action = "show", from = "hand"}}
#					],
#					cardPropsComparison = {same = [""],different = [], inList = {}, notIn = {}},
#					player = [{playerProps = [],action = {action = "pay life points", value = 1000} }],
#					playerPropsComparison = {same = [""],different = []},
#				},
#				action = {
#					card = [
#						{cardProps = [],action = [{action = "calc atk", value = 500}, {action = "calc def", value = -500}]},
#						{cardProps = [],action = {action = "set lv", value = 5}}
#					],
#					player = [{playerProps = [],action = {action = "pay life points", value = 1000} }]
#
#				}
#			},
#			#case2 = {},
#		}
#	}
#}

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
#var testCard = {
#	id = "c11111",
#	cardName = "test",
#	cardCopy = 1,
#	attr = "light",
#	lv = 5,# nmw
#	rk = null, #nmw
#	atk = 1000,
#	def =  1000,
#	place = "m3",
#	controller = "pl1",
#	cardEffect = [testCardEffect]   #{e1 = testCardEffect}  #cardEffect = {e1 = {}, e2 = {}}
#	}

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------

#var duelCards = [testCard]
#
#var myMonsterZone = [{},{},testCard,{},{},{}]
var duelCards = []

var myMonsterZone = [{},{},{},{},{},{}]
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
#var testCardProp = {
#	id = "c11111c1",
#	cardName = "test",
#	attr = "light",
#	lv = 5,# nmw
#	rk = null, #nmw
#	atk = 1000,
#	def =  1000
#
#}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var cardScript = load("res://card_scripts/c12345678.gd").new()


# Called when the node enters the scene tree for the first time.
func _ready():
#	for card in fake_external_cards_deck:
#		var cardScript = load("res://card_scripts/"+card+".gd").new()
#		duelCards.append(cardScript.CardProps)
#		myMonsterZone[3] = cardScript.CardProps
#		#duelCards.append(cp)
#	print(duelCards)
	pass
	#var testCompCardProp = {id = "c11111", copy = 1}
#	print(testCompCardProp.keys() , testCard.keys())
#	testCard.erase("")
#	print(myMonsterZone[2]["cardEffect"][0]["effect"]["conditions"]["case1"]["cardProps"][0]["cardsRangeCount"])
#	check_activatable_cards(duelCards,myMonsterZone)
#	#print(playerProps["lifePoint"])
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func duel_statistics():
	pass

func check_activatable_cards(cardList, targetedCardList):
	var activatable_cards = []
	var cond = {
		activation = false,
		turn = false,
		phase = false,
		#cardsCount = false,
		cardPropsCond = false,
		playerPropsCond = false,
		costCond = false
	}

	for card in cardList:
		for e in card["cardEffect"]:
			for case in e["effect"]["conditions"]:
				var cardSuitability = []
				var propsSuitability = []
				var playerSuitability = []
				var propsSuitability2 = {}
				
				
				cond["cardPropsCond"] = check_card_props(e["effect"]["conditions"][case]["cardProps"],targetedCardList,propsSuitability,cardSuitability)
				cond["playerPropsCond"] = check_player_props(e["effect"]["conditions"][case]["playersProps"],propsSuitability2,playerSuitability)
#				print("function result is: ",cond["cardPropsCond"])
				#print(e["effect"]["conditions"][case]["cardProps"])
#				for prop in e["effect"]["conditions"][case]["cardProps"].size():
#					var tempCount = e["effect"]["conditions"][case]["cardProps"][prop]["cardsRangeCount"]
#					#print(e["effect"]["conditions"][case]["cardProps"][prop]["cardsRangeCount"])
#					e["effect"]["conditions"][case]["cardProps"][prop].erase("cardsRangeCount")
#					#print(e["effect"]["conditions"][case]["cardProps"][prop])
#					#var tempCont = 0
#					#print(targetedCardList.values())
#
##					var cardSuitability = []
#					for targetedCard in targetedCardList.size():
##						var propsSuitability = []
#						for cProp in e["effect"]["conditions"][case]["cardProps"][prop].keys():
#							if targetedCardList[targetedCard].keys().size() !=0 and e["effect"]["conditions"][case]["cardProps"][prop][cProp] == targetedCardList[targetedCard][cProp]:#cProp in targetedCardList[targetedCard].keys() and e["effect"]["conditions"][case]["cardProps"][prop][cProp] == targetedCardList[targetedCard][cProp]:
##								print("yesssss")
#								propsSuitability.append(true)
#							elif targetedCardList[targetedCard].keys().size() == 0:
#								#print("there is no cards")
#								pass
#							elif targetedCardList[targetedCard].keys().size() !=0 and e["effect"]["conditions"][case]["cardProps"][prop][cProp] != targetedCardList[targetedCard][cProp]:#cProp in targetedCardList[targetedCard].keys() and e["effect"]["conditions"][case]["cardProps"][prop][cProp] != targetedCardList[targetedCard][cProp]:
##								print("nooooooo")
#								propsSuitability.append(false)
#						if (propsSuitability.has(false) != true) and (targetedCardList[targetedCard].size()!=0) and (cardSuitability.has(targetedCardList[targetedCard]["id"]+"c"+str(targetedCardList[targetedCard]["cardCopy"])) != true):
#							#print(targetedCardList[targetedCard]["id"])
#							cardSuitability.append(targetedCardList[targetedCard]["id"]+"c"+str(targetedCardList[targetedCard]["cardCopy"]))
#						elif propsSuitability.has(false) == true:
#							cardSuitability = []
#							#break
#							#print(cardSuitability)
#							#print (targetedCardList[targetedCard]["id"]+"c"+str(targetedCardList[targetedCard]["cardCopy"]), " card added")
#						if cardSuitability.size() in tempCount:
#							cond["cardPropsCond"] = true

#				for prop2 in e["effect"]["conditions"][case]["playersProps"].keys():
##					var playerSuitability = []
#					for targetedPlayer in players:
##						var propsSuitability2 = []
#						for pl in  e["effect"]["conditions"][case]["playersProps"][prop2]:#.keys():
#
#							if (players[targetedPlayer].keys().size() != 0) and (e["effect"]["conditions"][case]["playersProps"][prop2][pl] == players[prop2][pl]) and (propsSuitability2.keys().has(prop2) != true):#pl in players[targetedPlayer].keys():# and e["effect"]["conditions"][case]["playersProps"][prop2][pl] == players[targetedPlayer][pl]:
#								#print(e["effect"]["conditions"][case]["playersProps"][prop2][pl],"a", players[targetedPlayer][pl])
#								propsSuitability2[prop2] = true
#							elif players[targetedPlayer].keys().size() == 0:
#								pass
#							elif (players[targetedPlayer].size() !=0) and (e["effect"]["conditions"][case]["playersProps"][prop2][pl] != players[prop2][pl]) and (propsSuitability2.keys().has(prop2) != true):#pl in players[targetedPlayer].keys() and e["effect"]["conditions"][case]["playersProps"][prop2][pl] != players[targetedPlayer][pl]:
#								propsSuitability2[prop2] = false
#
#							if (propsSuitability2.values().has(false) != true) and (players[targetedPlayer].size()!=0) and (playerSuitability.has(prop2) != true):
#								playerSuitability.append(prop2)
#								cond["playerPropsCond"] = true
#							elif propsSuitability2.values().has(false) == true:
#								playerSuitability = []
#								cond["playerPropsCond"] = false
								#break


#				print("cardSuitability",cardSuitability)
#				print("playerSuitability",playerSuitability)
#				print("propsSuitability", propsSuitability)
#				print("propsSuitability2", propsSuitability2)

	
	print(" player condition is ",cond["playerPropsCond"], " !!!!!!!")
	print(" card condition is ",cond["cardPropsCond"], " !!!!!!!")
	
#				var tempCont = e["effect"]["conditions"][case]["cardProps"]["cardsRangeCount"]
#				var tempResultCount = 0
#				e["effect"]["conditions"][case]["cardProps"].remove("cardsRangeCount")
#				if e["effect"]["conditions"][case]["cardProps"] in targetedCardList:
#					print("card exists")
				





#	for card in cardList:
#		for e in card["cardEffect"]:
#			for case in e["conditions"]:
#				for cardProps in case["cardProps"]:
#					for cardPropKey in cardProps.keys():
#						if cardPropKey != "cardsRangeCount":
#							if card[e][case][cardProps][]
#			#cond["activation"] = players[e["conditions"]["cas2"]]
#			pass
#		#cond["activation"] = 
		

func effect_apply():
	pass


func check_card_props(cardPropList,targetedCardList,propsSuitability,cardSuitability):
	for prop in cardPropList.size():
		var tempCount = cardPropList[prop]["cardsRangeCount"]
		cardPropList[prop].erase("cardsRangeCount")
		for targetedCard in targetedCardList.size():
			for cProp in cardPropList[prop].keys():
				if targetedCardList[targetedCard].keys().size() !=0 and cardPropList[prop][cProp] == targetedCardList[targetedCard][cProp]:#cProp in targetedCardList[targetedCard].keys() and cardPropList[prop][cProp] == targetedCardList[targetedCard][cProp]:
					propsSuitability.append(true)
				elif targetedCardList[targetedCard].keys().size() == 0:
					pass
				elif targetedCardList[targetedCard].keys().size() !=0 and cardPropList[prop][cProp] != targetedCardList[targetedCard][cProp]:#cProp in targetedCardList[targetedCard].keys() and cardPropList[prop][cProp] != targetedCardList[targetedCard][cProp]:
					propsSuitability.append(false)
				if (propsSuitability.has(false) != true) and (targetedCardList[targetedCard].size()!=0) and (cardSuitability.has(targetedCardList[targetedCard]["id"]+"c"+str(targetedCardList[targetedCard]["cardCopy"])) != true):
					cardSuitability.append(targetedCardList[targetedCard]["id"]+"c"+str(targetedCardList[targetedCard]["cardCopy"]))
				elif propsSuitability.has(false) == true:
					cardSuitability = []
				if cardSuitability.size() in tempCount:
					return true
				else:
					return false
					#cond["cardPropsCond"] = true

func check_player_props(playerPropList,propsSuitability2,playerSuitability):
	for prop2 in playerPropList.keys():
		for targetedPlayer in players:
			for pl in  playerPropList[prop2]:#.keys():
				if (players[targetedPlayer].keys().size() != 0) and (playerPropList[prop2][pl] == players[prop2][pl]) and (propsSuitability2.keys().has(prop2) != true):#pl in players[targetedPlayer].keys():# and playerPropList[prop2][pl] == players[targetedPlayer][pl]:
					propsSuitability2[prop2] = true
				elif players[targetedPlayer].keys().size() == 0:
					pass
				elif (players[targetedPlayer].size() !=0) and (playerPropList[prop2][pl] != players[prop2][pl]) and (propsSuitability2.keys().has(prop2) != true):#pl in players[targetedPlayer].keys() and playerPropList[prop2][pl] != players[targetedPlayer][pl]:
					propsSuitability2[prop2] = false
				if (propsSuitability2.values().has(false) != true) and (players[targetedPlayer].size()!=0) and (playerSuitability.has(prop2) != true):
					playerSuitability.append(prop2)
					return true
					#cond["playerPropsCond"] = true
				elif propsSuitability2.values().has(false) == true:
						playerSuitability = []
						return false
				#return playerSuitability
						#playerSuitability = []
						#cond["playerPropsCond"] = false

func calc_cardProp_list(cardProp,targetedCardList): # attr,type,atk,lv,card type
	var listedCardProp = []
	for card in targetedCardList:
		listedCardProp.append(targetedCardList[card][cardProp])
	return listedCardProp
	print(listedCardProp)

func calc_cardProp_toltal_value(listedCardProp):
	var totalValue = 0
	for value in listedCardProp:
		totalValue += value
	return totalValue
	print(totalValue)


