extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item
@onready var Buy_price: Label = $CenterContainer/Panel/Label

func update(slot: InvSlot):
	if !slot.item:
		item_visual.visible = false
		Buy_price.visible = false

	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		Buy_price.visible = true
		
		Buy_price.text = str(slot.amount)
