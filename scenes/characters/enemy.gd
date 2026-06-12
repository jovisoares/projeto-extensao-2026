extends CharacterBody2D

@export var speed = 6
@export var sprite: AnimatedSprite2D

var direction = -1


func _physics_process(delta: float) -> void:
	velocity.x = direction * speed 
	move_and_slide()


## Quando área da ESQUERDA detecta um CORPO do Mundo:
# Mudar a DIRECTION para positivo
func _on_area_left_body_entered(body: Node2D) -> void:
	print("Bateu na parede da esquerda")
	
	direction = 1
	
	# Gira o sprite
	sprite.flip_h = true

## Quando área da DIREITA detecta um CORPO do Mundo:
# Mudar a DIRECTION para negativo
func _on_area_right_body_entered(body: Node2D) -> void:
	print("Bateu na parede da direita")
	
	direction = - 1
	
	# Gira o sprite
	sprite.flip_h = false
	
