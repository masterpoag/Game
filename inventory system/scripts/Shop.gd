extends Control

var is_open = false
var state = false

@onready var inv: Inv = preload("res://inventory system/inventories/Shop.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()



func _ready():
	inv.update.connect(update_slots)
	update_slots()
	close()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
	
func open():
	update_slots()
	visible = true
	is_open = true
	pause()


func close():
	visible = false
	is_open = false
	state = false
	get_tree().paused = false

func pause():
	pass
	#state = not get_tree().paused
	#get_tree().paused = state


func _on_npc_shop():
	if is_open:
		close()
	else:
		open()