extends Node2D

var player_entered := false;
var mouse_entered  := false;

func _on_interact_range_body_entered(body: Node2D) -> void:
    if body.name != "Player" :
       return;
    
    player_entered = true;
    

func _on_interact_range_body_exited(body: Node2D) -> void:
    if body.name != "Player" :
       return;
    
    player_entered = false;

func _process(delta: float) -> void: 
    modulate.a = 0.5 if player_entered else 1;
