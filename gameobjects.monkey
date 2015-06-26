Strict

Import diddy

Class Player Extends Sprite
	Field score:Int = 0
	Field lazerSnd:GameSound
	
	Method New(img:GameImage, x:Float, y:Float)
		Self.image = img
		Self.x = x
		Self.y = y
		Self.alpha = 1
		Self.SetHitBox(-img.image.HandleX(), -img.image.HandleY(), img.w, img.h)
		Self.visible = True
		Self.speedX = 8
		Self.lazerSnd = diddyGame.sounds.Find("lazer")
	End
	
	Method Update:Void()
		' controls
		If KeyDown(KEY_LEFT)
			Self.x -= Self.speedX * dt.delta
		End
		If KeyDown(KEY_RIGHT)
			Self.x += Self.speedX * dt.delta
		End
		If KeyHit(KEY_SPACE)
			Self.lazerSnd.Play()
			New Bullet(x, y)
		End
		
		' boundary check
		If Self.x < Self.image.w2 Then Self.x = Self.image.w2
		If Self.x > SCREEN_WIDTH - Self.image.w2 Then Self.x = SCREEN_WIDTH - Self.image.w2
	End
End

Class Bullet Extends Sprite
	Global list:List<Bullet> = New List<Bullet>
	
	Field w:Int
	Field h:Int
	
	Method New(x:Float, y:Float)
		Self.x = x
		Self.y = y
		Self.w = 10
		Self.h = 10
		Self.alpha = 1
		Self.SetHitBox(-w, -h, w, h)
		Self.speedY = 10
		list.AddLast(Self)
	End
	
	Method Draw:Void()
		DrawOval(x - w / 2, y - h / 2, w, h)
	End
	
	Method Update:Void()
		y -= speedY * dt.delta
		If y < - h
			Kill()
		End
	End
	
	Method Kill:Void()
		list.Remove(Self)
	End
	
	Function DrawAll:Void()
		For Local b:Bullet = EachIn list
			b.Draw()
		End
	End

	Function UpdateAll:Void()
		For Local b:Bullet = EachIn list
			b.Update()
		End
	End
		
End