extends Spatial

onready var OWO = $Feature_OWO;

var num_sensations := 0;
var num_muscles := 0;
var selected_sensation := 0;
var selected_muscle := 0;

func _ready():
	OWO.connect_to_owo_server("127.0.0.1")
	num_sensations = OWO.get_num_sensations();
	num_muscles = OWO.get_num_muscles();
	_update_info();
	
func _update_info():
	#var i = $InfoLabel;
	#i.text = "Selected Muscle = " + OWO.get_muscle_name(selected_muscle) + " (" +str(selected_muscle) + ")\n";
	#i.text += "Selected Sensation = "  + OWO.get_sensation_name(selected_sensation) + " (" +str(selected_sensation) + ")\n";
	
	var l = $SensationsLabel;
	l.text = "Sensations:\n";
	for k in range(0, num_sensations):
		if k == selected_sensation: l.text += "> ";
		l.text += "  " + OWO.get_sensation_name(k) + " = "+ str(OWO.Sensations.values()[k]) + "\n";
		
	l = $MusclesLabel;
	l.text = "Muscles:\n";
	for k in range(0, num_muscles):
		if k == selected_muscle: l.text += "> ";
		l.text += "  " + OWO.get_muscle_name(k) + " = "+ str(OWO.Muscles.values()[k]) + "\n";

	
	
func _process(dt):
	if (Input.is_action_just_pressed("ui_accept")): 
		OWO.send_sensation(OWO.Sensations.values()[selected_sensation], OWO.Muscles.values()[selected_muscle]);
	
	if (Input.is_action_just_pressed("ui_left")):
		selected_muscle = (selected_muscle - 1 + num_muscles) % num_muscles;
		_update_info();
	if (Input.is_action_just_pressed("ui_right")):
		selected_muscle = (selected_muscle + 1) % num_muscles;
		_update_info();

	if (Input.is_action_just_pressed("ui_up")):
		selected_sensation = (selected_sensation - 1 + num_sensations) % num_sensations;
		_update_info();
	if (Input.is_action_just_pressed("ui_down")):
		selected_sensation = (selected_sensation + 1) % num_sensations;
		_update_info();
