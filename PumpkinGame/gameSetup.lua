-- Class sets up structure and start of game at initialization

-- Adding background to game
background = Bitmap.new(Texture.new("Image/Background.png"))
background:setScale(2)
background:setPosition(-400,-400)
stage:addChild(background)

application:setOrientation("landscapeLeft")

-- Adding our fontbase
font = Font.new("Assets/Game_Font.txt", "Assets/Game_Font.png")

-- Adding textfield size
textfieldX = 440
textfieldY = 600

--Adding dialogue
text = TextWrap.new("", 400, "center")
text:setFont(font)
text:setLineSpacing(5)
text:setX(textfieldX)
text:setY(textfieldY)
dialogue = ""

-- Loading assets to game
function AssetSetup()


	local beginTextAnim = {}
	beginTextAnim[1] = Bitmap.new(Texture.new("Image/BeginText.png"))
	beginTextAnim[2] = Bitmap.new(Texture.new("Image/Transparent.png"))
	beginTextAnimation = MovieClip.new{
	{1, 30, beginTextAnim[1]},
	{31, 60, beginTextAnim[2]},	
	}
	
	local scanningRoomAnim = {}
	scanningRoomAnim[1] = Bitmap.new(Texture.new("Image/0001.jpeg"))
	scanningRoomAnim[2] = Bitmap.new(Texture.new("Image/0002.jpeg"))
	scanningRoomAnim[3] = Bitmap.new(Texture.new("Image/0003.jpeg"))
	scanningRoomAnim[4] = Bitmap.new(Texture.new("Image/0004.jpeg"))
	scanningRoomAnim[5] = Bitmap.new(Texture.new("Image/0005.jpeg"))
	scanningRoomAnim[6] = Bitmap.new(Texture.new("Image/0006.jpeg"))
	scanningRoomAnimation = MovieClip.new{
	{1, 20, scanningRoomAnim[1]},
	{21, 40, scanningRoomAnim[2]},	
	{41, 60, scanningRoomAnim[3]},
	{61, 80, scanningRoomAnim[4]},
	{81, 100, scanningRoomAnim[5]},
	{101, 120, scanningRoomAnim[6]},	
	}
	
	
	local doctorSpriteAnim = {}
	doctorSpriteAnim[1] = Bitmap.new(Texture.new("Image/CharacterAnims/Woman Doctor 1/helloAnim/0001.png"))
	doctorSpriteAnim[2] = Bitmap.new(Texture.new("Image/CharacterAnims/Woman Doctor 1/helloAnim/0018.png"))
	doctorSpriteAnim[3] = Bitmap.new(Texture.new("Image/CharacterAnims/Woman Doctor 1/helloAnim/0037.png"))
	doctorSpriteAnim[4] = Bitmap.new(Texture.new("Image/CharacterAnims/Woman Doctor 2/writingAnim/0001.png"))
	doctorSpriteAnim[5] = Bitmap.new(Texture.new("Image/CharacterAnims/Woman Doctor 2/writingAnim/0036.png"))
	doctorSpriteAnim[6] = Bitmap.new(Texture.new("Image/CharacterAnims/Woman Doctor 3/readAnim/0001.png"))
	doctorSpriteAnim[7] = Bitmap.new(Texture.new("Image/CharacterAnims/Woman Doctor 3/readAnim/0035.png"))
	
	doctorSpriteAnimation = MovieClip.new{
	{1, 1, doctorSpriteAnim[1]},
	{2, 2, doctorSpriteAnim[2]},
	{3, 3, doctorSpriteAnim[3]},
	{4, 4, doctorSpriteAnim[4]},
	{5, 5, doctorSpriteAnim[5]},
	{6, 6, doctorSpriteAnim[6]},
	{7, 7, doctorSpriteAnim[7]},
	}

	
	local titleAnim = {}	
	titleAnim[1] = Bitmap.new(Texture.new("Image/TitleAnim/0001.jpeg"))
	titleAnim[2] = Bitmap.new(Texture.new("Image/TitleAnim/0002.jpeg"))
	titleAnim[3] = Bitmap.new(Texture.new("Image/TitleAnim/0003.jpeg"))
	titleAnim[4] = Bitmap.new(Texture.new("Image/TitleAnim/0004.jpeg"))
	titleAnim[5] = Bitmap.new(Texture.new("Image/TitleAnim/0005.jpeg"))
	titleAnim[6] = Bitmap.new(Texture.new("Image/TitleAnim/0006.jpeg"))
	titleAnim[7] = Bitmap.new(Texture.new("Image/TitleAnim/0007.jpeg"))
	titleAnim[8] = Bitmap.new(Texture.new("Image/TitleAnim/0008.jpeg"))
	titleAnim[9] = Bitmap.new(Texture.new("Image/TitleAnim/0009.jpeg"))
	titleAnim[10] = Bitmap.new(Texture.new("Image/TitleAnim/0010.jpeg"))
	titleAnim[11] = Bitmap.new(Texture.new("Image/TitleAnim/0011.jpeg"))
	titleAnim[12] = Bitmap.new(Texture.new("Image/TitleAnim/0012.jpeg"))
	titleAnim[13] = Bitmap.new(Texture.new("Image/TitleAnim/0013.jpeg"))
	titleAnim[14] = Bitmap.new(Texture.new("Image/TitleAnim/0014.jpeg"))
	titleAnim[15] = Bitmap.new(Texture.new("Image/TitleAnim/0015.jpeg"))
	titleAnim[16] = Bitmap.new(Texture.new("Image/TitleAnim/0016.jpeg"))
	titleAnim[17] = Bitmap.new(Texture.new("Image/TitleAnim/0017.jpeg"))
	titleAnim[18] = Bitmap.new(Texture.new("Image/TitleAnim/0018.jpeg"))
	titleAnim[19] = Bitmap.new(Texture.new("Image/TitleAnim/0019.jpeg"))
	titleAnim[20] = Bitmap.new(Texture.new("Image/TitleAnim/0020.jpeg"))
	titleAnim[21] = Bitmap.new(Texture.new("Image/TitleAnim/0021.jpeg"))
	titleAnim[22] = Bitmap.new(Texture.new("Image/TitleAnim/0022.jpeg"))
	titleAnim[23] = Bitmap.new(Texture.new("Image/TitleAnim/0023.jpeg"))
	titleAnim[24] = Bitmap.new(Texture.new("Image/TitleAnim/0024.jpeg"))
	titleAnim[25] = Bitmap.new(Texture.new("Image/TitleAnim/0025.jpeg"))
	titleAnim[26] = Bitmap.new(Texture.new("Image/TitleAnim/0026.jpeg"))
	titleAnim[27] = Bitmap.new(Texture.new("Image/TitleAnim/0027.jpeg"))
	titleAnim[28] = Bitmap.new(Texture.new("Image/TitleAnim/0028.jpeg"))
	titleAnim[29] = Bitmap.new(Texture.new("Image/TitleAnim/0029.jpeg"))
	titleAnim[30] = Bitmap.new(Texture.new("Image/TitleAnim/0030.jpeg"))
	titleAnim[31] = Bitmap.new(Texture.new("Image/TitleAnim/0031.jpeg"))
	titleAnim[32] = Bitmap.new(Texture.new("Image/TitleAnim/0032.jpeg"))
	titleAnim[33] = Bitmap.new(Texture.new("Image/TitleAnim/0033.jpeg"))
	titleAnim[34] = Bitmap.new(Texture.new("Image/TitleAnim/0034.jpeg"))
	titleAnim[35] = Bitmap.new(Texture.new("Image/TitleAnim/0035.jpeg"))
	titleAnim[36] = Bitmap.new(Texture.new("Image/TitleAnim/0036.jpeg"))
	titleAnim[37] = Bitmap.new(Texture.new("Image/TitleAnim/0037.jpeg"))
	titleAnim[38] = Bitmap.new(Texture.new("Image/TitleAnim/0038.jpeg"))
	titleAnim[39] = Bitmap.new(Texture.new("Image/TitleAnim/0039.jpeg"))
	titleAnim[40] = Bitmap.new(Texture.new("Image/TitleAnim/0040.jpeg"))
	titleAnim[41] = Bitmap.new(Texture.new("Image/TitleAnim/0041.jpeg"))
	titleAnim[42] = Bitmap.new(Texture.new("Image/TitleAnim/0042.jpeg"))
	titleAnim[43] = Bitmap.new(Texture.new("Image/TitleAnim/0043.jpeg"))
	titleAnim[44] = Bitmap.new(Texture.new("Image/TitleAnim/0044.jpeg"))
	titleAnim[45] = Bitmap.new(Texture.new("Image/TitleAnim/0045.jpeg"))
	titleAnim[46] = Bitmap.new(Texture.new("Image/TitleAnim/0046.jpeg"))
	titleAnim[47] = Bitmap.new(Texture.new("Image/TitleAnim/0047.jpeg"))
	titleAnim[48] = Bitmap.new(Texture.new("Image/TitleAnim/0048.jpeg"))
	titleAnim[49] = Bitmap.new(Texture.new("Image/TitleAnim/0049.jpeg"))
	titleAnim[50] = Bitmap.new(Texture.new("Image/TitleAnim/0050.jpeg"))
	titleAnim[51] = Bitmap.new(Texture.new("Image/TitleAnim/0051.jpeg"))
	titleAnim[52] = Bitmap.new(Texture.new("Image/TitleAnim/0052.jpeg"))
	titleAnim[53] = Bitmap.new(Texture.new("Image/TitleAnim/0053.jpeg"))
	titleAnim[54] = Bitmap.new(Texture.new("Image/TitleAnim/0054.jpeg"))
	titleAnim[55] = Bitmap.new(Texture.new("Image/TitleAnim/0055.jpeg"))
	titleAnim[56] = Bitmap.new(Texture.new("Image/TitleAnim/0056.jpeg"))
	titleAnim[57] = Bitmap.new(Texture.new("Image/TitleAnim/0057.jpeg"))
	titleAnim[58] = Bitmap.new(Texture.new("Image/TitleAnim/0058.jpeg"))
	titleAnim[59] = Bitmap.new(Texture.new("Image/TitleAnim/0059.jpeg"))
	titleAnim[60] = Bitmap.new(Texture.new("Image/TitleAnim/0060.jpeg"))
	titleAnim[61] = Bitmap.new(Texture.new("Image/TitleAnim/0061.jpeg"))
	titleAnim[62] = Bitmap.new(Texture.new("Image/TitleAnim/0062.jpeg"))
	titleAnim[63] = Bitmap.new(Texture.new("Image/TitleAnim/0063.jpeg"))
	titleAnim[64] = Bitmap.new(Texture.new("Image/TitleAnim/0064.jpeg"))
	titleAnim[65] = Bitmap.new(Texture.new("Image/TitleAnim/0065.jpeg"))
	titleAnim[66] = Bitmap.new(Texture.new("Image/TitleAnim/0066.jpeg"))
	titleAnim[67] = Bitmap.new(Texture.new("Image/TitleAnim/0067.jpeg"))
	titleAnim[68] = Bitmap.new(Texture.new("Image/TitleAnim/0068.jpeg"))
	titleAnim[69] = Bitmap.new(Texture.new("Image/TitleAnim/0069.jpeg"))
	titleAnim[70] = Bitmap.new(Texture.new("Image/TitleAnim/0070.jpeg"))
	titleAnim[71] = Bitmap.new(Texture.new("Image/TitleAnim/0071.jpeg"))
	titleAnim[72] = Bitmap.new(Texture.new("Image/TitleAnim/0072.jpeg"))
	titleAnim[73] = Bitmap.new(Texture.new("Image/TitleAnim/0073.jpeg"))
	titleAnim[74] = Bitmap.new(Texture.new("Image/TitleAnim/0074.jpeg"))
	titleAnim[75] = Bitmap.new(Texture.new("Image/TitleAnim/0075.jpeg"))
	titleAnim[76] = Bitmap.new(Texture.new("Image/TitleAnim/0076.jpeg"))
	titleAnim[77] = Bitmap.new(Texture.new("Image/TitleAnim/0077.jpeg"))
	titleAnim[78] = Bitmap.new(Texture.new("Image/TitleAnim/0078.jpeg"))
	titleAnim[79] = Bitmap.new(Texture.new("Image/TitleAnim/0079.jpeg"))
	titleAnim[80] = Bitmap.new(Texture.new("Image/TitleAnim/0080.jpeg"))
	titleAnim[81] = Bitmap.new(Texture.new("Image/TitleAnim/0081.jpeg"))
	titleAnim[82] = Bitmap.new(Texture.new("Image/TitleAnim/0082.jpeg"))
	titleAnim[83] = Bitmap.new(Texture.new("Image/TitleAnim/0083.jpeg"))
	titleAnim[84] = Bitmap.new(Texture.new("Image/TitleAnim/0084.jpeg"))
	titleAnim[85] = Bitmap.new(Texture.new("Image/TitleAnim/0085.jpeg"))
	titleAnim[86] = Bitmap.new(Texture.new("Image/TitleAnim/0086.jpeg"))
	titleAnim[87] = Bitmap.new(Texture.new("Image/TitleAnim/0087.jpeg"))
	titleAnim[88] = Bitmap.new(Texture.new("Image/TitleAnim/0088.jpeg"))
	titleAnim[89] = Bitmap.new(Texture.new("Image/TitleAnim/0089.jpeg"))
	titleAnim[90] = Bitmap.new(Texture.new("Image/TitleAnim/0090.jpeg"))
	titleAnim[91] = Bitmap.new(Texture.new("Image/TitleAnim/0091.jpeg"))
	titleAnim[92] = Bitmap.new(Texture.new("Image/TitleAnim/0092.jpeg"))
	titleAnim[93] = Bitmap.new(Texture.new("Image/TitleAnim/0093.jpeg"))
	titleAnim[94] = Bitmap.new(Texture.new("Image/TitleAnim/0094.jpeg"))
	titleAnim[95] = Bitmap.new(Texture.new("Image/TitleAnim/0095.jpeg"))
	titleAnim[96] = Bitmap.new(Texture.new("Image/TitleAnim/0096.jpeg"))
	titleAnim[97] = Bitmap.new(Texture.new("Image/TitleAnim/0097.jpeg"))
	titleAnim[98] = Bitmap.new(Texture.new("Image/TitleAnim/0098.jpeg"))
	titleAnim[99] = Bitmap.new(Texture.new("Image/TitleAnim/0099.jpeg"))
	titleAnim[100] = Bitmap.new(Texture.new("Image/TitleAnim/0100.jpeg"))
	titleAnim[101] = Bitmap.new(Texture.new("Image/TitleAnim/0101.jpeg"))
	titleAnim[102] = Bitmap.new(Texture.new("Image/TitleAnim/0102.jpeg"))
	titleAnim[103] = Bitmap.new(Texture.new("Image/TitleAnim/0103.jpeg"))
	titleAnim[104] = Bitmap.new(Texture.new("Image/TitleAnim/0104.jpeg"))
	titleAnim[105] = Bitmap.new(Texture.new("Image/TitleAnim/0105.jpeg"))
	titleAnim[106] = Bitmap.new(Texture.new("Image/TitleAnim/0106.jpeg"))
	titleAnim[107] = Bitmap.new(Texture.new("Image/TitleAnim/0107.jpeg"))
	titleAnim[108] = Bitmap.new(Texture.new("Image/TitleAnim/0108.jpeg"))
	titleAnim[109] = Bitmap.new(Texture.new("Image/TitleAnim/0109.jpeg"))
	titleAnim[110] = Bitmap.new(Texture.new("Image/TitleAnim/0110.jpeg"))
	titleAnim[111] = Bitmap.new(Texture.new("Image/TitleAnim/0111.jpeg"))
	titleAnim[112] = Bitmap.new(Texture.new("Image/TitleAnim/0112.jpeg"))
	titleAnim[113] = Bitmap.new(Texture.new("Image/TitleAnim/0113.jpeg"))
	titleAnim[114] = Bitmap.new(Texture.new("Image/TitleAnim/0114.jpeg"))
	titleAnim[115] = Bitmap.new(Texture.new("Image/TitleAnim/0115.jpeg"))
	titleAnim[116] = Bitmap.new(Texture.new("Image/TitleAnim/0116.jpeg"))
	titleAnim[117] = Bitmap.new(Texture.new("Image/TitleAnim/0117.jpeg"))
	titleAnim[118] = Bitmap.new(Texture.new("Image/TitleAnim/0118.jpeg"))
	titleAnim[119] = Bitmap.new(Texture.new("Image/TitleAnim/0119.jpeg"))
	
	titleAnimation = MovieClip.new{
	{1, 2, titleAnim[1]},
	{3, 4, titleAnim[2]},
	{5, 6, titleAnim[3]},
	{7, 8, titleAnim[4]},
	{9, 10, titleAnim[5]},
	{11, 12, titleAnim[6]},
	{13, 14, titleAnim[7]},
	{15, 16, titleAnim[8]},
	{17, 18, titleAnim[9]},
	{19, 20, titleAnim[10]},
	{21, 22, titleAnim[11]},
	{23, 24, titleAnim[12]},
	{25, 26, titleAnim[13]},
	{27, 28, titleAnim[14]},
	{29, 30, titleAnim[15]},
	{31, 32, titleAnim[16]},
	{33, 34, titleAnim[17]},
	{35, 36, titleAnim[18]},
	{37, 38, titleAnim[19]},
	{39, 40, titleAnim[20]},
	{41, 42, titleAnim[21]},
	{43, 44, titleAnim[22]},
	{45, 46, titleAnim[23]},
	{47, 48, titleAnim[24]},
	{49, 50, titleAnim[25]},
	{51, 52, titleAnim[26]},
	{53, 54, titleAnim[27]},
	{55, 56, titleAnim[28]},
	{57, 58, titleAnim[29]},
	{59, 60, titleAnim[30]},
	{61, 62, titleAnim[31]},
	{63, 64, titleAnim[32]},
	{65, 66, titleAnim[33]},
	{67, 68, titleAnim[34]},
	{69, 70, titleAnim[35]},
	{71, 72, titleAnim[36]},
	{73, 74, titleAnim[37]},
	{75, 76, titleAnim[38]},
	{77, 78, titleAnim[39]},
	{79, 80, titleAnim[40]},
	{81, 82, titleAnim[41]},
	{83, 84, titleAnim[42]},
	{85, 86, titleAnim[43]},
	{87, 88, titleAnim[44]},
	{89, 90, titleAnim[45]},
	{91, 92, titleAnim[46]},
	{93, 94, titleAnim[47]},
	{95, 96, titleAnim[48]},
	{97, 98, titleAnim[49]},
	{99, 100, titleAnim[50]},
	{101, 102, titleAnim[51]},
	{103, 104, titleAnim[52]},
	{105, 106, titleAnim[53]},
	{107, 108, titleAnim[54]},
	{109, 110, titleAnim[55]},
	{111, 112, titleAnim[56]},
	{113, 114, titleAnim[57]},
	{115, 116, titleAnim[58]},
	{117, 118, titleAnim[59]},
	{119, 120, titleAnim[60]},
	{121, 122, titleAnim[61]},
	{123, 124, titleAnim[62]},
	{125, 126, titleAnim[63]},
	{127, 128, titleAnim[64]},
	{129, 130, titleAnim[65]},
	{131, 132, titleAnim[66]},
	{133, 134, titleAnim[67]},
	{135, 136, titleAnim[68]},
	{137, 138, titleAnim[69]},	
	{139, 140, titleAnim[70]},
	{141, 142, titleAnim[71]},
	{143, 144, titleAnim[72]},
	{145, 146, titleAnim[73]},
	{147, 148, titleAnim[74]},
	{149, 150, titleAnim[75]},
	{151, 152, titleAnim[76]},
	{153, 154, titleAnim[77]},
	{155, 156, titleAnim[78]},
	{157, 158, titleAnim[79]},
	{159, 160, titleAnim[80]},
	{161, 162, titleAnim[81]},
	{163, 164, titleAnim[82]},
	{165, 166, titleAnim[83]},
	{167, 168, titleAnim[84]},
	{169, 170, titleAnim[85]},
	{171, 172, titleAnim[86]},
	{173, 174, titleAnim[87]},
	{175, 176, titleAnim[88]},
	{177, 178, titleAnim[89]},
	{179, 180, titleAnim[90]},
	{181, 182, titleAnim[91]},
	{183, 184, titleAnim[92]},
	{185, 186, titleAnim[93]},
	{187, 188, titleAnim[94]},
	{189, 190, titleAnim[95]},
	{191, 192, titleAnim[96]},
	{193, 194, titleAnim[97]},
	{195, 196, titleAnim[98]},
	{197, 198, titleAnim[99]},
	{199, 200, titleAnim[100]},
	{201, 202, titleAnim[101]},
	{203, 204, titleAnim[102]},
	{205, 206, titleAnim[103]},
	{207, 208, titleAnim[104]},
	{209, 210, titleAnim[105]},
	{211, 212, titleAnim[106]},
	{213, 214, titleAnim[107]},
	{215, 216, titleAnim[108]},
	{217, 218, titleAnim[109]},
	{219, 220, titleAnim[110]},
	{221, 222, titleAnim[111]},
	{223, 224, titleAnim[112]},
	{225, 226, titleAnim[113]},
	{227, 228, titleAnim[114]},
	{229, 230, titleAnim[115]},
	{231, 232, titleAnim[116]},
	{233, 234, titleAnim[117]},
	{235, 236, titleAnim[118]},
	{237, 238, titleAnim[119]},
	
	}
	
	textBackground = Bitmap.new(Texture.new("Image/TextBackground.png"))
	textBackground:setPosition(0,550)
	
