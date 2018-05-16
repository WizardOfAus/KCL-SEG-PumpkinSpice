-- Class that hosts the start scene

HomeScene = gideros.class(Sprite)

-- Initializer
function HomeScene:init(t)	
	
	titleAnimation:setPosition(0,70)
	self:addChild(titleAnimation)
	
	titleAnimation:setGotoAction(238, 1)
	titleAnimation:gotoAndPlay(1)
	
	local test = Bitmap.new(Texture.new("Image/TitleScreen.png"))
	self:addChild(test)
	
	beginTextAnimation:setPosition(0,0)
	self:addChild(beginTextAnimation)
	
	beginTextAnimation:setGotoAction(60,1)
	beginTextAnimation:gotoAndPlay(1)
	
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
	
end

-- Function hides text back button at beginning of transition
function HomeScene:onTransitionInBegin()
	buttonTextBack:setVisible(false)
end

--Function resets dialogue after transition
function HomeScene:onTransitionInEnd()
	dialogue = ""
	text:setText(dialogue)
	-- Adding event listeners
	self:addEventListener(Event.TOUCHES_END, function() sceneManager:changeScene("nameSelectionScene", 1, SceneManager.moveFromLeft, easing.outBounce, { eventFilter={Event.MOUSE_DOWN} }) end)
end

function HomeScene:onTransitionOutBegin()
end

function HomeScene:onTransitionOutEnd()
end
