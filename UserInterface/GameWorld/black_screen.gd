extends Control


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
    if anim_name == "FadeIn" :
        MapHandler.shift_room()
        $AnimationPlayer.play("FadeOut")
    elif anim_name == "FadeOut" :
        MapHandler.disabled = false
        get_tree().root.get_node("/root/MainNode/Environment/Player").disabled = false
