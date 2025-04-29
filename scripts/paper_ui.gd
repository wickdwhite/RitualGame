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
			LetterText.text = "Niyana,\n\nDo you remember the old garden behind the abbey, where \nthe violets bloom even in despairing soil? You pulled \none and tucked it behind my ear, and I have hated you \never since for it. Hated you—yes, let me call it \nthat—for what else can I do with a feeling that climbs \nthrough my ribs like ivy, green and grasping? \n\nI find myself collecting these moments like pressed \nflowers—dry, brittle, but still retaining some \nphantom of their color. I do not know what you \nmean to do with me, but I suspect you’ve already done it.\nMy heart is not mine anymore—it writhes like a thing \ncaught in nets of its own weaving. And every time you \nspeak, every foolish jest or idle glance, I curse \nmyself anew for the smile that creeps unbidden.\n\nI don’t know how to want gently. I only know how to \nwant like rot wants the root. And you—you smile \nlike you’ve never seen decay.\n\nYours, with more ruin than reason,\nE"
		3:
			LetterText.text = "Niyana,\n\nI think back to that night in the green house—you \nremember the one with the draft that howled like it \nhad teeth. The storm cracked open the sky, and we \nlit match after match just to chase the shadows around.\n\nI let the match burn too close to my fingers, \njust so you’d take it from me—knowing you would.\n\nYou didn’t say anything. You just reached out \nand plucked it from my hand, then held my wrist in \nthat awful, gentle way you do when you’re angry but \ntoo kind to show it. Your thumb moved in small, \nangry circles over my pulse.\n\nI think we both know what this is, but saying \nit aloud would shatter the glass.\n\nYours, more and more each day,\nE"
		4:
			LetterText.text = "Niyana,\n\nYou were winding the grandfather clock and insisted \nthe second hand was “a breath too slow.” I said it was \nfine. You said I didn’t listen. I said you liked pretending \nto know things you didn’t. You called me unkind. I called \nyou unbearable.\n\nWe didn’t speak for six hours.\n\nYou stayed in the garden. I stayed in the west parlor, \nstaring at the empty teacups and our half-finished \ncrossword.\n\nWhen you returned, you didn’t apologize. You just sat \nbeside me and placed my hand on your chest. Your \nheart was still there—thank God—and too fast, as it \nalways is when we’ve fought.\n\nWe both know I can be cruel. You—wounded, proud. \nBut I think we forgive too easily to stay bitter long.\n\nThe clock still ticks unevenly. And we have never \nfixed it. Perhaps it suits us.\n\nYours, even in our moments apart,\nE"
		5:
			LetterText.text = "Niyana,\n\nI have a little creature nestled upon my thigh—I’m \nsure you know who. Our first meeting, she came in \nthrough the library window, remember? Just appeared—\nhalf-shadow, half-soot, all arrogance. Sat on the sill like \nshe had every right to the place.\n\nWe tried to ignore her at first. Called her names like \nStranger and Interloper and That Black Demon. But the \nsecond time she got into bed with us and curled between \nour shoulders like a heartbeat, you whispered, \n“Well. I suppose she’s decided.”\n\nShe has your temper, I think. Sharp when overlooked, \nquick to sulk. But she always came back. Just like you do, \nafter every quarrel.\n\nShe’s scattered her unseemly fuzz all over your coat.\n I adore her. I adore the mess she makes of you. I adore you.\n\nYours, today and tomorrow too,\nE"
		6:
			LetterText.text = "Niyana,\n\nI am half-sick of shadows. I weave these stolen moments \nwith you among the threads of my bodice to keep close to \nmy chest—I assure you they’re everything to me. Yet \nsometimes I find that these threads suffocate me.  \n\nI do not blame you. The world is cruel to softness \nlike ours. But I can’t help but ache for more.\n\nI found the painting again—the one we mocked for \nits ghastly romanticism. Remember? A woman in funeral \nsilks, her mouth parted like she was sighing out \neternity. Later that night, I asked again—quietly—\nif you would do it. If we could. If we ought. A ritual \nunderwent only by the desperate and the damned. But \nyou looked to me with such pity and trepidation, I \nheld my tongue from all the rest I’d hoped to say.\n\nYours, for as much of eternity as I can grasp,\nE"
		_:
			LetterText.text = "else."
	
	visible = true

func _on_close_pressed():
	# Have to reassign with each new letter
	PickupArea = get_node("/root/Node2D/Letter pickup area")
	
	print(":here0")
	visible = false
	PickupArea.change_scene()




		
