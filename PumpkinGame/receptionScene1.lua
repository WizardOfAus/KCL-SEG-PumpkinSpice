-- First reception scene 

ReceptionScene1 = gideros.class(Sprite)

-- Initializer
function ReceptionScene1:init(t)
	self:addChild(Bitmap.new(Texture.new("Image/Reception.png")))

	-- Adding event listeners
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

function ReceptionScene1:onTransitionInBegin()
end

-- Function after transition where dialogue is carried out
function ReceptionScene1:onTransitionInEnd()	
	counter = 0
	doctorSpriteAnimation:setScale(1.5)
	doctorSpriteAnimation:setPosition(-900, -400)
	doctorSpriteAnimation:setVisible(false)
	self:addChild(doctorSpriteAnimation)
	
	self:addChild(textBackground)
	textBackground:setVisible(false)
	self:addChild(text)
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				buttonTextBack:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(6)
				doctorSpriteAnimation:setVisible(true)
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
				dialogue = "First off, you'll have a delicious breakfast of your choice or of what your parents brought today"
				text:setText(dialogue)
			elseif (counter == 4) then
				clickSound:play()
				dialogue = "Then we will do a few scans to make sure all is well"
				text:setText(dialogue)
			elseif (counter == 5) then
				buttonTextBack:setVisible(false)
				text:setText("")
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false)
				--Transition to new scene
				sceneManager:changeScene("injectionRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
			end	
			counter = counter + 1
		end
	)
end

function ReceptionScene1:onTransitionOutBegin()
end

function ReceptionScene1:onTransitionOutEnd()
end
