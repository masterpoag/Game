extends Control

var is_open = false
var state = false

@onready var inv: Inv = preload("res://inventory system/inventories/player.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()



func _ready():
	#inv.update.collect(update_slots) TODO Koris i need your help figuring this out is super late ;-;
	update_slots()
	close()

func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i])
	
func _process(delta):
	if Input.is_action_just_pressed("Inventory"):
		if is_open:
			close()
		else:
			open()

func open():
	visible = true
	is_open = true
	pause()


func close():
	visible = false
	is_open = false
	state = false
	get_tree().paused = false

func pause():
	state = not get_tree().paused
	get_tree().paused = state
