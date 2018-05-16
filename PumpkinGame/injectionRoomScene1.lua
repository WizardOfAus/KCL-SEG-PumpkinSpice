InjectionRoomScene1 = gideros.class(Sprite)

-- Initializer
function InjectionRoomScene1:init(t)
	self:addChild(Bitmap.new(Texture.new("Image/InjectionRoom.png")))
		
	doctorSpriteAnimation:setScale(1.5)
	doctorSpriteAnimation:setPosition(-1100, -400)
	doctorSpriteAnimation:setVisible(false)
	self:addChild(doctorSpriteAnimation)
	
	vignette = Bitmap.new(Texture.new("Image/Vignette.png"))	
	self:addChild(vignette)
	vignette:setVisible(false)
	
	burger1 = Bitmap.new(Texture.new("Image/burger1.png"))
	burger2 = Bitmap.new(Texture.new("Image/burger2.png"))
	burger3 = Bitmap.new(Texture.new("Image/burger3.png"))
	
	milk1 = Bitmap.new(Texture.new("Image/milk1.png"))
	milk2 = Bitmap.new(Texture.new("Image/milk2.png"))
	milk3 = Bitmap.new(Texture.new("Image/milk3.png"))
	milk4 = Bitmap.new(Texture.new("Image/milk4.png"))
	
	self:addChild(textBackground)
	textBackground:setVisible(false)
	self:addChild(text)
	
	-- Adding event listeners
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

-- Adding time to swipe
function InjectionRoomScene1:timeSwipe()
	self.swipeTime = self.swipeTime + 100;
end

-- Function after transition where dialogue is carried out
function InjectionRoomScene1:onTransitionInEnd()
	counter = 0
	if(difficulty == 0) then
		self:simpleBranch()
	else
		self:complexBranch()
	end
end

-- Simple dialogue branch
function InjectionRoomScene1:simpleBranch()

	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(4)
				buttonTextBack:setVisible(true)
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					dialogue = playerName .. ", Now you'll have some time to eat your breakfast"
					textBackground:setVisible(true)
					text:setText(dialogue)
				else
					dialogue = playerName .. ", Now you'll have some time to drink your milk"
					textBackground:setVisible(true)
					text:setText(dialogue)
				end
			elseif (counter == 1) then
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					dialogue = "For us to make scans of your body we'll put a tracer in your food"
					text:setText(dialogue)
				else
					dialogue = "For us to make scans of your body we'll put a tracer in your milk"
					text:setText(dialogue)
				end
			elseif (counter == 2) then
				doctorSpriteAnimation:gotoAndStop(5)
				clickSound:play()
				dialogue = "It'll be as delicious as it looks and you won't feel a thing!"
				text:setText(dialogue)
			elseif (counter ==3) then
				buttonTextBack:setVisible(false)
				vignette:setVisible(true)
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					dialogue = "Tap the screen to eat your food!"
					text:setText(dialogue)
					self:addChild(burger1)
				else
					dialogue = "Tap the screen to drink your milk!"
					text:setText(dialogue)
					self:addChild(milk1)
				end
				
			elseif (counter ==4) then
				text:setText("")
				textBackground:setVisible(false)
			elseif (counter ==5) then
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					self:removeChild(burger1)
					self:addChild(burger2)
				else
					self:removeChild(milk1)
					self:addChild(milk2)
				end
			elseif (counter ==6) then
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					self:removeChild(burger2)
					self:addChild(burger3)
				else
					self:removeChild(milk2)	
					self:addChild(milk3)
				end
			elseif (counter ==7) then
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					burger3:setVisible(false)
				else
					self:removeChild(milk3)
					self:addChild(milk4)
				end
			elseif (counter ==8) then
				vignette:setVisible(false)
				burger3:setVisible(false)
				milk4:setVisible(false)
				clickSound:play()
				textBackground:setVisible(true)
				dialogue = "Well done!"
				text:setText(dialogue)
			elseif (counter == 9) then
				text:setText("")
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("waitingRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
			end	
			counter = counter + 1
		end
	)
end

-- Complex dialogue branch
function InjectionRoomScene1:complexBranch()

	swipeBox = SwipeDetector.new()
	self:addChild(swipeBox)

	local swipeTime = 0
	local timer = Timer.new(100, math.huge)
	local swipeTimer = timer
	
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			local counterProgress = false
			if (counter == 0) then
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(4)
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					dialogue = playerName .. ", Now you'll have some time to eat your breakfast"
					textBackground:setVisible(true)
					text:setText(dialogue)
				else
					dialogue = playerName .. ", Now you'll have some time to drink your milk"
					textBackground:setVisible(true)
					text:setText(dialogue)
				end
				counterProgress = true
			elseif (counter == 1) then
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					dialogue = "For us to make scans of your body we'll put a tracer in your food"
					text:setText(dialogue)
				else
					dialogue = "For us to make scans of your body we'll put a tracer in your milk"
					text:setText(dialogue)
				end
				counterProgress = true
			elseif (counter == 2) then
				doctorSpriteAnimation:gotoAndStop(5)
				clickSound:play()
				dialogue = "It'll be as delicious as it looks and you won't feel a thing!"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 3) then
				buttonTextBack:setVisible(false)
				vignette:setVisible(true)
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					dialogue = "Swipe in the correct direction to eat your food!"
					text:setText(dialogue)
					self:addChild(burger1)
				else
					dialogue = "Swipe in the correct direction to drink your milk!"
					text:setText(dialogue)
					self:addChild(milk1)
				end
				counterProgress = true
			elseif (counter == 4) then
				clickSound:play()
				dialogue = "Swipe up!"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 5 and swipePosition == "up") then
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					self:removeChild(burger1)
					self:addChild(burger2)
				else
					self:removeChild(milk1)
					self:addChild(milk2)
				end
				dialogue = "Now Swipe Down!"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 6 and swipePosition == "down") then
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					self:removeChild(burger2)
					self:addChild(burger3)
				else
					self:removeChild(milk2)	
					self:addChild(milk3)
				end
				dialogue = "Now Swipe Left!"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 7 and swipePosition == "left") then
				clickSound:play()
				if(scanType == 1 or scanType == 2) then
					burger3:setVisible(false)
				else
					self:removeChild(milk3)
					self:addChild(milk4)
				end
				dialogue = "Now Swipe Right!"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 8 and swipePosition == "right") then
				vignette:setVisible(false)
				burger3:setVisible(false)
				milk4:setVisible(false)
				clickSound:play()
				textBackground:setVisible(true)
				dialogue = "Well done!"
				text:setText(dialogue)
				counterProgress = true
			elseif (counter == 9) then
				text:setText("")
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("waitingRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
			end	
			if(counterProgress == true) then
				counter = counter + 1
			end
		end
	)
end

function InjectionRoomScene1:onTransitionInBegin()
end

function InjectionRoomScene1:onTransitionOutBegin()
end

function InjectionRoomScene1:onTransitionOutEnd()
end

