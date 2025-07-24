extends CharacterBody2D

var disabled = false
@export var speed := 300;

func _process(delta: float) -> void: 
    if disabled :
        return
        
    velocity = Vector2(0, 0);
    
    if Input.is_action_pressed("move-up") :
        velocity += Vector2(0, -1);
    if Input.is_action_pressed("move-right") :
        velocity += Vector2(1, 0);
    if Input.is_action_pressed("move-left") :
        velocity += Vector2(-1, 0);
    if Input.is_action_pressed("move-down") :
        velocity += Vector2(0, 1);    
    
    if velocity.length() > 0 :
        velocity = velocity.normalized() * speed;
        
    move_and_slide();
