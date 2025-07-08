extends Control

var mouse_entered_here := false

# get "control" node inputs
# for detecting if the user pressed on the tablet
func _gui_input(event: InputEvent) -> void:
    if event is not InputEventMouseButton :
        return
        
    if event.pressed and not mouse_entered_here and not visible:
        # Make the mouse click ON the tablet not pass through
        get_viewport().set_input_as_handled()
