--First bedroom scene

BedroomScene1 = gideros.class(Sprite)

function BedroomScene1:init(t)
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

function BedroomScene1:onTransitionInBegin()
end

-- Function after transition where dialogue is carried out
function BedroomScene1:onTransitionInEnd()
	counter = 0
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				clickSound:play()
				buttonTextBack:setVisible(true)
				dialogue = "Everything is now done " .. playerName .. "!"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "You can go back to the\ncomfort of your home!"
				text:setText(dialogue)
			elseif (counter == 2) then
				text:setText("")
				buttonTextBack:setVisible(false)
				textBackground:setVisible(false)
				--Transition to new scene
				sceneManager:changeScene("endingScene", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
			end	
			counter = counter + 1
		end
	)
end

function BedroomScene1:onTransitionOutBegin()
end

function BedroomScene1:onTransitionOutEnd()
end
