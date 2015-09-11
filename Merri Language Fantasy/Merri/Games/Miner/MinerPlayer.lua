MinerPlayer = Core.class()

function MinerPlayer:init( options )
	local contentPath = "Content/Graphics/Characters/"
	
	self.textures = {
		south1 = {
				base = Texture.new( contentPath .. "base/base" .. GLOBAL_CONFIG.BASE .. "_down1.png" ),
				hair = Texture.new( contentPath .. "hair/hair" .. GLOBAL_CONFIG.HAIR .. "_down1.png" ),
				face = Texture.new( contentPath .. "face/face" .. GLOBAL_CONFIG.FACE .. "_down1.png" ),
				outfit = Texture.new( contentPath .. "clothes/outfit" .. GLOBAL_CONFIG.OUTFIT .. "_down1.png" ),
			},
		south2 = {
				base = Texture.new( contentPath .. "base/base" .. GLOBAL_CONFIG.BASE .. "_down2.png" ),
				hair = Texture.new( contentPath .. "hair/hair" .. GLOBAL_CONFIG.HAIR .. "_down2.png" ),
				face = Texture.new( contentPath .. "face/face" .. GLOBAL_CONFIG.FACE .. "_down2.png" ),
				outfit = Texture.new( contentPath .. "clothes/outfit" .. GLOBAL_CONFIG.OUTFIT .. "_down2.png" ),
			},
			
		north1 = {
				base = Texture.new( contentPath .. "base/base" .. GLOBAL_CONFIG.BASE .. "_up1.png" ),
				hair = Texture.new( contentPath .. "hair/hair" .. GLOBAL_CONFIG.HAIR .. "_up1.png" ),
				face = Texture.new( contentPath .. "face/face" .. GLOBAL_CONFIG.FACE .. "_up1.png" ),
				outfit = Texture.new( contentPath .. "clothes/outfit" .. GLOBAL_CONFIG.OUTFIT .. "_up1.png" ),
			},
		north2 = {
				base = Texture.new( contentPath .. "base/base" .. GLOBAL_CONFIG.BASE .. "_up2.png" ),
				hair = Texture.new( contentPath .. "hair/hair" .. GLOBAL_CONFIG.HAIR .. "_up2.png" ),
				face = Texture.new( contentPath .. "face/face" .. GLOBAL_CONFIG.FACE .. "_up2.png" ),
				outfit = Texture.new( contentPath .. "clothes/outfit" .. GLOBAL_CONFIG.OUTFIT .. "_up2.png" ),
			},
			
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
			
		east1 = {
				base = Texture.new( contentPath .. "base/base" .. GLOBAL_CONFIG.BASE .. "_right1.png" ),
				hair = Texture.new( contentPath .. "hair/hair" .. GLOBAL_CONFIG.HAIR .. "_right1.png" ),
				face = Texture.new( contentPath .. "face/face" .. GLOBAL_CONFIG.FACE .. "_right1.png" ),
				outfit = Texture.new( contentPath .. "clothes/outfit" .. GLOBAL_CONFIG.OUTFIT .. "_right1.png" ),
			},
		east2 = {
				base = Texture.new( contentPath .. "base/base" .. GLOBAL_CONFIG.BASE .. "_right2.png" ),
				hair = Texture.new( contentPath .. "hair/hair" .. GLOBAL_CONFIG.HAIR .. "_right2.png" ),
				face = Texture.new( contentPath .. "face/face" .. GLOBAL_CONFIG.FACE .. "_right2.png" ),
				outfit = Texture.new( contentPath .. "clothes/outfit" .. GLOBAL_CONFIG.OUTFIT .. "_right2.png" ),
			},
		}
		
	self.bitmaps = {
		base = Bitmap.new( self.textures.south1.base ),
		hair = Bitmap.new( self.textures.south1.hair ),
		face = Bitmap.new( self.textures.south1.face ),
		outfit = Bitmap.new( self.textures.south1.outfit ),
		}
		
	print( GLOBAL_CONFIG.HAIR_R, GLOBAL_CONFIG.HAIR_G, GLOBAL_CONFIG.HAIR_B, GLOBAL_CONFIG.HAIR_A )
	self.bitmaps.hair:setColorTransform( GLOBAL_CONFIG.HAIR_R, GLOBAL_CONFIG.HAIR_G, GLOBAL_CONFIG.HAIR_B, GLOBAL_CONFIG.HAIR_A )
	
	self.moveAmount = options.moveAmount
	self.frame = 1
	self.direction = "south"
	self.health = 3
	
	self.label = TextField.new( MinerGameState.fonts.overhead, GLOBAL_CONFIG.NAME )
	self.label:setTextColor( 0xFFFFFF )
	
	MinerPlayer.hp = options.hp
	self.alive = true
	self.maxHp = 4
	self.exp = 0
	self.level = 1
	self.hurtCooldown = 0
