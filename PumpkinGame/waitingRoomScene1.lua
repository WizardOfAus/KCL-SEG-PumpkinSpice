-- First waiting room scene

WaitingRoomScene1 = gideros.class(Sprite)

-- Initializer
function WaitingRoomScene1:init(t)
	self:addChild(Bitmap.new(Texture.new("Image/WaitingRoom.png")))
		
	self:addChild(textBackground)
	textBackground:setVisible(false)
	self:addChild(text)	
	
	-- Adding event listener
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
end

function WaitingRoomScene1:onTransitionInBegin()
end

-- Function after transition where dialogue is carried out
function WaitingRoomScene1:onTransitionInEnd()
	counter = 0
	local back = 0
	if(difficulty == 0) then
		self:simpleBranch()
	else
		self:complexBranch()
	end
end

-- Simple dialogue branch
function WaitingRoomScene1:simpleBranch()
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				buttonTextBack:setVisible(true)
				clickSound:play()
				dialogue = "Now you have to wait a short time for the tracer to get to work!"
				textBackground:setVisible(true)
				text:setText(dialogue)	
				counter = counter +1 
			elseif (counter == 1) then
				buttonTextBack:setVisible(false)
				text:setText("")
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("scanningRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )				
			end	
		end
	)
end

-- Complex dialogue branch
function WaitingRoomScene1:complexBranch()
	local button_close_default = Bitmap.new(Texture.new("Image/backUp.png"))
	local button_close_pushed = Bitmap.new(Texture.new("Image/backDown.png"))
	-- Adding close button into scene
	local buttonClose = Button.new(button_close_default, button_close_pushed)
	buttonClose:setScale(2)
	buttonClose:setPosition(900,40)
	self:addChild(buttonClose)
	buttonClose:setVisible(false)
	
	-- Adding event listener
	buttonClose:addEventListener("click", 
    function() 
		if (counter == 5) then
			counter = counter + 1
		end
	end
	)
	
	--Creating local gesture object
	local gesture = Gestures.new({
		debug = false,
		draw = true,
		drawColor = 0xff0000,
		drawWidth = 5,
		autoTrack = true,
		scope = stage,
		allowRotation = true,
		inverseShape = true,
		points = 33
	})
	
	local drawCounter = 0
	shape = ""
	-- Adding event listener
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			if (counter == 0) then
				buttonTextBack:setVisible(true)
				clickSound:play()
				dialogue = "Now you have to wait a short time!"
				textBackground:setVisible(true)
				text:setText(dialogue)	
				counter = counter +1 
			elseif (counter == 1) then
				clickSound:play()
				dialogue = "This is so the tracer has time to take effect"
				textBackground:setVisible(true)
				text:setText(dialogue)
				counter = counter + 1
			elseif (counter == 2) then
				clickSound:play()
				dialogue = "While you wait, you can play a game!"
				textBackground:setVisible(true)
				text:setText(dialogue)
				counter = counter + 1
			elseif (counter == 3) then	
				clickSound:play()
				dialogue = "Draw the correct shapes on the tablet, or press X to quit"
				text:setText(dialogue)
				counter = counter + 1
			elseif (counter == 4) then 
				clickSound:play()
				buttonTextBack:setVisible(false)
				buttonClose:setVisible(true)
				dialogue = "Firstly, draw a circle"
				text:setText(dialogue)
				counter = counter + 1
			elseif (counter == 5) then 
				if(drawCounter == 0) then
					self:loadGestures(gesture)
					if(shape == "Circle") then
						dialogue = "Perfect!\nNow, draw a square"
						text:setText(dialogue)
						drawCounter = drawCounter + 1
					else
						dialogue = "Oops, that looked like a " .. shape .. ".\nWe're looking for a circle. Try again!"
						text:setText(dialogue)
					end
				elseif(drawCounter == 1) then
					if(shape == "Square") then
						dialogue = "Awesome!\nNow, draw a triangle"
						text:setText(dialogue)
						drawCounter = drawCounter + 1
					else
						dialogue = "Oops, that looked like a " .. shape .. ".\nWe're looking for a square. Try again!"
						text:setText(dialogue)
					end
				elseif(drawCounter == 2) then
					if(shape == "Triangle" or shape == "Equilateral Triangle") then
						dialogue = "Excellent!\nFinally, draw a check"
						text:setText(dialogue)
						drawCounter = drawCounter + 1
					else
						dialogue = "Oops, that looked like a " .. shape .. ".\nWe're looking for a triangle. Try again!"
						text:setText(dialogue)
					end
				elseif(drawCounter == 3) then
					if(shape == "Check") then
						dialogue = "Perfect!"
						text:setText(dialogue)
						drawCounter = drawCounter + 1
					else
						dialogue = "Oops, that looked like a " .. shape .. ".\nWe're looking for a check. Try again!"
						text:setText(dialogue)
					end
				elseif(drawCounter == 4) then
					dialogue = "You have now finished the drawing exercises,\npress X when you want to continue"
					text:setText(dialogue)
				end
			elseif (counter == 6) then
				gesture:remove()
				buttonClose:setVisible(true)
				text:setText("")
				textBackground:setVisible(false)
				transitionSound:play()
				--Transition to new scene
				sceneManager:changeScene("scanningRoomScene1", 1, SceneManager.flip, easing.inOutQuadratic, { eventFilter={Event.MOUSE_DOWN} } )				
			end	
		end
	)
end

-- Loading gestures
function WaitingRoomScene1:loadGestures(gest)
	local function callback(name)
		shape = name
	end

	gest:addGesture("Square", {
		{x = 0, y = 0},
		{x = 200, y = 0},
		{x = 200, y = 200},
		{x = 0, y = 200},
		{x = 0, y = 0}
	}, callback)


	gest:addGesture("Triangle", {
		{x = 0, y = 0},
		{x = 100, y = 100},
		{x = 0, y = 100},
		{x = 0, y = 0}
	}, callback)

	gest:addGesture("Equilateral Triangle", {
		{x = 0, y = 0},
		{x = 50, y = 87},
		{x = 100, y = 0},
		{x = 0, y = 0}
	}, callback)

	gest:addGesture("Check", {
		{x = 0, y = 0},
		{x = 50, y = 50},
		{x = 100, y = 0},
	}, callback)

	local x = 0
	local y = -100
	local circle = {}
	local totalPoints = 72
	local step = (math.pi*2)/totalPoints

	for angle = 1, totalPoints do
		local newX = x*math.cos(angle*step)-y*math.sin(angle*step)
		local newY = y*math.cos(angle*step)+x*math.sin(angle*step)
		local point = {x = newX, y = newY}
		table.insert(circle, point)
	end

	gest:addGesture("Circle", circle, callback)
end

function WaitingRoomScene1:onTransitionOutBegin()
end

function WaitingRoomScene1:onTransitionOutEnd()
end
