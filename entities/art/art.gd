extends Node

const body_spritesheet = {
	0: preload("res://entities/art/characters/char1.png"),
	1: preload("res://entities/art/characters/char2.png"),
	2: preload("res://entities/art/characters/char3.png"),
	3: preload("res://entities/art/characters/char4.png"),
	4: preload("res://entities/art/characters/char5.png"),
	5: preload("res://entities/art/characters/char6.png"),
	6: preload("res://entities/art/characters/char7.png"),
	7: preload("res://entities/art/characters/char8.png")
}
const clothes_spritesheet = {
	0:preload("res://entities/art/clothes/basic.png"),
	1:preload("res://entities/art/clothes/clown.png"),
	2:preload("res://entities/art/clothes/dress .png"),
	3:preload("res://entities/art/clothes/floral.png"),
	4:preload("res://entities/art/clothes/overalls.png"),
	5:preload("res://entities/art/clothes/pants.png"),
	6:preload("res://entities/art/clothes/pants_suit.png"),
	7:preload("res://entities/art/clothes/pumpkin.png"), 
	8:preload("res://entities/art/clothes/sailor.png"),
	9:preload("res://entities/art/clothes/sailor_bow.png"),
	10:preload("res://entities/art/clothes/shoes.png"), 
	11:preload("res://entities/art/clothes/skirt.png"), 
	12:preload("res://entities/art/clothes/skull.png"), 
	13:preload("res://entities/art/clothes/spaghetti.png"), 
	14:preload("res://entities/art/clothes/spooky .png"), 
	15:preload("res://entities/art/clothes/sporty.png"), 
	16:preload("res://entities/art/clothes/stripe.png"), 
	17:preload("res://entities/art/clothes/suit.png"), 
	18:preload("res://entities/art/clothes/witch.png")
}
const eyes_spritesheet = {
	0:preload("res://entities/art/eyes/blush_all.png"),
	1:preload("res://entities/art/eyes/eyes.png"),
	2:preload("res://entities/art/eyes/lipstick .png")
}
const hair = {
	0:preload("res://entities/art/hair/bob .png"),
	1:preload("res://entities/art/hair/braids.png"),
	2:preload("res://entities/art/hair/buzzcut.png"), 
	3:preload("res://entities/art/hair/curly.png"), 
	4:preload("res://entities/art/hair/emo.png"), 
	5:preload("res://entities/art/hair/extra_long.png"), 
	6:preload("res://entities/art/hair/extra_long_skirt.png"), 
	7:preload("res://entities/art/hair/french_curl.png"), 
	8:preload("res://entities/art/hair/gentleman.png"), 
	9:preload("res://entities/art/hair/long_straight .png"), 
	10:preload("res://entities/art/hair/long_straight_skirt.png"), 
	11:preload("res://entities/art/hair/midiwave.png"), 
	12:preload("res://entities/art/hair/ponytail .png"),
	13:preload("res://entities/art/hair/spacebuns.png"),
	14:preload("res://entities/art/hair/wavy.png")
}
const acc_spritesheet = {
	0:preload("res://entities/art/acc/beard.png"), 
	1:preload("res://entities/art/acc/earring_emerald.png"), 
	2:preload("res://entities/art/acc/earring_emerald_silver.png"), 
	3:preload("res://entities/art/acc/earring_red.png"), 
	4:preload("res://entities/art/acc/earring_red_silver.png"), 
	5:preload("res://entities/art/acc/glasses.png"), 
	6:preload("res://entities/art/acc/glasses_sun.png"), 
	7:preload("res://entities/art/acc/hat_cowboy.png"), 
	8:preload("res://entities/art/acc/hat_lucky.png"), 
	9:preload("res://entities/art/acc/hat_pumpkin.png"), 
	10:preload("res://entities/art/acc/hat_pumpkin_purple.png"), 
	11:preload("res://entities/art/acc/hat_witch.png"), 
	12:preload("res://entities/art/acc/mask_clown_blue.png"), 
	13:preload("res://entities/art/acc/mask_clown_red.png"), 
	14:preload("res://entities/art/acc/mask_spooky.png")
}
const acc_Hframes = {
	0: 112,
	1: 8,
	2: 8,
	3: 8,
	4: 8,	
	5: 80,
	6: 80,
	7: 8,
	8: 8,
	9: 8,
	10: 8,
	11: 8,
	12: 8,
	13: 8,
	14: 8
}
const clothes_Hframes = {
	0: 80,
	1: 8*2,
	2: 80,
	3: 80,
	4: 80,
	5: 80,
	6: 80,
	7: 8*2,
	8: 80,
	9: 80,
	10: 80,
	11: 80,
	12: 80,
	13: 80,
	14: 8,
	15: 80,
	16: 80,
	17: 80,
	18: 8
}
const eye_Hframes = {
	0: 8*5,
	1: 112,
	2: 8*5
}
