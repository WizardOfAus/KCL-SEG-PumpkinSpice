-- Third injection room scene

InjectionRoomScene3 = gideros.class(Sprite)

-- Initializer
function InjectionRoomScene3:init(t)
	self:addChild(Bitmap.new(Texture.new("Image/InjectionRoom.png")))
		
	doctorSpriteAnimation:setScale(1.5)
	doctorSpriteAnimation:setPosition(-1100, -400)
	doctorSpriteAnimation:setVisible(false)
	self:addChild(doctorSpriteAnimation)
	
	vignette = Bitmap.new(Texture.new("Image/Vignette.png"))
	self:addChild(vignette)
	vignette:setVisible(false)
	
	needle1 = Bitmap.new(Texture.new("Image/needle1.png"))
	needle2 = Bitmap.new(Texture.new("Image/needle2.png"))
	
	self:addChild(textBackground)
	textBackground:setVisible(false)
	self:addChild(text)
	-- Adding event listeners
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

function InjectionRoomScene3:onTransitionInBegin()
end

-- Function after transition where dialogue is carried out
function InjectionRoomScene3:onTransitionInEnd()	
	counter = 0
	if(difficulty == 0) then
		self:simpleBranch()
	else
		self:complexBranch()
	end
end

-- Simple Branch Dialogue
function InjectionRoomScene3:simpleBranch()
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(4)
				buttonTextBack:setVisible(true)
				clickSound:play()
				dialogue = playerName .. ", This is the room where you will have\nyour Renogram injection"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "Now we will quickly inject the tracer so we can scan a few pictures of your body"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 2) then
				doctorSpriteAnimation:gotoAndStop(5)
				clickSound:play()
				dialogue = "It'll be over in an instant"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 3) then	
				vignette:setVisible(true)
				buttonTextBack:setVisible(false)
				dialogue = "Tap the screen to complete the injection!"
				text:setText(dialogue)
				self:addChild(needle1)
			elseif (counter == 4) then
				text:setText("")
				textBackground:setVisible(false)
			elseif (counter == 5) then
				self:removeChild(needle1)
				self:addChild(needle2)
			elseif (counter == 6) then
				vignette:setVisible(false)
				needle2:setVisible(false)
				clickSound:play()
				textBackground:setVisible(true)
				dialogue = "Well done!"
				text:setText(dialogue)					
			elseif (counter == 7) then
				clickSound:play()
				dialogue = "Now that your injection is done, your scan will begin in a few minutes!"
				text:setText(dialogue)
			elseif (counter == 8) then
				text:setText("")
				buttonTextBack:setVisible(false)
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false) 
				if (scanType == 4 or scanType == 5) then	
					transitionSound:play()
					--Transition to new scene
					sceneManager:changeScene("scanningRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
				else
					transitionSound:play()
					--Transition to new scene
					sceneManager:changeScene("scanningRoomScene2", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
				end
			end	
			counter = counter + 1
		end
	)
end

-- Complex dialogue branch
function InjectionRoomScene3:complexBranch()
	-- Adding swipe detection
	swipeBox = SwipeDetector.new()
	self:addChild(swipeBox)
	
	--Adding random swipe directions
	swipeDirections = {"up", "down", "left", "right"}
	swipe1 = swipeDirections[math.random(1,4)]
	swipe2 = swipeDirections[math.random(1,4)]
	swipe3 = swipeDirections[math.random(1,4)]
	
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(4)
				buttonTextBack:setVisible(true)
				clickSound:play()
				dialogue = playerName .. ", This is the room where you will have\nyour Renogram injection"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "Now we will quickly inject the tracer so we can scan a few pictures of your body"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 2) then
				doctorSpriteAnimation:gotoAndStop(5)
				clickSound:play()
				dialogue = "It'll be over in an instant"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 3) then	
				buttonTextBack:setVisible(false)
				vignette:setVisible(true)
				dialogue = "Repeat the swipe pattern to complete the injection!"
				text:setText(dialogue)
				self:addChild(needle1)
			elseif (counter == 4) then	
				vignette:setVisible(true)
				print(swipe1)
				print(swipe2)
				print(swipe3)
				dialogue = "The pattern is " .. swipe1 .. ", " .. swipe2 .. ", " .. swipe3 .. "\nMake sure to remember that!"
				text:setText(dialogue)
				self:addChild(needle1)
			elseif (counter == 5 and swipePosition == swipe1) then
				dialogue = "That's right!"
				text:setText(dialogue)
			elseif (counter == 5) then
				dialogue = "Oooh tough luck! Try again!"
				text:setText(dialogue)
				counter = 3
			elseif (counter == 6 and swipePosition == swipe2) then
				dialogue = "Getting closer!"
				text:setText(dialogue)
			elseif (counter == 6) then
				dialogue = "Oooh tough luck! Try again!"
				text:setText(dialogue)
				counter = 3
			elseif (counter == 7 and swipePosition == swipe3) then
				dialogue = "Congrats! Your injection\nwas successful!"
				text:setText(dialogue)
				self:removeChild(needle1)
				self:addChild(needle2)
			elseif (counter == 7) then
				dialogue = "Oooh tough luck! Try again!"
				text:setText(dialogue)
				counter = 3				
			elseif (counter == 8) then
				vignette:setVisible(false)
				needle2:setVisible(false)
				clickSound:play()
				textBackground:setVisible(true)
				dialogue = "Well done!"
				text:setText(dialogue)					
			elseif (counter == 9) then
				clickSound:play()
				dialogue = "Now that your injection is done, your scan will begin in a few minutes!"
				text:setText(dialogue)
			elseif (counter == 10) then
				text:setText("")
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false)  
				if (scanType == 4 or scanType == 5) then	
					transitionSound:play()
					--Transition to new scene
					sceneManager:changeScene("scanningRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
				else
					transitionSound:play()
					--Transition to new scene
					sceneManager:changeScene("scanningRoomScene2", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
				end
			end	
			counter = counter + 1
		end
	)
end

function InjectionRoomScene3:onTransitionOutBegin()
end

function InjectionRoomScene3:onTransitionOutEnd()
end
