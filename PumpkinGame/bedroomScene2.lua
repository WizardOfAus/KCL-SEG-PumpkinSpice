-- Second bedroom scene class

BedroomScene2 = gideros.class(Sprite)

-- Initializer
function BedroomScene2:init(t)
	self:addChild(Bitmap.new(Texture.new("Image/Bedroom.png")))
	
	self:addChild(textBackground)
	textBackground:setVisible(false)
	self:addChild(text)
	-- Adding event listeners
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

function BedroomScene2:onTransitionInBegin()
end

-- Function after transition where dialogue is carried out
function BedroomScene2:onTransitionInEnd()
	counter = 0
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				clickSound:play()
				buttonTextBack:setVisible(true)
				dialogue = "... Like going back to your home!"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "But don't forget about your scan!"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 2) then
				clickSound:play()
				dialogue = "Remember to be back in 3 hours"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 3) then
				text:setText("")
				buttonTextBack:setVisible(false)
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("scanningRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
			end	
			counter = counter + 1
		end
	)
end

function BedroomScene2:onTransitionOutBegin()
end

function BedroomScene2:onTransitionOutEnd()
end
