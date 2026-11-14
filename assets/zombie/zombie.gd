extends Node3D

@onready var label_3d: Label3D = $Label3D


var talking := false
var has_talked := false

var lines := [
	"Hello there!",
	"This is my first game, so I'll give you an easy mission.",
	"Find the mage skeleton somewhere in this level to win.",
	"Feel free to look around the whole level.\nPress Ctrl to free fly!"
]

func say_lines(speed := 0.04) -> void:
	talking = true
	label_3d.visible = true
	for line in lines:
		label_3d.text = ""
		for i in line.length():
			label_3d.text = line.substr(0, i + 1)
			await get_tree().create_timer(speed).timeout
		await get_tree().create_timer(2.0).timeout
	label_3d.visible = false
	talking = false
	has_talked = true

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D and not talking and not has_talked:
		say_lines()