end

-- Adding scene manager
sceneManager = SceneManager.new({
	["homeScene"] = HomeScene,
	["nameSelectionScene"] = NameSelectionScene,
	["difficultySelectScene"] = DifficultySelectScene,
	["scanTypeSelectScene"] = ScanTypeSelectScene,
	["receptionScene1"] = ReceptionScene1,
	["receptionScene2"] = ReceptionScene2,
	["receptionScene3"] = ReceptionScene3,
	["injectionRoomScene1"] = InjectionRoomScene1,
	["injectionRoomScene2"] = InjectionRoomScene2,
	["injectionRoomScene3"] = InjectionRoomScene3,
	["injectionRoomScene4"] = InjectionRoomScene4,
	["waitingRoomScene1"] = WaitingRoomScene1,
	["waitingRoomScene2"] = WaitingRoomScene2,
	["scanningRoomScene1"] = ScanningRoomScene1,
	["scanningRoomScene2"] = ScanningRoomScene2,
	["bedroomScene1"] = BedroomScene1,
	["bedroomScene2"] = BedroomScene2,
	["endingScene"] = EndingScene,
})

AssetSetup()

-- Adding sound
local gametune = Sound.new("Assets/Song For Someone.mp3")
gametune:play(0, true)

transitionSound = Sound.new("Assets/pageflip.mp3")
clickSound = Sound.new("Assets/keystroke.mp3")
scanSound = Sound.new("Assets/scanner.mp3")

