-- Second reception scene 

ReceptionScene2 = gideros.class(Sprite)

-- Initializer
function ReceptionScene2:init(t)
	self:addChild(Bitmap.new(Texture.new("Image/Reception.png")))
		
	doctorSpriteAnimation:setScale(1.5)
	doctorSpriteAnimation:setPosition(-900, -400)
	doctorSpriteAnimation:setVisible(false)
	self:addChild(doctorSpriteAnimation)
	
	self:addChild(textBackground)
	textBackground:setVisible(false)
	self:addChild(text)
	
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

function ReceptionScene2:onTransitionInBegin()
end

-- Function after transition where dialogue is carried out
function ReceptionScene2:onTransitionInEnd()	
	counter = 0
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				buttonTextBack:setVisible(true)
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(6)
				clickSound:play()
				dialogue = "Hey there, " .. playerName .. "!"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "Welcome to the Chelsea & Westminster Hospital!"
				text:setText(dialogue)
			elseif (counter == 2) then
				clickSound:play()
				dialogue = "Your procedure is about to begin"
				text:setText(dialogue)
			elseif (counter == 3) then
				clickSound:play()
				doctorSpriteAnimation:gotoAndStop(7)
				dialogue = "Today you'll have a Gastric Emptying scan"
				text:setText(dialogue)
			elseif (counter == 4) then
				doctorSpriteAnimation:gotoAndStop(6)
				clickSound:play()
				dialogue = "That may sound scary! Don't worry though!"
				text:setText(dialogue)
			elseif (counter == 5) then
				clickSound:play()
				dialogue = "It'll be fun and you'll be done in no time!"
				text:setText(dialogue)
			elseif (counter == 6) then
				doctorSpriteAnimation:gotoAndStop(7)
				clickSound:play()
				dialogue = "First, you'll drink a bit of milk to begin"
				text:setText(dialogue)
			elseif (counter == 7) then
				clickSound:play()
				dialogue = "Then we will do a few scans to make sure all is well"
				text:setText(dialogue)
			elseif (counter == 8) then
				text:setText("")
				buttonTextBack:setVisible(false)
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("injectionRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
			end	
			counter = counter + 1
		end
	)
end

function ReceptionScene2:onTransitionOutBegin()
end

function ReceptionScene2:onTransitionOutEnd()
end
