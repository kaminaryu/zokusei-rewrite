extends Node

# LETS GOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
# IT WORKS


var active_ui: String = ""
var activator: Node = null # the one who calls the ui to be active


# Called from the object element itself usually, e.g : boulder.gd
func change_ui(ui: String, caller: Node = null, show = null) -> void:
    var current_ui = get_node("/root/MainNode/UI/" + ui)

    # don't close the tablet ui if the caller isnt the one who activates the tablet ui
    if ui == "Tablet" and show == false and activator != caller :
        # unless the caller is this script itself (for closing via stray clicks)
        if caller != self :
            return
    
    if show == null :
        current_ui.visible = !current_ui.visible
        if current_ui.visible :
            active_ui = ui
            activator = caller
        else :
            active_ui = ""
            activator = null

    else :
        current_ui.visible = show
        if show :
            active_ui = ui
            activator = caller
        else :
            active_ui = ""
            activator = null


func _input(event: InputEvent) -> void:
    if not event.is_action_pressed("escape"):
        return
        
    if active_ui == "":
        get_tree().quit()
    else :
        change_ui(active_ui, self, false)
        
    
    
# for inputs that doesnt get detected (e.g: click on blank space)
# if the user click on somewhere random => closes the tablet
func _unhandled_input(event: InputEvent) -> void:
    if event is not InputEventMouseButton :
        return
    
    if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        change_ui("Tablet", self, false)
