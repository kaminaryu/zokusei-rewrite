extends Node2D

var player_entered := false;
var mouse_entered  := false;
var toggle := true

func _process(delta: float) -> void: 
    pass#modulate.a = 0.5 if player_entered else 1
    
func _input(event: InputEvent) -> void:
    if not event is InputEventMouseButton :
        return
        
    if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
        UIHandler.change_ui("Tablet")
        


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
