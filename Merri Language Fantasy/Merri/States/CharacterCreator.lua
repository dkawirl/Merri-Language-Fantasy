CharacterCreatorState = Core.class( StateBase )

function CharacterCreatorState:init( options )
	StateBase:init( options )
end

-- Setup / Teardown --
function CharacterCreatorState:Setup( options )
	StateBase:SetGotoState( "" )
	
	self.colorSets = {
			{ r = 1, g = 1, b = 1, a = 1 }, -- white
			{ r = 0.25, g = 0.25, b = 0.25, a = 1 }, -- black
			{ r = 1, g = 0, b = 0, a = 1 }, -- red
			{ r = 0, g = 1, b = 0, a = 1 }, -- green
			{ r = 0, g = 0, b = 1, a = 1 }, -- blue
			{ r = 1, g = 1, b = 0, a = 1 }, -- yellow
			{ r = 0, g = 1, b = 1, a = 1 }, -- cyan
			{ r = 1, g = 0, b = 1, a = 1 }, -- magenta
		}
		
	self.pronoun = ""
	self.baseCodeMin = 0
	self.baseCode = self.baseCodeMin
	self.baseCodeMax = 5
	
	self.faceCodeMin = 0
	self.faceCode = self.faceCodeMin
	self.faceCodeMax = 8
	
	self.hairCodeMin = 0
	self.hairCode = self.hairCodeMin
	self.hairCodeMax = 12
	
	self.hairColorCodeMin = 1
	self.hairColorCode = self.hairColorCodeMin
	self.hairColorCodeMax = #self.colorSets
	self.name = ""
	
	self:SetupAppearanceMenu()
end

function CharacterCreatorState:SetupAppearanceMenu()
	StateBase:ClearScreen()
	self:Cleanup()
	StateBase:Setup( { backgroundScroll = true } )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	self:SetupAppearanceMenuWidgets()
	
	self.bitmaps = {}
	
	local characterX = GLOBAL_CONFIG.SCREEN_WIDTH / 2 - 30
	local characterY = 50
	
	self.bitmaps.characterbg = Bitmap.new( Texture.new( "Content/Graphics/UI/bg_character.png" ) )
	self.bitmaps.characterbg:setPosition( characterX-8, characterY-7 )
	self.bitmaps.characterbg:setScale( 2 )
	
	self.bitmaps.base = Bitmap.new( Texture.new( "Content/Graphics/Characters/base/base" .. self.baseCode .. "_down1.png" ) )
	self.bitmaps.base:setScale( 2 )
	self.bitmaps.base:setPosition( characterX, characterY )
	
	self.bitmaps.hair = Bitmap.new( Texture.new( "Content/Graphics/Characters/hair/hair" .. self.hairCode .. "_down1.png" ) )
	self.bitmaps.hair:setColorTransform( self.colorSets[1].r, self.colorSets[1].g, self.colorSets[1].b, self.colorSets[1].a )
	self.bitmaps.hair:setScale( 2 )
	self.bitmaps.hair:setPosition( characterX, characterY )
	
	self.bitmaps.face = Bitmap.new( Texture.new( "Content/Graphics/Characters/face/face" .. self.faceCode .. "_down1.png" ) )
	self.bitmaps.face:setScale( 2 )
	self.bitmaps.face:setPosition( characterX, characterY )
	
	self.bitmaps.clothes = Bitmap.new( Texture.new( "Content/Graphics/Characters/clothes/outfit0_down1.png" ) )
	self.bitmaps.clothes:setScale( 2 )
	self.bitmaps.clothes:setPosition( characterX, characterY )
	
	self:Draw()
end