stage:addChild(sceneManager)

-- Adding global buttons
local button_home_default = Bitmap.new(Texture.new("Image/HomeButtonUp.png"))
local button_home_pushed = Bitmap.new(Texture.new("Image/HomeButtonDown.png"))
local button_textBack_default = Bitmap.new(Texture.new("Image/textButtonUp.jpg"))
local button_textBack_pushed = Bitmap.new(Texture.new("Image/textBackDown.jpg"))

local buttonHome = Button.new(button_home_default, button_home_pushed)
buttonHome:setScale(4)
buttonHome:setPosition(1120,40)
stage:addChild(buttonHome)

buttonTextBack = Button.new(button_textBack_default, button_textBack_pushed)
buttonTextBack:setScale(1.5)
buttonTextBack:setPosition(25,580)
stage:addChild(buttonTextBack)
buttonTextBack:setVisible(false)

-- Adding event listeners
buttonHome:addEventListener("click", 
    function()  
		clickSound:play()
		sceneManager:changeScene("homeScene", 1, SceneManager.moveFromLeft, easing.outBounce, { eventFilter={Event.MOUSE_DOWN} } ) 
		buttonTextBack:setVisible(false)
   end
)

counter = 0

-- Adding event listeners
buttonTextBack:addEventListener("click", 
    function() 
		if (buttonTextBack:isVisible()) then
			if(counter >1) then
				counter = counter - 2
			elseif(counter == 1) then
				counter = 0
			end
		end
	end
)

sceneManager:changeScene("homeScene")
