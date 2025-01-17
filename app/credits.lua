-----------------------------------------------------------------------------------------
--
-- credits.lua
--
-----------------------------------------------------------------------------------------



-- Importing foreign scripts
local composer = require( "composer" )
local widget = require "widget"
local scene = composer.newScene()


-- creditsMusic = audio.loadSound("audio/music/basic music.mp3")

function scene:create( event )
	local sceneGroup = self.view

	--Background Implementation
	local creditsBackground = display.newImageRect("artwork/menu items/credits.bmp", SCRW, SCRH)
	creditsBackground.anchorX, creditsBackground.anchorY = 0, 0
	creditsBackground.x, creditsBackground.y = SCRORIX, SCRORIY
	sceneGroup:insert(creditsBackground)

end



function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene's view does not exist.
		-- 
		-- INSERT code here to initialize the scene
		-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.


		menuBtn = widget.newButton(
			{
				width = SCRW/10, 
				height = SCRH/8,
				defaultFile = "artwork/menu items/menu vertical button.bmp",
				overFile = "artwork/menu items/menu vertical button over.bmp",
				onEvent = function(event)
					if (event.phase == "ended") then
						composer.gotoScene( "mainmenu", "slideLeft", 700 )
					end
				end
			}
		)
		menuBtn.anchorX, menuBtn.anchorY = 1, 0.5
		menuBtn.x,menuBtn.y = SCRORIX + SCRW, SCRORIY + SCRH/2
		sceneGroup:insert(menuBtn)


	-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		-- men:tick()

		-- Progresses to stage 1 as soon as game is started

	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		audio.play(menuTransition)
		
	elseif phase == "did" then
			-- Called when the scene is now off screen
			-- physics.pause()

		if menuBtn then
			menuBtn:removeSelf()	-- widgets must be manually removed
			menuBtn = nil
		end
	end	
end


function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view

end


---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene