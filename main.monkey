Strict

Import diddy
Import titlescreen

Function Main:Int()
	MyGame.GetInstance()
	Return True
End

Class MyGame Extends DiddyApp
	Global instance:MyGame = Null

	Method Create:Void()
		' set the virtual resolution
		SetScreenSize(800, 450, True) ' 16:9 ratio
		' load the resources
		LoadImages()
		LoadSounds()
		Start(TitleScreen.GetInstance())
	End
	
	Function GetInstance:MyGame()
		If instance = Null
			instance = New MyGame()
		End
		Return instance
	End

	Method LoadImages:Void()
		' load in an animation 64x64 with 7 frames
		images.LoadAnim("ship.png", 64, 64, 7)
		' load in a background image
		images.Load("background.png", "", false)
	End
	
	Method LoadSounds:Void()
		' load the sounds
		sounds.Load("boom3.ogg")
		sounds.Load("lazer.ogg")
	End

	
End