function CharacterCreatorState:SetupAppearanceMenuWidgets()
StateBase:AddLabel( { id = "header", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 25, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Character Creator" ), centered = true } )
	
	local x = 25
	local y = 160
	local inc = 65
	
	local nomo = self.name
	if ( nomo == "" ) then nomo = "Name" end
	StateBase:AddLabel( { id = "Name", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Name" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "name_text", 	path = "Content/Graphics/UI/bg_textfield.png",  	pos_x = x + 150, pos_y = y - 25  },
		label 	= { id = "name_text", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x + 155, pos_y = y+8, color = 0xFFFFFF, size = 20, text = nomo }
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "Hair", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Hair" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "hair_left", 	path = "Content/Graphics/UI/btn_scroll_left.png",  	pos_x = x + 150, pos_y = y - 25  },
		} )
		
	StateBase:AddLabel( { id = "label_hair", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x+230, pos_y = y+5, color = 0xFFFFFF, size = 25, text = self.hairCode + 1, centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "hair_right", 	path = "Content/Graphics/UI/btn_scroll_right.png",  	pos_x = x + 275, pos_y = y - 25  },
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "HairColor", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Hair color" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "haircolor_left", 	path = "Content/Graphics/UI/btn_scroll_left.png",  	pos_x = x + 150, pos_y = y - 25  },
		} )
		
	StateBase:AddLabel( { id = "label_haircolor", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x+230, pos_y = y+5, color = 0xFFFFFF, size = 25, text = self.hairColorCode, centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "haircolor_right", 	path = "Content/Graphics/UI/btn_scroll_right.png",  	pos_x = x + 275, pos_y = y - 25  },
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "Face", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Face" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "face_left", 	path = "Content/Graphics/UI/btn_scroll_left.png",  	pos_x = x + 150, pos_y = y - 25  },
		} )
		
	StateBase:AddLabel( { id = "label_face", 			path = "Content/Fonts/NotoSans-Bold.ttf",
		pos_x = x+230, pos_y = y+5, color = 0xFFFFFF, size = 25, text = self.faceCode + 1, centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "face_right", 	path = "Content/Graphics/UI/btn_scroll_right.png",  	pos_x = x + 275, pos_y = y - 25  },
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "SkinColor", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Skin color" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "skin_left", 	path = "Content/Graphics/UI/btn_scroll_left.png",  	pos_x = x + 150, pos_y = y - 25  },
		} )
		
	StateBase:AddLabel( { id = "label_skin", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x+230, pos_y = y+5, color = 0xFFFFFF, size = 25, text = self.baseCode + 1, centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "skin_right", 	path = "Content/Graphics/UI/btn_scroll_right.png",  	pos_x = x + 275, pos_y = y - 25  },
		} )
		
	y = y + inc
	StateBase:AddLabel( { id = "Pronoun", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = x, pos_y = y, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Pronoun" ), centered = false } )
		
	StateBase:AddButton( { 
		button = { id = "pronoun", 	path = "Content/Graphics/UI/bg_textfield.png",  	pos_x = x + 150, pos_y = y - 25  },
		label 	= { id = "pronoun", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = x + 155, pos_y = y+8, color = 0xFFFFFF, size = 20, text = self.pronoun }
		} )
	
		
	StateBase:AddButton( { 
		button = { id = "btn_save", 	path = "Content/Graphics/UI/btn_save.png",  	pos_x = 250, pos_y = 530  },
		label 	= { id = "btn_save", 	path = "Content/Fonts/NotoSans-Bold.ttf",   			pos_x = 255, pos_y = 530+95, color = 0xFFFFFF, size = 14, text = GameText:Get( "helper", "save" ) }
		} )
end

function CharacterCreatorState:SetupPronounMenu()
	StateBase:ClearScreen()
	self:Cleanup()
	StateBase:Setup( { backgroundScroll = true } )
	StateBase:SetBackground( { id = "background", 		path = "Content/Graphics/UI/generalbgtile.png",  pos_x = 0, pos_y = 0 } )
	
	StateBase:AddLabel( { id = "header", 			path = "Content/Fonts/NotoSans-Bold.ttf",		
		pos_x = 0, pos_y = 25, color = 0xFFFFFF, size = 20, text = GameText:Get( "helper", "Pronouns" ), centered = true } )
		
	local x = 36
	local y = 175
	local inc = 100
	
	self.pronounList = GameText:GetPronouns()
	
	for key, pronoun in pairs( self.pronounList ) do
		StateBase:AddButton( { 
			button = { id = "btn_" .. pronoun.pronoun, 	path = "Content/Graphics/UI/btn_pronoun.png",  	pos_x = x, pos_y = y },
			label 	= { id = "btn_" .. pronoun.pronoun, 	path = "Content/Fonts/NotoSans-Bold.ttf",   			
				pos_x = x + 10, pos_y = y + 25, color = 0xFFFFFF, size = 20, text = pronoun.pronoun }
			} )
		StateBase:AddLabel( { id = "desc_" .. pronoun.pronoun, 			path = "Content/Fonts/NotoSans-Bold.ttf",		
			pos_x = x+10, pos_y = y+50, color = 0xFFFFFF, size = 15, text = pronoun.description, centered = false } )
			
		y = y + inc
	end
	
	self:Draw()
end

function CharacterCreatorState:UpdateSprite()
	self.bitmaps.hair:setColorTransform( self.colorSets[ self.hairColorCode ].r, self.colorSets[ self.hairColorCode ].g, self.colorSets[ self.hairColorCode ].b, self.colorSets[ self.hairColorCode ].a )
	self.bitmaps.hair:setTexture( Texture.new( "Content/Graphics/Characters/hair/hair" .. self.hairCode .. "_down1.png" ) )
	
	self.bitmaps.face:setTexture( Texture.new( "Content/Graphics/Characters/face/face" .. self.faceCode .. "_down1.png" ) )
	
	self.bitmaps.base:setColorTransform( 1, 1, 1, 1 )
	self.bitmaps.base:setTexture( Texture.new( "Content/Graphics/Characters/base/base" .. self.baseCode .. "_down1.png" ) )
	
	print( "Hair Color: ", self.bitmaps.hair:getColorTransform() )
	print( "Base Color: ", self.bitmaps.base:getColorTransform() )
end

function CharacterCreatorState:Cleanup()
	StateBase:ClearWidgets()
	
	if ( self.bitmaps.characterbg ~= nil and stage:contains( self.bitmaps.characterbg ) ) then stage:removeChild( self.bitmaps.characterbg ) end
	if ( self.bitmaps.base ~= nil and stage:contains( self.bitmaps.base ) ) then stage:removeChild( self.bitmaps.base ) end
	if ( self.bitmaps.face ~= nil and stage:contains( self.bitmaps.face ) ) then stage:removeChild( self.bitmaps.face ) end
	if ( self.bitmaps.hair ~= nil and stage:contains( self.bitmaps.hair ) ) then stage:removeChild( self.bitmaps.hair ) end
	if ( self.bitmaps.clothes ~= nil and stage:contains( self.bitmaps.clothes ) ) then stage:removeChild( self.bitmaps.clothes ) end
end

function CharacterCreatorState:Draw()
	StateBase:Draw()
	
	stage:addChild( self.bitmaps.characterbg )
	stage:addChild( self.bitmaps.base )
	stage:addChild( self.bitmaps.hair )
	stage:addChild( self.bitmaps.face )
	stage:addChild( self.bitmaps.clothes )
end

-- Callbacks --
function CharacterCreatorState:Handle_AndroidKey( event )
end

function CharacterCreatorState:Handle_KeyDown( event )
end

function CharacterCreatorState:GetNameDialogReturn( event )
	if event.buttonIndex == 1 then
		self.name = event.text
		StateBase:ChangeLabelText( { id = "name_text", text = event.text } )
	end
end

function CharacterCreatorState:Handle_MouseDown_Pronouns( event, clickedButton )
	local clickedPronoun = false
	for key, pronoun in pairs( self.pronounList ) do
		if ( clickedButton == "btn_" .. pronoun.pronoun ) then
			print( "Selected pronoun", pronoun.pronoun )
			self.pronoun = pronoun.pronoun
			clickedPronoun = true
		end
	end
	
	if ( clickedPronoun ) then
		self:SetupAppearanceMenu()
	end
end

function CharacterCreatorState:Handle_MouseDown_Appearance( event, clickedButton )
	if ( clickedButton == "name_text" ) then
		local textInputDialog = TextInputDialog.new( 
			GameText:Get( "helper", "Player name" ), 
			GameText:Get( "helper", "Enter a name" ), 
			"", 
			GameText:Get( "helper", "cancel" ), 
			GameText:Get( "helper", "save" ) )
			
		textInputDialog:addEventListener( Event.COMPLETE, CharacterCreatorState.GetNameDialogReturn, self )
		textInputDialog:show()
	
	elseif ( clickedButton == "pronoun" ) then
		self:SetupPronounMenu()
	
	-- HAIR
	elseif ( clickedButton == "hair_left" ) then
		self:ScrollHair( -1 )
	elseif ( clickedButton == "hair_right" ) then
		self:ScrollHair( 1 )
		
	-- HAIR COLOR
	elseif ( clickedButton == "haircolor_left" ) then
		self:ScrollHairColor( -1 )
	elseif ( clickedButton == "haircolor_right" ) then
		self:ScrollHairColor( 1 )

	-- FACE
	elseif ( clickedButton == "face_left" ) then
		self:ScrollFace(  -1 )
	elseif ( clickedButton == "face_right" ) then
		self:ScrollFace( 1 )
	
	-- SKIN
	elseif ( clickedButton == "skin_left" ) then
		self:ScrollBase( -1 )
	elseif ( clickedButton == "skin_right" ) then
		self:ScrollBase( 1 )

	elseif ( clickedButton == "btn_save" ) then
		if ( self.pronoun == "" or self.pronoun == nil ) then
		else
			GLOBAL_CONFIG.PRONOUN 	= self.pronoun
			GLOBAL_CONFIG.NAME 				= self.name
			GLOBAL_CONFIG.BASE	 			= self.baseCode
			GLOBAL_CONFIG.HAIR	 			= self.hairCode
			GLOBAL_CONFIG.HAIR_R			= self.colorSets[ self.hairColorCode ].r
			GLOBAL_CONFIG.HAIR_G			= self.colorSets[ self.hairColorCode ].g
			GLOBAL_CONFIG.HAIR_B			= self.colorSets[ self.hairColorCode ].b
			GLOBAL_CONFIG.HAIR_A			= self.colorSets[ self.hairColorCode ].a
			GLOBAL_CONFIG.FACE	 			= self.faceCode
			GLOBAL_CONFIG.OUTFIT 			= 0
			SAVE_CONFIG()			
			StateBase:SetGotoState( "TitleState" )
		end
	end
	
	self:UpdateSprite()
	
	StateBase:ChangeLabelText( { id = "label_skin", text = self.baseCode + 1 } )
	StateBase:ChangeLabelText( { id = "label_face", text = self.faceCode + 1 } )
	StateBase:ChangeLabelText( { id = "label_hair", text = self.hairCode + 1 } )
	StateBase:ChangeLabelText( { id = "label_haircolor", text = self.hairColorCode } )
end

function CharacterCreatorState:Handle_MouseDown( event )
	clickedButton = StateBase:ClickedButtonName( event )
	if ( self.pronounList ~= nil ) then
		self:Handle_MouseDown_Pronouns( event, clickedButton )
	end	
	
	self:Handle_MouseDown_Appearance( event, clickedButton )
end

function CharacterCreatorState:ScrollHair( amount )
		self.hairCode = self.hairCode + amount
		
		if ( self.hairCode > self.hairCodeMax ) then
			self.hairCode = self.hairCodeMin
		elseif ( self.hairCode < self.hairCodeMin ) then 
			self.hairCode = self.hairCodeMax			
		end
end
		
function CharacterCreatorState:ScrollBase( amount )
		self.baseCode = self.baseCode + amount
		
		if ( self.baseCode > self.baseCodeMax ) then
			self.baseCode = self.baseCodeMin
		elseif ( self.baseCode < self.baseCodeMin ) then 
			self.baseCode = self.baseCodeMax			
		end
end

function CharacterCreatorState:ScrollFace( amount )
		self.faceCode = self.faceCode + amount
		
		if ( self.faceCode > self.faceCodeMax ) then
			self.faceCode = self.faceCodeMin
		elseif ( self.faceCode < self.faceCodeMin ) then 
			self.faceCode = self.faceCodeMax			
		end
end

function CharacterCreatorState:ScrollHairColor( amount )
		self.hairColorCode = self.hairColorCode + amount
		
		if ( self.hairColorCode > self.hairColorCodeMax ) then
			self.hairColorCode = self.hairColorCodeMin
		elseif ( self.hairColorCode < self.hairColorCodeMin ) then 
			self.hairColorCode = self.hairColorCodeMax			
		end
end

function CharacterCreatorState:Handle_EnterFrame( event )
	StateBase:Update()
end

function CharacterCreatorState:ClearScreen()
	StateBase:ClearScreen()	
end

function CharacterCreatorState:ClearWidgets()
	StateBase:ClearWidgets()
end

function CharacterCreatorState:GotoState()
	return StateBase:GotoState()
end
