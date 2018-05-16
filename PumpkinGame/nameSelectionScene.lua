--Class allows child to add their name to the game

NameSelectionScene = gideros.class(Sprite)

function NameSelectionScene:init(t)
	buttonTextBack:setVisible(false)
	
	-- Adding event listeners
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
	
	local button_text_default = Bitmap.new(Texture.new("Image/textEnterUp.png"))
	local button_text_pushed = Bitmap.new(Texture.new("Image/textEnterDown.png"))
	local button_tick_default = Bitmap.new(Texture.new("Image/tickUp.png"))
	local button_tick_pushed = Bitmap.new(Texture.new("Image/tickDown.png"))

	local buttonText = Button.new(button_text_default, button_text_pushed)
	local buttonTick = Button.new(button_tick_default, button_tick_pushed)
 
	local x = ((800)/2 - buttonText:getHeight()/2)
	local y1 = (((1280)/6)*2 - buttonText:getWidth()/2)
	local y3 = (((1280)/6)*4 - buttonText:getWidth()/2)
	
	local command = TextWrap.new("What is your name?", 400, "center")
	command:setFont(font)
	command:setLineSpacing(5)
	command:setScale(2)
	command:setY(200)
	command:setX(240)
	
	playerName = ""
	
	local textfield_name = TextWrap.new("Press the '...' button to enter a name!", 640, "center")
	textfield_name:setFont(font)
	textfield_name:setLineSpacing(5)
	textfield_name:setScale(2)
	textfield_name:setY(400)
	textfield_name:setX(0)
	
	self:addChild(command)
	self:addChild(textfield_name)

	buttonText:setPosition(y1, x+200)
	buttonTick:setPosition(y3, x+200)
	self:addChild(buttonText)
	self:addChild(buttonTick)
 
	local textInputDialog = TextInputDialog.new("Enter Name", "Please enter your name!", "", "Cancel", "OK")

	local function onComplete(event)
		if event.buttonText == "OK" then
			playerName = event.text
			textfield_name:setText(playerName)
		end
	end
	
	-- Adding event listeners
	textInputDialog:addEventListener(Event.COMPLETE, onComplete)
	
 	-- Adding event listeners
	buttonText:addEventListener("click", 
		function()  
			clickSound:play()
			textInputDialog:show()
		end
	)
	-- Adding event listeners
	buttonTick:addEventListener("click", 
		function()  
			clickSound:play()
			if (playerName ~= "") then
			sceneManager:changeScene("difficultySelectScene", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
			end
		end
	)
	
end

function NameSelectionScene:onTransitionInBegin()
	print("nameSelectionScene - enter begin")
end

function NameSelectionScene:onTransitionInEnd()	
	print("nameSelectionScene - enter end")
end

function NameSelectionScene:onTransitionOutBegin()
	print("nameSelectionScene - exit begin")
end

function NameSelectionScene:onTransitionOutEnd()
	print("nameSelectionScene - exit end")
end
