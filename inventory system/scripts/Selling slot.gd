extends Panel

signal error(errorCode:int)

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item
@onready var Buy_price: Label = $CenterContainer/Panel/Label
@onready var Sell_price: Label = $CenterContainer/Panel/sell
var playerInventory
var buyPrice
var sellPrice
var itemType
var index
var inventory : Array

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		Buy_price.visible = false
		Sell_price.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		itemType = slot.item
		Buy_price.visible = true
		Sell_price.visible = true
		Buy_price.text = "B$"+str(slot.item.Buy_price)
		Sell_price.text = "B$"+str(slot.item.Sell_price)



func _on_button_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				buyPrice = self.get_node("CenterContainer").get_node("Panel").get_node("Label").text.right(self.get_node("CenterContainer").get_node("Panel").get_node("Label").text.length()-2)
				if(Global.playerCoins >= int(buyPrice)):
					Global.playerCoins -= int(buyPrice)
					Global.spawnItemDrop(itemType,get_tree().get_root(),Vector2(Global.posx,Global.posy),Vector2.ONE)
					error.emit(0)
				else:
					error.emit(-1)
			MOUSE_BUTTON_RIGHT:
				playerInventory = load("res://inventory system/inventories/player.tres")
				sellPrice = self.get_node("CenterContainer").get_node("Panel").get_node("sell").text.right(self.get_node("CenterContainer").get_node("Panel").get_node("sell").text.length()-2)
				inventory.clear()
				for slot in playerInventory.slots:
					inventory.append(slot.item)
				index = inventory.find(itemType)
				if playerInventory.slots[index].amount == 0:
					playerInventory.slots[index] = load("res://inventory system/Items/empty.tres")
					inventory[index] = load("res://inventory system/Items/empty.tres")
				inventory.clear()
				for slot in playerInventory.slots:
					inventory.append(slot.item)
				index = inventory.find(itemType)
				if index == -1:
					error.emit(1)
				else:
					playerInventory.slots[index].amount -= 1
					Global.playerCoins += int(sellPrice)
