extends Node2D

# Default attributes for all boulders, can change depends on 
# use-case using the editor for individual boulders
@export var attributes: Dictionary = {
    "Collision": true    
}

var player_entered := false;
var mouse_entered  := false;
var toggle := true

# set the attributes to the dev defined attributes
func _ready() -> void:
    for attr in attributes :
        Obama.change_attr(self, attr, false)
    
    
# this is a must have to update the attributes from outside
func update_attr(attr: String, new_value) :
    attributes[attr] = new_value
    
    
func _input(event: InputEvent) -> void:
    if not event is InputEventMouseButton :
        return
        
    # if click on object and player in range
    if (event.button_index == MOUSE_BUTTON_LEFT and event.pressed) and (mouse_entered and player_entered):
        UIHandler.change_ui("Tablet", self)
        Obama.activate_tablet(self)
        get_viewport().set_input_as_handled() # mark the input as handled (hint : ui-handler.gd; tablet.gd)


func _on_interact_range_body_entered(body: Node2D) -> void:
    if body.name != "Player" :
       return;
    
    player_entered = true;
    
func _on_interact_range_body_exited(body: Node2D) -> void:
    if body.name != "Player" :
       return;
    
    player_entered = false;
    UIHandler.change_ui("Tablet", self, false)


func _on_mouse_collider_mouse_entered() -> void:
    mouse_entered = true;
    Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND);

func _on_mouse_collider_mouse_exited() -> void:
    mouse_entered = false;
    Input.set_default_cursor_shape(Input.CURSOR_ARROW);
