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

var posx
var posy

var EXPToAdd = 0

var load = load("res://prefabs/damage_indicator.tscn")
var damage
var pos

func showDamage(tree,damage,pos):
	self.damage = damage
	self.pos = pos
	var Instance = load.instantiate()
	
