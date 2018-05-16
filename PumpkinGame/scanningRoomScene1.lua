--First scanning room scene

ScanningRoomScene1 = gideros.class(Sprite)

-- Initializer
function ScanningRoomScene1:init(t)
	
	scanningRoomAnimation:setPosition(0,0)
	self:addChild(scanningRoomAnimation)
	
	scanningRoomAnimation:setGotoAction(120, 1)
	scanningRoomAnimation:gotoAndPlay(1)
	
	doctorSpriteAnimation:setScale(1.5)
	doctorSpriteAnimation:setPosition(-930, -400)
	doctorSpriteAnimation:setVisible(false)
	self:addChild(doctorSpriteAnimation)
	
	self:addChild(textBackground)
	textBackground:setVisible(false)
	self:addChild(text)
	
	-- Adding event listeners
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

function ScanningRoomScene1:onTransitionInBegin()
end

-- Sound played for scanning event and transition event
function postSound()
	doctorSpriteAnimation:setVisible(false)
	transitionSound:play()
	text:setText("")
	text:setScale(1)
	text:setX(textfieldX)
	text:setY(textfieldY)
	--Transition to new scene
	sceneManager:changeScene("bedroomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )	
end

-- Function after transition where dialogue is carried out
function ScanningRoomScene1:onTransitionInEnd()
	counter = 0
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				buttonTextBack:setVisible(true)
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(1)
				clickSound:play()
				if (scanType == 1 or scanType == 2 or scanType == 3) then
					dialogue = "Your Gastric Emptying scan is about to begin!"
					text:setText(dialogue)
				elseif (scanType == 4 or scanType == 5 or scanType == 7) then
					dialogue = "Your Renogram scan is about to begin"
					text:setText(dialogue)
				else 
					dialogue = "After 3 hours to enjoy, you'll come back to this room"
					text:setText(dialogue)
				end
				textBackground:setVisible(true)
			elseif (counter == 1) then
				clickSound:play()
				if (scanType == 1 or scanType == 2) then
					dialogue = "We'll take a picture for 1 minute of your abdomen every half hour after you ate"
					text:setText(dialogue)
				elseif (scanType == 3) then
					dialogue = "We'll take a picture for 1 minute of your abdomen every half hour after you drank"
					text:setText(dialogue)
				elseif (scanType == 4 or scanType == 5 or scanType == 7) then
					dialogue = "For this you you'll be lying on a couch"
					text:setText(dialogue)
				else 
					dialogue = "Now, your DMSA scan is about to begin!"
					text:setText(dialogue)
				end
			elseif (counter == 2) then
				clickSound:play()
				if (scanType == 1 or scanType == 2 or scanType == 3) then
					dialogue = "for around 2 hours"
					text:setText(dialogue)
				elseif (scanType == 4 or scanType == 5 or scanType == 7) then
					dialogue = "and a camera will be placed beneath the couch for around 20 minutes"
					text:setText(dialogue)
				else 
					dialogue = "It will last for around half an hour"
					text:setText(dialogue)
				end
			elseif (counter == 3) then
				clickSound:play()
				dialogue = "Don't worry, " .. playerName .. "!\nIt's not as frightening as it looks!"
				text:setText(dialogue)
			elseif (counter == 4) then
				clickSound:play()
				dialogue = "You'll have a bunch of fun options to do while the scanning happens"
				text:setText(dialogue)
			elseif (counter == 5) then
				clickSound:play()
				dialogue = "So now..."
				text:setText(dialogue)
			elseif (counter == 6) then
				clickSound:play()
				dialogue = "Get Ready!"
				text:setText(dialogue)
			elseif (counter == 7) then
				doctorSpriteAnimation:gotoAndStop(2)
				clickSound:play()
				dialogue = "Set!"
				text:setText(dialogue)
			elseif (counter == 8) then
				buttonTextBack:setVisible(false)
				doctorSpriteAnimation:gotoAndStop(3)
				text:setScale(3)
				text:setX(0)
				text:setY(650)
				text:setText("GO!")
				scanSound:play()
				textBackground:setVisible(false)
				local timer = Timer.delayedCall(5600, postSound)
			end	
			counter = counter + 1
		end
	)
end

function ScanningRoomScene1:onTransitionOutBegin()
end

function ScanningRoomScene1:onTransitionOutEnd()
end
