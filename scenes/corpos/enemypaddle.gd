extends RigidBody2D

@export var paddle_Speed = 5500
@onready var ball

func _ready():
	ball = get_tree().get_first_node_in_group("ball")

func _physics_process(delta):
	var direction = (ball.position - position).normalized()
	linear_velocity.y = direction.y * paddle_Speed * delta
	
