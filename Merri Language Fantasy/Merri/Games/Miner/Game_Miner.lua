GameMinerState = Core.class( StateBase )

function GameMinerState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = false } )
end

-- Setup / Teardown --
function GameMinerState:Setup( options )
	self.enableLighting = true
	StateBase:SetGotoState( "" )
	
	-- Setup UI
	StateBase:SetBackground( { id = "background", 		path = "Content/Games/Miner/UI/miner_background.png",  pos_x = 0, pos_y = 0 } )
	
	self.textures = {
			black = Texture.new( "Content/Graphics/UI/blank_background.png" ),
			
			hud_south = Texture.new( "Content/Games/Miner/UI/hud_down.png" ),
			hud_west = Texture.new( "Content/Games/Miner/UI/hud_left.png" ),
			hud_east = Texture.new( "Content/Games/Miner/UI/hud_right.png" ),
			hud_north = Texture.new( "Content/Games/Miner/UI/hud_up.png" ),
			
			hud_pick = Texture.new( "Content/Games/Miner/UI/hud_pick.png" ),
			hud_sword = Texture.new( "Content/Games/Miner/UI/hud_sword.png" ),
		}
	
	self.sounds = {
		mining = Sound.new( "Content/Audio/mining.wav" ),
		collect = Sound.new( "Content/Audio/collect.wav" ),
		footsteps = Sound.new( "Content/Audio/footsteps.wav" ),
		hurt = Sound.new( "Content/Audio/hurt.wav" ),
		sword = Sound.new( "Content/Audio/sword.wav" ),
	}
	
	GameMinerState.fonts = {
		overhead = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 9 ),
		hud = TTFont.new( "Content/Fonts/NotoSans-Bold.ttf", 14 ),
	}
	
	-- Fade out graphic
	self.fadeCounter = 0
	self.transition = false
	self.fadeBitmap = Bitmap.new( self.textures.black )
	self.fadeBitmap:setAlpha( 0 )
	
	-- Set up map
	self.map = MinerMap.new()
	self.map:Generate()
	--GetPlayerCoordinates	
	-- Create player control buttons
	self.hud = {
		topButton = {
			action = "move",
			direction = "north",
			bitmap = Bitmap.new( self.textures.hud_north ),
			xOffset = 0,
			yOffset = -36,
		},
		bottomButton = {
			action = "move",
			direction = "south",
			bitmap = Bitmap.new( self.textures.hud_south ),
			xOffset = 0,
			yOffset = 36,
		},
		leftButton = {
			action = "move",
			direction = "west",
			bitmap = Bitmap.new( self.textures.hud_west ),
			xOffset = -36,
			yOffset = 0,
		},
		rightButton = {
			action = "move",
			direction = "east",
			bitmap = Bitmap.new( self.textures.hud_east ),
			xOffset = 36,
			yOffset = 0,
		},
	}
	
	self.points = 0
	
	self:SetupHud()
	self:Draw()
end

function GameMinerState:SetupHud()
	self.hud.topButton.action,
	self.hud.bottomButton.action,
	self.hud.leftButton.action,
	self.hud.rightButton.action = self.map:GetHudActions()
	
	local x, y = self.map:GetPlayerCoordinates()
	for key, button in pairs( self.hud ) do
		-- Update Position
		button.bitmap:setPosition( x + button.xOffset, y + button.yOffset )
		
		-- Update actions
		button.bitmap:setAlpha( 1 )
		if ( button.action == "move" ) then
			button.bitmap:setTexture( self.textures[ "hud_" .. button.direction ] )
		
		elseif ( button.action == "mine" ) then
			button.bitmap:setTexture( self.textures.hud_pick )
		
		elseif ( button.action == "attack" ) then
			button.bitmap:setTexture( self.textures.hud_sword )
		
		else -- none
			button.bitmap:setAlpha( 0 )
		end
	end
end

function GameMinerState:Cleanup()
end

