extends CharacterBody2D

# Variável de velocidade
@export var speed = 80
# Força do pulo
@export var jump = 200
# Gravidade
@export var gravity = 300 


@export var sprite: AnimatedSprite2D
# @onready var sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
## É chamada sempre que o NODE/NÓ entra na cena (quando é carregado)
func _ready() -> void:
	print("Iniciando!")

## Ele chamado a cada frame
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("left", "right")
	
	velocity.x = direction * speed
	##             -1 / 0 / 1  *  80  * delta
	
	if direction == 0:
		sprite.animation = "idle"
	else:
		sprite.animation = "walk"
	
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = - jump
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
## Process é ideal pra detecções imediatadas, ou interface
func _process(_delta: float) -> void:
	pass

## É chamada quando o sinal da Hitbox de "Corpo Entrou" é disparado
func _on_hitbox_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
