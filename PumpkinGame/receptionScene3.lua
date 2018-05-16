-- Third reception scene 

ReceptionScene3 = gideros.class(Sprite)

-- Initializer
function ReceptionScene3:init(t)
	self:addChild(Bitmap.new(Texture.new("Image/Reception.png")))
	doctorSpriteAnimation:setScale(1.5)
	doctorSpriteAnimation:setPosition(-900, -400)
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

function ReceptionScene3:onTransitionInBegin()
end

-- Function after transition where dialogue is carried out
function ReceptionScene3:onTransitionInEnd()
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
				if(scanType == 4) then 
					dialogue = "Today you'll have a Renogram & Reflux scan"
					text:setText(dialogue)
				elseif(scanType == 5) then
					dialogue = "Today you'll have a Renogram kidney scan"
					text:setText(dialogue)
				elseif(scanType == 6) then 
					dialogue = "Today you'll have a DMSA kidney scan"
					text:setText(dialogue)
				else
					dialogue = "Today you'll have a Renogram and DMSA kidney scan"
					text:setText(dialogue)
				end
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
				dialogue = "First off, we will put some cream on your arm"
				text:setText(dialogue)
			elseif (counter == 7) then
				clickSound:play()
				dialogue = "This way, the injection will feel like a small pinch"
				text:setText(dialogue)
			elseif (counter == 8) then
				clickSound:play()
				if(scanType == 4) then 
					dialogue = "After the injection we will make two quick scans"
					text:setText(dialogue)
				elseif(scanType == 5) then
					dialogue = "After the injection we will make a quick scan"
					text:setText(dialogue)
				elseif(scanType == 6) then 
					dialogue = "We will inject in 2 or 3 areas, the you are free for a bit before we do a quick scan"
					text:setText(dialogue)
				else
					dialogue = "After the injection you'll have a quick scan, then we will make another round of injection and scans"
					text:setText(dialogue)
				end
			elseif (counter == 9) then
				doctorSpriteAnimation:gotoAndStop(6)
				clickSound:play()
				dialogue = "This is a lot of information! \nBut don't worry!"
				text:setText(dialogue)
			elseif (counter == 10) then
				clickSound:play()
				dialogue = "All you need to do is be relaxed and it'll be over in no time!"
				text:setText(dialogue)
			elseif (counter == 11) then
				text:setText("")
				buttonTextBack:setVisible(false)
				doctorSpriteAnimation:setVisible(false)
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("injectionRoomScene2", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )
			end	
			counter = counter + 1
		end
	)
end

function ReceptionScene3:onTransitionOutBegin()
end

function ReceptionScene3:onTransitionOutEnd()
end