function GameMinerState:Draw()
	StateBase:Draw()
	self.map:Draw()
	
	for key, button in pairs( self.hud ) do 
		stage:addChild( button.bitmap )
	end
	
	if ( stage:contains( self.fadeBitmap ) ) then
		stage:addChild( self.fadeBitmap )
	end
end

function GameMinerState:SetupMap()
end

function GameMinerState:Update()
end

-- Callbacks --
function GameMinerState:Handle_AndroidKey( event )
end

function GameMinerState:InputAction( action, direction )
	local points = 0
	local itemType = ""
	
	if ( action == "move" ) then
		points, itemType = self.map:MovePlayer( direction, self.map.tileWidth )
	
	elseif ( action == "mine" ) then
		self.map:UsePick( direction )
		self.sounds.mining:play()
	
	elseif ( action == "attack" ) then
		self.map:UseSword( direction )
		self.sounds.sword:play()
		
	end
	
	self.points = self.points + points
	print( self.points )
	if ( points > 0 ) then
		self.sounds.collect:play()
	elseif ( itemType == "sandwich" ) then
		-- eat sound effect
	elseif ( itemType == "ladder" ) then
		self.sounds.footsteps:play()
		self.fadeCounter = 100
		self.transition = true
		stage:addChild( self.fadeBitmap )
		self.fadeBitmap:setAlpha( 0 )
	end
	
	self:SetupHud()
end

function GameMinerState:Handle_KeyDown( event )
	local action, direction

	if ( event.keyCode == KeyCode.W or event.keyCode == KeyCode.UP ) then
		action = self.hud.topButton.action
		direction = self.hud.topButton.direction
		
	elseif ( event.keyCode == KeyCode.S or event.keyCode == KeyCode.DOWN ) then
		action = self.hud.bottomButton.action
		direction = self.hud.bottomButton.direction
	
	elseif ( event.keyCode == KeyCode.A or event.keyCode == KeyCode.LEFT ) then
		action = self.hud.leftButton.action
		direction = self.hud.leftButton.direction
	
	elseif ( event.keyCode == KeyCode.D or event.keyCode == KeyCode.RIGHT ) then
		action = self.hud.rightButton.action
		direction = self.hud.rightButton.direction
	
	end
	
	self:InputAction( action, direction )
end

function GameMinerState:Handle_MouseDown( event )
	-- Hud buttons could be to move or mine or attack
	for key, button in pairs( self.hud ) do
		if ( button.bitmap:hitTestPoint( event.x, event.y ) ) then
			self:InputAction( button.action, button.direction )			
		end
	end
end

function GameMinerState:TurnBasedUpdate()

end

function GameMinerState:GetDistance( x1, y1, x2, y2 )
	local xd = x1 - x2
	local yd = y1 - y2
	return math.sqrt( xd * xd + yd * yd )
end

function GameMinerState:Handle_EnterFrame( event )
	if ( self.transition ) then
		self.fadeCounter = self.fadeCounter - 1
		
		-- Fade out
		if ( self.fadeCounter > 50 ) then
			self.fadeBitmap:setAlpha( self.fadeBitmap:getAlpha() + 0.05 )
		
		-- Change
		elseif ( self.fadeCounter == 50 ) then
			self.map:GoDownstairs()
			self:Draw()
		
		-- Fade in
		elseif ( self.fadeCounter > 0 ) then
			self.fadeBitmap:setAlpha( self.fadeBitmap:getAlpha() - 0.05 )
		
		-- Done
		else
			self.transition = false
			stage:removeChild( self.fadeBitmap )
			self:SetupHud()
		
		end	
	end

	self.map:Handle_EnterFrame( frame )
end

function GameMinerState:ClearScreen()
	StateBase:ClearScreen()	
end

function GameMinerState:ClearWidgets()
	StateBase:ClearWidgets()
end

function GameMinerState:GotoState()
	return StateBase:GotoState()
end