extends Node2D
@export var instanceNum : int = 1
@export var MaxSpeed : int = 2
@export var UIElements : Array[Sprite2D] = []
@export_category("Background")
@export_range(0,1) var CloudSpeed : float = 0.25
@export_range(0,1) var HillSpeed : float = 0.2
@export_category("Trees")
@export_range(0,1) var TreeGrassSpeed : float = 0.3
@export_range(0,1) var BGTreesSpeed : float = 0.3
@export_range(0,1) var FGTreesSpeed : float = 0.5
@export_category("Grass")
@export_range(0,1) var BGGrassSpeed : float = 0.5
@export_range(0,1) var YellowGrassSpeed : float = 0.5
@export_range(0,1) var MidGrassSpeed : float = 0.70
@export_range(0,1) var FGGrassSpeed : float = 0.75
@export_category("Foreground")
@export_range(0,1) var RoadSpeed : float = 1

var speedList: Array[float] = [
	CloudSpeed,HillSpeed,
	TreeGrassSpeed,BGTreesSpeed,FGTreesSpeed,
	YellowGrassSpeed,BGGrassSpeed,MidGrassSpeed,FGGrassSpeed,
	RoadSpeed]
	
var screenWidth : int = 640
var screenHeight : int = 360 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func canTeleportToBeginning(pos):
	return pos <= - (screenWidth * 0.5)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(0,len(UIElements)):
		var currentMovingElement : Sprite2D = UIElements[i]
		var speedToMove : float = speedList[i] * MaxSpeed
		
		if canTeleportToBeginning(currentMovingElement.position.x):
			currentMovingElement.position = Vector2((screenWidth * 0.5) ,180)
						
		currentMovingElement.position -= Vector2(speedToMove,0)
