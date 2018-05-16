--Final scene at end of game

EndingScene = gideros.class(Sprite)

-- Initializer
function EndingScene:init(t)
		
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
	
	local command = TextWrap.new("Thank you for playing " .. playerName .."!\nGood Luck!!!", 400, "center")
	command:setFont(font)
	command:setLineSpacing(5)
	command:setScale(2)
	command:setY(400)
	command:setX(240)

	self:addChild(command)
end

-- Function for start of transition
function EndingScene:onTransitionInBegin()
end

-- Function taking user back to home scene after end of game at the end of transition
function EndingScene:onTransitionInEnd()	
	self:addEventListener(Event.TOUCHES_END, 
		function()  
			sceneManager:changeScene("homeScene", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
end

function EndingScene:onTransitionOutBegin()
end

function EndingScene:onTransitionOutEnd()
end
