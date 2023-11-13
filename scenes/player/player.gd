extends CharacterBody2D

const SPEED = 100.0
const ROTATION_SPEED = 8

func _physics_process(delta):
	# マウスの位置を取得
	var mouse_position = get_global_mouse_position()

	# プレーヤーの位置を取得
	var player_position = global_position

	# マウスの方向を計算
	var direction = (mouse_position - player_position).normalized()

	# プレーヤーの回転を設定
	rotation = lerp_angle(rotation, direction.angle() + PI/2, ROTATION_SPEED * delta)
	
	var direction_x = Input.get_axis("move_left_player", "move_right_player")
	
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	var direction_y = Input.get_axis("move_up_player", "move_down_player")

	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		print("Collision")

func _on_object_body_entered(body):
	print("Collision")
