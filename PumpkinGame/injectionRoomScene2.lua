-- Second injection room scene

InjectionRoomScene2 = gideros.class(Sprite)

-- Initializer
function InjectionRoomScene2:init(t)
	self:addChild(Bitmap.new(Texture.new("Image/InjectionRoom.png")))
		
	doctorSpriteAnimation:setScale(1.5)
	doctorSpriteAnimation:setPosition(-1100, -400)
	doctorSpriteAnimation:setVisible(false)
	self:addChild(doctorSpriteAnimation)
	
	vignette = Bitmap.new(Texture.new("Image/Vignette.png"))
	self:addChild(vignette)
	vignette:setVisible(false)
	
	cream1 = Bitmap.new(Texture.new("Image/cream1.png"))
	cream2 = Bitmap.new(Texture.new("Image/cream2.png"))
	cream3 = Bitmap.new(Texture.new("Image/cream3.png"))
	
	self:addChild(textBackground)
	textBackground:setVisible(false)
	self:addChild(text)
	
	-- Adding event listener
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

function InjectionRoomScene2:onTransitionInBegin()
end

-- Function after transition where dialogue is carried out
function InjectionRoomScene2:onTransitionInEnd()
	counter = 0	
	if(difficulty == 0) then
		self:simpleBranch()
	else
		tapCounter = 0
		-- lowers number of taps accumulated
		local tapTimer = Timer.delayedCall(1000, 
			function()
				if(tapCounter > 1) then
					tapCounter = tapCounter - 2
					print(tapCounter)
				end
			end
		)
		self:complexBranch()
	end
end

-- Simple dialogue branch
function InjectionRoomScene2:simpleBranch()
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				buttonTextBack:setVisible(true)
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(4)
				clickSound:play()
				dialogue = playerName .. ", We'll start off by placing some numbing cream on the areas we will inject"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "It'll all be nice and simple!"
				text:setText(dialogue)
			elseif (counter == 2) then
				doctorSpriteAnimation:gotoAndStop(5)
				clickSound:play()
				dialogue = "Once the cream has been placed you will wait for 45 minutes before the injection"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 3) then
				vignette:setVisible(true)
				buttonTextBack:setVisible(false)
				dialogue = "Tap the screen to apply the cream!"
				text:setText(dialogue)
				self:addChild(cream1)
			elseif (counter == 4) then
				text:setText("")
				textBackground:setVisible(false)
			elseif (counter == 5) then
				self:removeChild(cream1)
				self:addChild(cream2)
			elseif (counter == 6) then
				self:removeChild(cream2)
				self:addChild(cream3)
			elseif (counter == 7) then
				vignette:setVisible(false)
				cream3:setVisible(false)
				clickSound:play()
				textBackground:setVisible(true)
				dialogue = "Well done!"
				text:setText(dialogue)	
			elseif (counter == 8) then 
				text:setText("")
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("waitingRoomScene2", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
			end
			counter = counter + 1
		end
	)
end

-- Complex dialogue branch
function InjectionRoomScene2:complexBranch()
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			local counterProgress = false
			if (counter == 0) then
				buttonTextBack:setVisible(true)
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(4)
				clickSound:play()
				dialogue = playerName .. ", We'll start off by placing some numbing cream on the areas we will inject"
				textBackground:setVisible(true)
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "It'll all be nice and simple!"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 2) then
				doctorSpriteAnimation:gotoAndStop(5)
				clickSound:play()
				dialogue = "Once the cream has been placed you will wait for 45 minutes before the injection"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 3) then
				vignette:setVisible(true)
				buttonTextBack:setVisible(false)
				dialogue = "Tap the screen to remove the lid!"
				text:setText(dialogue)
				self:addChild(cream1)
				counterProgress = true
			elseif (counter == 4) then
				self:removeChild(cream1)
				self:addChild(cream2)
				counterProgress = true
			elseif (counter == 5) then
				dialogue = "Now tap as many times as you can to remove the cream!"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 6) then
				tapCounter = tapCounter + 1
				if (tapCounter == 20) then
					self:removeChild(cream2)
					self:addChild(cream3)
					counterProgress = true
				end
			elseif (counter == 7) then
				vignette:setVisible(false)
				cream3:setVisible(false)
				clickSound:play()
				textBackground:setVisible(true)
				dialogue = "Well done!"
				text:setText(dialogue)	
				counterProgress = true
			elseif (counter == 8) then
				text:setText("")
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("waitingRoomScene2", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
			end
			if (counterProgress == true) then
				counter = counter + 1
			end
		end
	)
end

function InjectionRoomScene2:onTransitionOutBegin()
end

function InjectionRoomScene2:onTransitionOutEnd()
end
