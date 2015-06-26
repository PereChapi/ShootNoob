Strict

Import main
Import titlescreen
Import gameobjects

Class GameScreen Extends Screen
	Global instance:GameScreen = Null
	Field backgroundImage:GameImage
	Field player:Player
	
	Function GetInstance:GameScreen()
		If instance = Null
			instance = New GameScreen()
		End
		Return instance
	End

	Method New()
		name = "GameScreen"
	End
	
	Method Start:Void()
		' set the background image
		backgroundImage = diddyGame.images.Find("background")
		player = New Player(diddyGame.images.Find("ship"), SCREEN_WIDTH2, SCREEN_HEIGHT - 50)
		player.frame = 3
	End
	
	Method Update:Void()
		player.Update()
		Bullet.UpdateAll()
		
		If KeyHit(KEY_ESCAPE)
			FadeToScreen(TitleScreen.GetInstance())
		End
	End
	
	Method Render:Void()
		Cls
		backgroundImage.Draw(0, 0)
		Bullet.DrawAll()
		player.Draw()
	End	
End