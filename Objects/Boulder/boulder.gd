extends Node2D

# Default attributes for all boulders, can change depends on 
# use-case using the editor for individual boulders
@export var attributes: Dictionary = {
    "Collision": true    
}

var player_entered := false;
var mouse_entered  := false;
var toggle := true

    
func _input(event: InputEvent) -> void:
    if not event is InputEventMouseButton :
        return
        
    if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and mouse_entered:
        UIHandler.change_ui("Tablet")
        Obama.display_attribute(self)
        get_viewport().set_input_as_handled() # mark the input as handled (hint : ui-handler.gd; tablet.gd)


func _on_interact_range_body_entered(body: Node2D) -> void:
    if body.name != "Player" :
       return;
    
    player_entered = true;
    
func _on_interact_range_body_exited(body: Node2D) -> void:
    if body.name != "Player" :
       return;
    
    player_entered = false;


func _on_mouse_collider_mouse_entered() -> void:
    mouse_entered = true;
    Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND);

func _on_mouse_collider_mouse_exited() -> void:
    mouse_entered = false;
    Input.set_default_cursor_shape(Input.CURSOR_ARROW);
