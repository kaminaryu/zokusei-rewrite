extends Node

var ui_visibility = {}


# Called from the object element itself usually, e.g : boulder.gd
func change_ui(ui: String, show = null) -> void:
    if not ui_visibility.has(ui) :
        ui_visibility[ui] = false
    
    var current_ui = get_node("/root/MainNode/UI/" + ui)

    if show == null :
        ui_visibility[ui] = not ui_visibility[ui]
    else :
        ui_visibility[ui] = show
        
    current_ui.visible = ui_visibility[ui]

# for inputs that doesnt get detected (e.g: click on blank space)
# if the user click on somewhere random => closes the tablet
func _unhandled_input(event: InputEvent) -> void:
    if event is not InputEventMouseButton :
        return
    
    if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        ui_visibility["Tablet"] = false
        $"/root/MainNode/UI/Tablet".visible = false
        print("die")
    
