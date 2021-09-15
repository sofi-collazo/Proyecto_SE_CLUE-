extends Node
export (PackedScene) var scn_video

func _ready():
	pass # Replace with function body.
func _on_VideoPlayer_finished():
	get_tree().change_scene_to(scn_video)