end

function MinerPlayer:Draw()
	stage:addChild( self.bitmaps.base )
	stage:addChild( self.bitmaps.face )
	stage:addChild( self.bitmaps.hair )
	stage:addChild( self.bitmaps.outfit )
	stage:addChild( self.label )
end

function MinerPlayer:UpdateSprite()
	local frame = math.floor( self.frame )
	self.bitmaps.base:setTexture( self.textures[ self.direction .. frame ].base )
	self.bitmaps.hair:setTexture( self.textures[ self.direction .. frame ].hair )
	self.bitmaps.face:setTexture( self.textures[ self.direction .. frame ].face )
	self.bitmaps.outfit:setTexture( self.textures[ self.direction .. frame ].outfit )
end

function MinerPlayer:Face( direction )
	self.direction = direction
end

function MinerPlayer:Die( tileWidth )
	local x, y = self:getPosition()
	self.bitmap:setRotation( 180 )
	self.bitmap:setPosition( x + tileWidth, y + tileWidth )
	self.alive = false
end

function MinerPlayer:AddHealth( amount )
	MinerPlayer.hp = MinerPlayer.hp + amount
	if ( MinerPlayer.hp > self.maxHp ) then		MinerPlayer.hp = self.maxHp 	end
end

function MinerPlayer:GetHurt()
	if ( self.hurtCooldown == 0 ) then
		self.hurtCooldown = 3
		MinerPlayer.hp = MinerPlayer.hp - 1
		self.bitmap:setColorTransform( 1, 0, 0, 1 )
	end
end

function MinerPlayer:GetHealth()
	return MinerPlayer.hp
end

function MinerPlayer:TurnBasedUpdate()
	if ( self.hurtCooldown > 0 ) then
		self.hurtCooldown = self.hurtCooldown - 1
		local r, g, b, a = self.bitmap:getColorTransform()
		
	
		if ( self.hurtCooldown == 1 ) then
			self.bitmap:setColorTransform( 1, 1, 1, 1 )
		else
			g = g + 0.2
			b = b + 0.2
			self.bitmap:setColorTransform( 1, g, b, 1 )
		end
	end
end

function MinerPlayer:Move( direction, amount )
	local x, y = self:getPosition()
	self:Face( direction )
	
	if ( direction == "south" ) then 		y = y + self.moveAmount		end
	if ( direction == "north" ) then 		y = y - self.moveAmount		end
	if ( direction == "east" ) then 		x = x + self.moveAmount		end
	if ( direction == "west" ) then 		x = x - self.moveAmount		end
	
	self:setPosition( x, y )
end

function MinerPlayer:setPosition( x, y )
	for key, bitmap in pairs( self.bitmaps ) do
		bitmap:setPosition( x, y )
	end
	
	self.label:setPosition( x, y )
end

function MinerPlayer:getPosition()
	return self.bitmaps.base:getPosition()
end

function MinerPlayer:Update()
	if ( self.alive ) then
		self.frame = self.frame + 0.05
		if ( self.frame >= 3 ) then
			self.frame = 1
		end
		local fr = math.floor( self.frame )
		
		self:UpdateSprite()
	end
end