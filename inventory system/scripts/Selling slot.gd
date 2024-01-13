extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item
@onready var Buy_price: Label = $CenterContainer/Panel/Label
@onready var Sell_price: Label = $CenterContainer/Panel/sell

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		Buy_price.visible = false
		Sell_price.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		Buy_price.visible = true
		Sell_price.visible = true
		Buy_price.text = "B$"+str(slot.item.Buy_price)
		Sell_price.text = "B$"+str(slot.item.Sell_price)



func _on_button_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				print("buy")
			MOUSE_BUTTON_RIGHT:
				print("sell")
