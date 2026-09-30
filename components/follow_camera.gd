extends Node3D

@export var target: Node3D
@export var offset: Vector3 = Vector3(0, 6, 7)
@export var followSpeed: float = 5.0
@export var lookAtTarget: bool = true


func _ready() -> void:
	if target == null:
		push_warning("FollowCamera: no target assigned. Drag the Player node into the 'target' export slot.")


func _process(delta: float) -> void:
	if target == null:
		return

	var desiredPosition: Vector3 = target.global_position + offset
	global_position = global_position.lerp(desiredPosition, 1.0 - exp(-followSpeed * delta))

	if lookAtTarget:
		look_at(target.global_position, Vector3.UP)
