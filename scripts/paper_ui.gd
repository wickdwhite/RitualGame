extends CanvasLayer

@onready var LetterText = $ScrollContainer/Label
@onready var CloseButton = $CloseButton
@onready var PickupArea = get_node("/root/Node2D/Letter pickup area")


func _ready():
	visible = false
	CloseButton.pressed.connect(_on_close_pressed)

func show_letter():
	match Global.letters_collected:
		1:
			LetterText.text = "Niyana,\n\nI confess I’ve never been much of a scribe like Alev, or \na lyrist like you. I’ve certainly never been a poet. \nThough I find I should like to be one today to express \nthe thralldom of my rent heart.\n\nDo you recall that dusken hour in the west library? \nI had barely begun to know you, yet I confessed my \nfears to you entirely unbidden—that my life would \nvanish like breath on glass: quick, warm, then gone. \nYou then turned the writing of some greek poet that \nhad captured your rapt attention for the better part \nof two hours to me and motioned towards a line:\nEven in an age unlike our own,\nSomeone will remember who we are\n\nI cannot say I believed it then… but the manner in \nwhich your visage brightened and split into a \nhoney-sweet grin simply at the prospect of \nraising my spirits—well, I haven’t had much room \nin my head for such fears since.\n\nYou alone have haunted me each day since. I saw \nyou again in memory this morning—you had that \nsame errant curl falling against your brow—\nperpetually defiant, just like you. My quill scratches \nas though it were a beast restless in its stall, longing \nto speak what I dare not say aloud, for the walls are \nthinner than silence and my heart a poor vault indeed. \nThat day, you looked to me of the Evening star; fairest \nof the stars, I’m told. A sighting of Venus herself.\n\nI am not made for this sort of feeling, Ni. It scrapes the \ninside of my chest, leaving me raw and ruinous. But if \nruin comes wearing your voice, I suppose I shall meet \nit with open arms.\n\nYours, more than I ever intended to be,\nE"
		2:
			LetterText.text = "2."
		3:
			LetterText.text = "3."
		4:
			LetterText.text = "4."
		5:
			LetterText.text = "5."
		6:
			LetterText.text = "6."
		_:
			LetterText.text = "else."
	
	visible = true

func _on_close_pressed():
	visible = false
	PickupArea.change_scene()




		
