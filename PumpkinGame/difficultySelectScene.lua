--Class defines whether child will go through the simple or complex path of the procedure

DifficultySelectScene = gideros.class(Sprite)

-- Initializer
function DifficultySelectScene:init(t)
	-- Adding event listeners
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
	
	local command = TextWrap.new("Select the level", 400, "center")
	command:setFont(font)
	command:setLineSpacing(5)
	command:setScale(2)
	command:setY(200)
	command:setX(240)

	self:addChild(command)

	local button_easy_default = Bitmap.new(Texture.new("Image/SimpleUp.png"))
	local button_easy_pushed = Bitmap.new(Texture.new("Image/SimpleDown.png"))
	local button_hard_default = Bitmap.new(Texture.new("Image/AdvancedUp.png"))
	local button_hard_pushed = Bitmap.new(Texture.new("Image/AdvancedDown.png"))

	local buttonEasy = Button.new(button_easy_default, button_easy_pushed)
	local buttonHard = Button.new(button_hard_default, button_hard_pushed)

 
	local x = ((800)/2 - buttonEasy:getHeight()/2)
	local y1 = (((1280)/6)*2 - buttonEasy:getWidth()/2)
	local y3 = (((1280)/6)*4 - buttonEasy:getWidth()/2)

	buttonEasy:setPosition(y1, x)
	buttonHard:setPosition(y3, x)
	self:addChild(buttonEasy)
	self:addChild(buttonHard)
 
 	-- Adding event listeners
	buttonEasy:addEventListener("click", 
		function()  
			print("Easy Mode")
			clickSound:play()
			difficulty = 0
			sceneManager:changeScene("scanTypeSelectScene", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
	-- Adding event listeners
	buttonHard:addEventListener("click", 
		function()  
			print("Hard Mode")
			clickSound:play()
			difficulty = 1
			sceneManager:changeScene("scanTypeSelectScene", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
	
end

function DifficultySelectScene:onTransitionInBegin()
end

function DifficultySelectScene:onTransitionInEnd()
end

function DifficultySelectScene:onTransitionOutBegin()
end

function DifficultySelectScene:onTransitionOutEnd()
end
