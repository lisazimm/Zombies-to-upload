local physics = require( "physics" )


local screenWidth = display.contentWidth
local screenHeight = display.contentHeight
local screenCenterX = display.contentCenterX
local screenCenterY = display.contentCenterY

--print( "Grid: " .. screedWidth .. " x " .. screenHeight ) 
local background = display.newRect( 0, 0, screenWidth, screenHeight ) -- sky
background:setFillColor(0,0,1,.5) -- dark blue
background.x = display.contentWidth/2 --screenCenterX -- center background
background.y = screenCenterY -- center background

local locationHandler = function( event ) 
    -- Check for error (user may have turned off Location Services)
    if event.errorCode then
        native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
        print( "Location error: " .. tostring( event.errorMessage ) )
    else
        local latitudeText = string.format( '%.4f', event.latitude )
        currentLatitude = latitudeText
        latitude:setText( latitudeText )

        local longitudeText = string.format( '%.4f', event.longitude )
        currentLongitude = longitudeText
        longitude:setText( longitudeText )

        local altitudeText = string.format( '%.3f', event.altitude )
        altitude:setText( altitudeText )

        local accuracyText = string.format( '%.3f', event.accuracy )
        accuracy:setText( accuracyText )

        local speedText = string.format( '%.3f', event.speed )
        speed:setText( speedText )

        local directionText = string.format( '%.3f', event.direction )
        direction:setText( directionText )

        -- Note: event.time is a Unix-style timestamp, expressed in seconds since Jan. 1, 1970
        local timeText = string.format( '%.0f', event.time )
        time:setText( timeText )
    end
end

-- Activate location listener
Runtime:addEventListener( "location", locationHandler )

local locationHandler = function( event ) 
    -- Check for error (user may have turned off Location Services)
    if event.errorCode then
        native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
        print( "Location error: " .. tostring( event.errorMessage ) )
    else
        local latitudeText = string.format( '%.4f', event.latitude )
        currentLatitude = latitudeText
        latitude:setText( latitudeText )

        local longitudeText = string.format( '%.4f', event.longitude )
        currentLongitude = longitudeText
        longitude:setText( longitudeText )

        local altitudeText = string.format( '%.3f', event.altitude )
        altitude:setText( altitudeText )

        local accuracyText = string.format( '%.3f', event.accuracy )
        accuracy:setText( accuracyText )

        local speedText = string.format( '%.3f', event.speed )
        speed:setText( speedText )

        local directionText = string.format( '%.3f', event.direction )
        direction:setText( directionText )

        -- Note: event.time is a Unix-style timestamp, expressed in seconds since Jan. 1, 1970
        local timeText = string.format( '%.0f', event.time )
        time:setText( timeText )
    end
end

-- Activate location listener
Runtime:addEventListener( "location", locationHandler )

local imageSheet = "zombieSprite.png"

local options =
{
    --required parameters
    width = 360,
    height = 306.5,
    numFrames = 2,

    --optional parameters; used for dynamic resolution support
    sheetContentWidth = 720,  -- width of original 1x size of entire sheet
    sheetContentHeight = 613  -- height of original 1x size of entire sheet
}

local imageSheet = graphics.newImageSheet( "zombieSprite.png", options, display.contentCenterX/2, display.contentCenterY/3 )


local sequenceData =
{
    name="walking",
    start=1,
    count=2,
    time=100,
    loopCount = 0,   -- Optional ; default is 0 (loop indefinitely)
    loopDirection = "bounce"    -- Optional ; values include "forward" or "bounce"
}

physics.start ()

local character= display.newSprite( imageSheet, sequenceData )

local redZombie = "redZombie1.png"
--physics.addBody( redZombie, { density=3.0, friction=0.5, bounce=0.3 } )

--local blackZombie = "blackZombie1.png"
local blueZombie = "blueZombie1.png"
--physics.addBody( blueZombie, { density=3.0, friction=0.5, bounce=0.3 } )
--local greyZombie = "greyZombie1.png"





myZombies = {} -- code obtained from LeMasters tutorial online and lesson in class
local function zombieValueXY (zombieValueX,zombieValueY)
	local arrayPosition = (zombieValueY*screenWidth) + zombieValueX 
	return arrayPosition
end 


local myZombieColumns = 6 -- Zombies columns and rows
local myZombieRows = 6
local myTotalZombies = {1,36}
local startX=-50--display.contentCenterX /2
local startY=-10 --display.contentCenterY *.2 

-- Zombies will randomly be filled with different colors. All will be lit up at first. 
-- some Zombies fade and then all lights are off (around 10 seconds after launching)
-- lights come back on and blink, fading in and out depending on the x,y coordinates assigned to transition
-- to a blink or fade effect below. When they light back up, most come in a different color
--it takes about 15 seconds for the ripple effect to start 

for j=1,6 do
	for k=1,4 do 
		local z = zombieValueXY(j,k)
		myZombies[z] = display.newImage(startX+j*150,startY+k*150) --if j*k > 100, myZombies[z] = true, then  
			  	for j=1,1 do 
			 		for k=1,6 do 
			 			myZombies[z] = display.newImage(blueZombie, startX+j*150,startY+k*150,10,10)
			 			end
			 		end
			 			for j=2,2 do 
			 		for k=1,6 do 
			 			myZombies[z] = display.newImage(redZombie, startX+j*150,startY+k*150,10,10)
			 			end
			 		end
			 			for j=3,3 do 
			 		for k=1,6 do 
			 			myZombies[z] = display.newImage(blueZombie, startX+j*150,startY+k*150,10,10)
			 			end
			 		end
			 				for j=4,4 do
			 				for k=1,6 do 
			 				myZombies[z] = display.newImage(redZombie, startX+j*150,startY+k*150,10,10)
			 		end
			 	end
			 end
			end

			---

			--[[ 	for j=5,9 do 
			 		for k=11,20 do 
			 			myZombies[z] = display.newImage(greyZombie, startX+j*150,startY+k*150,10,10)
			 				end
			 	end 
			 end
			end]]

			 	--[[for j=3,6 do 
			 		for k=8,11 do 
			 			myZombies[z] = display.newImage(blackZombie, startX+j*150,startY+k*150,10,10)
			 		end 
			 	end 
			 		for j=7,9 do 
			 			for k=12,14 do 
			 			myZombies[z] = display.newImage(redZombie, startX+j*150,startY+k*150,10,10)
			 		end 	
			 	end 
			 		for j=1,4 do 
			 			for k=15,18 do 
			 			myZombies[z] = display.newImage(blueZombie, startX+j*150,startY+k*150,10,10)
			 		end
			 	end 
		end
	end ]]

--]]
-- sprite info https://docs.coronalabs.com/api/library/display/newSprite.html

-- zombie idle alive source http://2.bp.blogspot.com/-X6IZhL5PMZg/TY_GUrF2meI/AAAAAAAAASg/tEA7nUhoziI/s1600/Zombie_1.jpg