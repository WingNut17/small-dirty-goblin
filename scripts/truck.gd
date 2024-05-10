extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var blood_mist = $BloodMist
@onready var blood_sprites = $BloodMist/BloodSprites
@onready var blood_chunk = $BloodMist/BloodChunk
@onready var bone_chunk = $BloodMist/BoneChunk

func _ready():
	blood_mist.hide()

func _on_area_2d_body_entered(_body):
	player.get_node("AnimatedSprite2D").hide()

	blood_mist.show()
	blood_mist.emitting = true
	blood_sprites.emitting = true
	blood_chunk.emitting = true
	bone_chunk.emitting = true
	
	player.health = 0

