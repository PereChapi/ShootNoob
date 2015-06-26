Strict
Import main
Import gamescreen

Class TitleScreen Extends Screen
	Global instance:TitleScreen = Null
	
	Function GetInstance:TitleScreen()
		If instance = Null
			instance = New TitleScreen()
		End
		Return instance
	End
	
	Method New()
		name = "TitleScreen"
	End
	
	Method Start:Void()
		
	End
	
	Method Update:Void()
		If KeyHit(KEY_SPACE)
			FadeToScreen(GameScreen.GetInstance())
		End
	End
	
	Method Render:Void()
		Cls
		DrawText("Diddy Shoot'em Up!", SCREEN_WIDTH2, SCREEN_HEIGHT2, 0.5, 0.5)
		DrawText("Press Space to Play!", SCREEN_WIDTH2, SCREEN_HEIGHT2 + 50, 0.5, 0.5)
	End
		
End