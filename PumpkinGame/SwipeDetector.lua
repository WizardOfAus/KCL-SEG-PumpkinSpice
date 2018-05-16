-- This class enables swipe detection from four different directions

SwipeDetector = Core.class(Sprite)

-- Initializer
function SwipeDetector:init()
	self.swipeTime = 0
	local timer = Timer.new(100, math.huge)
	self.swipeTimer = timer
	timer:addEventListener(Event.TIMER, self.timeSwipe, self)

	self:addEventListener(Event.TOUCHES_BEGIN, self.touchesBegin, self)
	self:addEventListener(Event.TOUCHES_END, self.touchesEnd, self)
end

-- Function adds time to swipe
function SwipeDetector:timeSwipe()
	self.swipeTime = self.swipeTime + 100;
end

-- Function to register the start of a swipe
function SwipeDetector:touchesBegin(event)
	self.alreadySwiping = true
	self.activeTouchId = event.touch.id
	self.startX = event.touch.x
	self.startY = event.touch.y
	self.swipeTimer:start()
end

-- Function classifies the direction of the swipe
function SwipeDetector:touchesEnd(event)
	if(self.activeTouchId == event.touch.id) then
		self.swipeTimer:stop()
		self.swipeTime = 0
		self.alreadySwiping = false
		if(self.swipeTime <= 800) then
			local deltax = event.touch.x - self.startX
			local deltay = event.touch.y - self.startY						
			if (math.abs(deltax) > math.abs(deltay) and math.abs(deltax) > 5 and math.abs(deltay) > 5) then
				if (deltax > 0) then
					swipePosition = "right"
					print("Right Swipe")
				else
					swipePosition = "left"
					print("Left Swipe")
				end
			elseif (math.abs(deltax) > 5 and math.abs(deltay) > 5) then
				if (deltay > 0) then
					swipePosition = "down"
					print("Down Swipe")
				else
					swipePosition = "up"
					print("Up Swipe")
				end
			end				
		end
	end
end