-- Class that defines the type of scan the child will undergo

ScanTypeSelectScene = gideros.class(Sprite)

-- Initializer
function ScanTypeSelectScene:init(t)	
	--Adding even listeners
	self:addEventListener("enterBegin", self.onTransitionInBegin, self)
	self:addEventListener("enterEnd", self.onTransitionInEnd, self)
	self:addEventListener("exitBegin", self.onTransitionOutBegin, self)
	self:addEventListener("exitEnd", self.onTransitionOutEnd, self)
	
	self:typeSelect()
	
	local command = TextWrap.new("Select the procedure", 400, "center")
	command:setFont(font)
	command:setLineSpacing(5)
	command:setScale(2)
	command:setY(110)
	command:setX(240)

	self:addChild(command)
	
end

--Function allocates scan type based on button selected
function ScanTypeSelectScene:typeSelect()

	local button_type1_default = Bitmap.new(Texture.new("Image/Scan1Up.png"))
	local button_type1_pushed = Bitmap.new(Texture.new("Image/Scan1Down.png"))
	local button_type2_default = Bitmap.new(Texture.new("Image/Scan2Up.png"))
	local button_type2_pushed = Bitmap.new(Texture.new("Image/Scan2Down.png"))
	local button_type3_default = Bitmap.new(Texture.new("Image/Scan3Up.png"))
	local button_type3_pushed = Bitmap.new(Texture.new("Image/Scan3Down.png"))
	local button_type4_default = Bitmap.new(Texture.new("Image/Scan4Up.png"))
	local button_type4_pushed = Bitmap.new(Texture.new("Image/Scan4Down.png"))
	local button_type5_default = Bitmap.new(Texture.new("Image/Scan5Up.png"))
	local button_type5_pushed = Bitmap.new(Texture.new("Image/Scan5Down.png"))
	local button_type6_default = Bitmap.new(Texture.new("Image/Scan6Up.png"))
	local button_type6_pushed = Bitmap.new(Texture.new("Image/Scan6Down.png"))
	local button_type7_default = Bitmap.new(Texture.new("Image/Scan7Up.png"))
	local button_type7_pushed = Bitmap.new(Texture.new("Image/Scan7Down.png"))

	local buttonType1 = Button.new(button_type1_default, button_type1_pushed)
	local buttonType2 = Button.new(button_type2_default, button_type2_pushed)
	local buttonType3 = Button.new(button_type3_default, button_type3_pushed)
	local buttonType4 = Button.new(button_type4_default, button_type4_pushed)
	local buttonType5 = Button.new(button_type5_default, button_type5_pushed)
	local buttonType6 = Button.new(button_type6_default, button_type6_pushed)
	local buttonType7 = Button.new(button_type7_default, button_type7_pushed)
 
	buttonType1:setScale(0.4)
	buttonType2:setScale(0.4)
	buttonType3:setScale(0.4)
	buttonType4:setScale(0.4)
	buttonType5:setScale(0.4)
	buttonType6:setScale(0.4)
	buttonType7:setScale(0.4)
 
	local y1 = (((1280)/7)*1 - buttonType1:getWidth()/2)
	local y2 = ((1280)/2 - buttonType1:getWidth()/2)
	local y3 = (((1280)/7)*6 - buttonType1:getWidth()/2)
	local y4 = (((1280)/9)*3 - buttonType1:getWidth()/2)
	local y5 = (((1280)/9)*6 - buttonType1:getWidth()/2)

	buttonType1:setPosition(y4, ((800)/7)*2 - buttonType1:getHeight()/2)
	buttonType2:setPosition(y5, ((800)/7)*2 - buttonType1:getHeight()/2)
	buttonType3:setPosition(y1, (800)/2 - buttonType1:getHeight()/2)
	buttonType4:setPosition(y2, (800)/2 - buttonType1:getHeight()/2)
	buttonType5:setPosition(y3, (800)/2 - buttonType1:getHeight()/2)
	buttonType6:setPosition(y4, ((800)/7)*5 - buttonType1:getHeight()/2)
	buttonType7:setPosition(y5, ((800)/7)*5 - buttonType1:getHeight()/2)
	
	self:addChild(buttonType1)
	self:addChild(buttonType2)
	self:addChild(buttonType3)
	self:addChild(buttonType4)
	self:addChild(buttonType5)
	self:addChild(buttonType6)
	self:addChild(buttonType7)
	
	-- Adding event listeners
	buttonType1:addEventListener("click", 
		function()  
			print("Type 1")
			clickSound:play()
			scanType = 1
			sceneManager:changeScene("receptionScene1", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
	-- Adding event listeners
	buttonType2:addEventListener("click", 
		function()  
			print("Type 1")
			clickSound:play()
			scanType = 2
			sceneManager:changeScene("receptionScene1", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
	-- Adding event listeners
	buttonType3:addEventListener("click", 
		function()  
			print("Type 2")
			clickSound:play()
			scanType = 3
			sceneManager:changeScene("receptionScene2", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
	-- Adding event listeners
	buttonType4:addEventListener("click", 
		function()  
			print("Type 3")
			clickSound:play()
			scanType = 4
			sceneManager:changeScene("receptionScene3", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
	-- Adding event listeners
	buttonType5:addEventListener("click", 
		function()  
			print("Type 3")
			clickSound:play()
			scanType = 5
			sceneManager:changeScene("receptionScene3", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
	-- Adding event listeners
	buttonType6:addEventListener("click", 
		function()  
			print("Type 4")
			clickSound:play()
			scanType = 6
			sceneManager:changeScene("receptionScene3", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)
	-- Adding event listeners
	buttonType7:addEventListener("click", 
		function()  
			print("Type 5")
			clickSound:play()
			scanType = 7
			sceneManager:changeScene("receptionScene3", 1, SceneManager.crossfade, easing.linear, { eventFilter={Event.MOUSE_DOWN} } )
		end
	)


end

function ScanTypeSelectScene:onTransitionInBegin()
end

function ScanTypeSelectScene:onTransitionInEnd()
end

function ScanTypeSelectScene:onTransitionOutBegin()
end

function ScanTypeSelectScene:onTransitionOutEnd()
end
