extends Control

var is_open = false
var state = false

@onready var inv: Inv = preload("res://inventory system/inventories/Shop.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

func _ready():
	inv.update.connect(update_slots)
	update_slots()
	open()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
	
func open():
	$"error message".text = ""
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

func error(errorCode:int):
	match errorCode:
		-1:
			$"error message".text = "Cannot afford"
		0:
			$"error message".text = ""
		1:
			$"error message".text = "You dont own this item"


func _on_slot_error(errorCode):
	error(errorCode)



func _on_slot_2_error(errorCode):
	error(errorCode)


func _on_slot_3_error(errorCode):
	error(errorCode)


func _on_slot_4_error(errorCode):
	error(errorCode)


func _on_slot_5_error(errorCode):
	error(errorCode)


func _on_slot_6_error(errorCode):
	error(errorCode)


func _on_slot_7_error(errorCode):
	error(errorCode)


func _on_slot_8_error(errorCode):
	error(errorCode)


func _on_slot_9_error(errorCode):
	error(errorCode)


func _on_slot_10_error(errorCode):
	error(errorCode)


func _on_slot_11_error(errorCode):
	error(errorCode)


func _on_slot_12_error(errorCode):
	error(errorCode)
