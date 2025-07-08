extends Control

var mouse_entered_here := false


func _on_area_2d_mouse_entered() -> void:
    mouse_entered_here = true
    
#func _input(event: InputEvent) -> void:
    #if not event is InputEventMouseButton :
        #return
        #
    #if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and mouse_entered_here:
        #UIHandler.change_ui("Tablet")
