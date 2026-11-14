extends Node3D

@onready var label_3d_2: Label3D = $Label3D2
@onready var animation_player_2: AnimationPlayer = $AnimationPlayer2



var talking := false
var has_talked := false

var lines := [
	"NOPE",
	
]

func say_lines(speed := 0.04) -> void:
	talking = true
	label_3d_2.visible = true
	for line in lines:
		label_3d_2.text = ""
		for i in line.length():
			label_3d_2.text = line.substr(0, i + 1)
			await get_tree().create_timer(speed).timeout
		await get_tree().create_timer(2.0).timeout
	label_3d_2.visible = false
	talking = false
	has_talked = true

func _on_area_3d_body_entered(body: Node3D) -> void:
	animation_player_2.play("zombie_jump/jump")
	if body is CharacterBody3D and not talking and not has_talked:
		say_lines()
