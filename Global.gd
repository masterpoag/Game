extends Node

var playerAttacting = false

var firstvisit = true

var body = 1
var clothes = 1
var acc = 1
var hair = 1
var eyes = 1

var body_mod = Color(1, 1, 1, 1)
var clothes_mod = Color(1, 1, 1, 1)
var acc_mod = Color(1, 1, 1, 1)
var hair_mod = Color(1, 1, 1, 1)
var eyes_mod = Color(1, 1, 1, 1)

var posx = 0
var posy = 0

var EXPToAdd = 0

var damage
var pos

var indicator = preload("res://prefabs/damage_indicator.tscn")

func showDamage(root,damage,pos):
	var Instance = indicator.instantiate()
	Instance.damage = damage
	Instance.global_position = pos
	root.add_child(Instance)


var itemDropped = preload("res://prefabs/Item resources/dropped_item.tscn")

func spawnItemDrop(itemType,root,pos,scale):
	var Instance = itemDropped.instantiate()
	Instance.global_position = pos
	Instance.size = scale
	Instance.item = itemType
	root.add_child(Instance)
