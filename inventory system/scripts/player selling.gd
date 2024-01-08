extends Control

var is_open = false
var state = false

@onready var inv: Inv = preload("res://inventory system/inventories/player.tres")
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


func close():
	visible = false
	is_open = false
	state = false
	get_tree().paused = false


func _on_npc_shop():
	open()
