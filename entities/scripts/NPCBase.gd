extends CharacterBody2D

#Char customization
@onready var bodysprite = $sprite/Body
@onready var clothessprite = $sprite/Clothes
@onready var eyessprite = $sprite/Eyes
@onready var hairsprite = $sprite/Hair
@onready var accsprite = $sprite/Acc
const sprites = preload("res://entities/art/art.gd")
#----------------------------------------------------------------


func _ready():
	hairChange()
	bodyChange()
	eyeChange()
	clothesChange()
	accChange()
