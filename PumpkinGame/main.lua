-- Main class

--Adding background
background = Bitmap.new(Texture.new("Image/Background.png"))
background:setScale(2)
background:setPosition(-400,-400)
stage:addChild(background)

--Adding splashscreen
local splashScreen=Bitmap.new(Texture.new("Image/splash.jpg"),true)
stage:addChild(splashScreen)
 
local frameCount=0
local function load()
	if frameCount==1 then
		stage:removeEventListener(Event.ENTER_FRAME,load)
		require("gameSetup")
	end
	frameCount=frameCount+1
end
 
-- Adding event listeners
stage:addEventListener(Event.ENTER_FRAME,load)