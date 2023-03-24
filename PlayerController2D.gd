extends CharacterBody2D

@export var speed = 2000
@export var Bullet: PackedScene

func _physics_process(delta):
	velocity = transform.x * Input.get_axis("Move left", "Move right") * speed * delta
	move_and_slide()
func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		shoot()
func shoot():
	if (GlobalVars.bullet_count == 1):
		var b = Bullet.instantiate()
		owner.add_child(b)
		b.global_transform = $Marker2D.global_transform
	GlobalVars.bullet_count -= 1
