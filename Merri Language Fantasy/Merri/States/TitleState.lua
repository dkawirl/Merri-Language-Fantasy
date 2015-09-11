TitleState = Core.class( StateBase )

function TitleState:init( options )
	StateBase:init( options )
	StateBase:Setup( { backgroundScroll = true } )
end

-- Setup / Teardown --
function TitleState:Setup( options )
	StateBase:ToggleBackgroundScroll( true )
	StateBase:SetGotoState( "" )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	StateBase:AddButton( { 
		button = { id = "btn_play", 	path = "Content/Graphics/UI/btn_play.png",  	pos_x = 10, pos_y = 530  },
		label 	= { id = "btn_play", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 15, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "play" ) }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_options", 	path = "Content/Graphics/UI/btn_options.png",  	pos_x = 130, pos_y = 530  },
		label 	= { id = "btn_options", 	path = "Content/Fonts/NotoSans-Bold.ttf",   					pos_x = 135, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "options" ) }
		} )
		
	StateBase:AddButton( { 
		button = { id = "btn_help", 	path = "Content/Graphics/UI/btn_help.png",  	pos_x = 250, pos_y = 530  },
		label 	= { id = "btn_help", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 255, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "help" ) }
		} )
		
	print( GLOBAL_CONFIG.VERSION )
		
	StateBase:AddLabel( { id = "moosader", path = "Content/Fonts/NotoSans-Bold.ttf",		pos_x = 10, pos_y = 25, color = 0xFFFFFF, size = 13, text = "Moosader" } )
	StateBase:AddLabel( { id = "preview", 			path = "Content/Fonts/NotoSans-Bold.ttf",		pos_x = 100, pos_y = 25, color = 0xDAB9FF, size = 13, text = GameText:Get( "helper", "Version" ) .. ":" } )
	StateBase:AddLabel( { id = "version", 			path = "Content/Fonts/NotoSans-Bold.ttf",		pos_x = 170, pos_y = 25, color = 0xDAB9FF, size = 13, text = GLOBAL_VERSION } )
	
	StateBase:AddBitmap( { id = "title", 	path = "Content/Graphics/UI/title_text.png",  pos_x = GLOBAL_CONFIG.SCREEN_WIDTH/2 - 210/2, pos_y = 35 } )
	StateBase:AddLabel( { id = "title", 			path = "Content/Fonts/NotoSans-Bold.ttf",		pos_x = 10, pos_y = 140, color = 0xFFFFFF, size = 20, text = GameText:Get( "target", "game title" ), centered = true } )
	StateBase:AddBitmap( { id = "bg", 	path = "Content/Graphics/UI/bg_titlescene.png",  pos_x = 0, pos_y = 160 } )
	
	local contentPath = "Content/Graphics/Characters/"
	self.textures = {
	
		snail = Texture.new( "Content/Games/Miner/Characters/enemy_snail.png" ),
		
		west1 = {
				base = Texture.new( contentPath .. "base/base" .. GLOBAL_CONFIG.BASE .. "_left1.png" ),
				hair = Texture.new( contentPath .. "hair/hair" .. GLOBAL_CONFIG.HAIR .. "_left1.png" ),
				face = Texture.new( contentPath .. "face/face" .. GLOBAL_CONFIG.FACE .. "_left1.png" ),
				outfit = Texture.new( contentPath .. "clothes/outfit" .. GLOBAL_CONFIG.OUTFIT .. "_left1.png" ),
			},
		west2 = {
				base = Texture.new( contentPath .. "base/base" .. GLOBAL_CONFIG.BASE .. "_left2.png" ),
				hair = Texture.new( contentPath .. "hair/hair" .. GLOBAL_CONFIG.HAIR .. "_left2.png" ),
				face = Texture.new( contentPath .. "face/face" .. GLOBAL_CONFIG.FACE .. "_left2.png" ),
				outfit = Texture.new( contentPath .. "clothes/outfit" .. GLOBAL_CONFIG.OUTFIT .. "_left2.png" ),
			},
	}
	
	self.frame = 1
	
	self.players = {
		base = Bitmap.new( self.textures.west1.base ),
		hair = Bitmap.new( self.textures.west1.hair ),
		face = Bitmap.new( self.textures.west1.face ),
		outfit = Bitmap.new( self.textures.west1.outfit ),
		}
	
	for key, image in pairs( self.players ) do
		image:setPosition( 600, 325 )
		image:setScale( 4, 4 )
	end
	
	self.snail = Bitmap.new( self.textures.snail )
	self.snail:setScale( 4, 4 )
	self.snail:setPosition( 400, 300 )
	
	self.animationCounter = 0
		
	self:Draw()
end

function TitleState:Cleanup()
	for key, value in pairs( self.players ) do 
		if ( stage:contains( value ) ) then stage:addChild( value ) end
	end
	
	stage:removeChild( self.snail )
end

function TitleState:Draw()
	StateBase:Draw()
	
	stage:addChild( self.players.base )
	stage:addChild( self.players.face )
	stage:addChild( self.players.hair )
	stage:addChild( self.players.outfit )
	
	stage:addChild( self.snail )
end

-- Cyclical --
function TitleState:Update()
end

-- Callbacks --
function TitleState:Handle_AndroidKey( event )
end

function TitleState:Handle_KeyDown( event )
end

function TitleState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	
	if ( clickedButton == "btn_play" ) then 					
		StateBase:SetGotoState( "DifficultySelectState" )
			
	elseif ( clickedButton == "btn_help" ) then 
	
	elseif ( clickedButton == "btn_options" ) then
		StateBase:SetGotoState( "CharacterCreatorState" ) -- temp
	
	end
end

function TitleState:Handle_EnterFrame( event )
	StateBase:Update()
	self.animationCounter = self.animationCounter + 1
	
	local direction = "west"
	
	if ( self.animationCounter == 20 ) then
		self.frame = 2
	
	elseif ( self.animationCounter == 40 ) then
		self.animationCounter = 0
		self.frame = 1
		
	end
	
	self.players.base:setTexture( self.textures[ direction .. self.frame ].base )
	self.players.hair:setTexture( self.textures[ direction .. self.frame ].hair )
	self.players.face:setTexture( self.textures[ direction .. self.frame ].face )
	self.players.outfit:setTexture( self.textures[ direction .. self.frame ].outfit )
	
	local x, y = self.players.base:getPosition()
	x = x - 2
	if ( x < -200 ) then
		x = 600
	end
	
	for key, image in pairs( self.players ) do
		image:setPosition( x, y )
	end
	self.snail:setPosition( x - 200, y - 15 )
	
end

function TitleState:ClearScreen()
	StateBase:ClearScreen()	
end

function TitleState:ClearWidgets()
	StateBase:ClearWidgets()
end

function TitleState:GotoState()
	return StateBase:GotoState()
end