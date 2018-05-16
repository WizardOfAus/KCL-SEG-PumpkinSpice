--Second scanning room scene

ScanningRoomScene2 = gideros.class(Sprite)

-- Initializer
function ScanningRoomScene2:init(t)
	
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

function ScanningRoomScene2:onTransitionInBegin()
end

-- Sound for scanner and transition event
function postSound2()
	doctorSpriteAnimation:setVisible(false)
	transitionSound:play()
	text:setText("")
	text:setScale(1)
	text:setX(textfieldX)
	text:setY(textfieldY)
	--Transition to new scene
	sceneManager:changeScene("injectionRoomScene4", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )	
end

-- Function after transition where dialogue is carried out
function ScanningRoomScene2:onTransitionInEnd()
	counter = 0
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				buttonTextBack:setVisible(true)
				doctorSpriteAnimation:setVisible(true)
				doctorSpriteAnimation:gotoAndStop(1)
				clickSound:play()
				dialogue = "Your Renogram scan is about to begin!"
				textBackground:setVisible(true)
				text:setText(dialogue)
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "For this you you'll be lying on a couch"
				text:setText(dialogue)
			elseif (counter == 2) then
				clickSound:play()
				dialogue = "and a camera will be placed beneath the couch for around 20 minutes"
				text:setText(dialogue)
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
				doctorSpriteAnimation:gotoAndStop(3)
				buttonTextBack:setVisible(false)
				text:setScale(3)
				text:setX(0)
				text:setY(650)
				text:setText("GO!")
				scanSound:play()
				textBackground:setVisible(false)
				local timer = Timer.delayedCall(5600, postSound2)
			end	
			counter = counter + 1
		end
	)

end

function ScanningRoomScene2:onTransitionOutBegin()
end

function ScanningRoomScene2:onTransitionOutEnd()
end
