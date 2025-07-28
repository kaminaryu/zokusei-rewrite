extends Control

func _input(event: InputEvent) -> void:
    if not event is InputEventMouseButton :
        return
        
    # if click on object and player in range
    if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed) :
        $Title/TitleMove.play("Move")
        $Label.visible = false
        $Menus.visible = true
        $Menus/AnimationPlayer.play("FadeIn")
