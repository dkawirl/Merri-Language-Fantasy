function SetupEnglish()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Translators"         -- Header text: "Translators" for Translator credits section
    helper[ "website" ]                 = "Website:"            -- Label for homepage URL
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    
    -- GAME TITLE
    target[ "game title" ]              = "English Fantasy"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "Thank you for trying out Merri!"
    target[ "This is still a work in progress" ]                = "This is still a work in progress."
    target[ "There may be errors or bugs" ]                     = "There may be errors or bugs."
    target[ "Report problems at EMAIL" ]                        = "Report problems at Rachel@Moosader.com ."
    target[ "Want to keep up with this game's progress?" ]      = "Want to keep up with this game's progress?"
	
	helper[ "Version" ] = "Version"
        
    -- MAIN MENU BUTTONS
    helper[ "play" ]                    = "Play"                -- Button to begin the game
    helper[ "previous" ]                = "Previous"            -- Go backward one page (one menu)
    helper[ "next" ]                    = "Next"                -- Go forward one page (one menu)
    helper[ "options" ]                 = "Options"             -- Configure options in a game
    helper[ "help" ]                    = "Help"                -- Get help / instructions for a game or function
    helper[ "menu" ]                    = "Menu"                -- Open up sub-menu screen
    helper[ "close-menu" ]              = "Back"                -- Close sub-menu
    helper[ "progress" ]                = "Progress"            -- Progress / Statistics menu
    helper[ "save" ]                    = "Save"                -- Save changes
	helper[ "cancel" ]                  = "Cancel"


	helper[ "Continue playing" ] = "Continue playing"
	helper[ "Back to game select" ] = "Back to game select"
	helper[ "close menu" ] = "Close menu"
	helper[ "paused" ] = "Paused"
	
	helper[ "If you quit" ] = "If you quit, you will lose your progress."
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Practice"
    helper[ "Easy" ]      = "Easy"
    helper[ "Medium" ]    = "Medium"
    helper[ "Hard" ]      = "Hard"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "You acquired a star!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    -- GAMES
    helper[ "Miner" ] = "Miner"
    target[ "Miner" ] = helper[ "Miner" ]
    helper[ "Animal Battle" ] = "Animal Battle"
    target[ "Animal Battle" ] = helper[ "Animal Battle" ]
    
    -- CHARACTER CREATOR
    
    helper[ "Character Creator" ] = "Character Creator"
    helper[ "Name" ] = "Name:"
    helper[ "Hair" ] = "Hair style:"
    helper[ "Hair color" ] = "Hair color:"
    helper[ "Face" ] = "Face:"
    helper[ "Skin color" ] = "Skin color:"
    helper[ "Pronoun" ] = "Pronoun:"
    helper[ "Pronouns" ] = "Pronouns"
	helper[ "Enter a name" ] = "Enter a name"
	helper[ "Player name" ] = "Player name"
    
    -- Pronouns available in the English language
    target[ "pronouns" ] = {
            { pronoun = "he", type = "masculine" },
            { pronoun = "she", type = "feminine" },
            { pronoun = "they", type = "neutral" },
        }
        
    -- Used to describe other languages' pronouns
    helper[ "pronoun description masculine" ] = "Masculine"
    helper[ "pronoun description feminine" ] = "Feminine"
    helper[ "pronoun description neutral" ] = "Neutral"
    
    ----------------------------------
    -- ANIMAL BATTLE MINI-GAME TEXT --
    ----------------------------------
    
    target[ "Attack the cat" ] = "Attack the cat!"
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Miner"               -- Male miner (temporary)
    target[ "Floor" ]                   = "Floor:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Money:"              -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Health:"             -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Game Over"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Snail"
    target[ "mole" ]                    = "Mole"
    target[ "mushroom" ]                = "Mushroom"
    target[ "bat" ]                     = "Bat"
    target[ "rabbit" ]                  = "Rabbit"
    target[ "snake" ]                   = "Snake"
    target[ "skeleton" ]                = "Skeleton"
    target[ "moose" ]                   = "Moose"
    
    -- Items
    target[ "rock" ]                    = "Rock"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Star"
    target[ "sandwich" ]                = "Sandwich"
    target[ "amethyst" ]                = "Amethyst"
    target[ "sapphire" ]                = "Sapphire"
    target[ "diamond" ]                 = "Diamond"
    target[ "emerald" ]                 = "Emerald"
    target[ "ruby" ]                    = "Ruby"
    target[ "copper" ]                  = "Copper"              -- It is a copper coin
    target[ "silver" ]                  = "Silver"
    target[ "gold" ]                    = "Gold"
    target[ "ladder" ]                  = "Ladder"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "Do you want to buy a tool?"
    target[ "You don't have enough money" ]   = "You don't have enough money."
    
    -- Button options
    target[ "Don't buy anything" ]      = "Don't buy anything." -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Price:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Potion"              -- Restores health
    target[ "PotionDescription" ]       = "Restores all of your health."
    target[ "Earthquake" ]              = "Earthquake"
    target[ "EarthquakeDescription" ]   = "Breaks all rocks."
    target[ "Dynamite" ]                = "Dynamite"
    target[ "DynamiteDescription" ]     = "Descend down one floor."
    target[ "Rope" ]                    = "Rope"
    target[ "RopeDescription" ]         = "Climb up one floor."
    target[ "Blizzard" ]                = "Blizzard"
    target[ "BlizzardDescription" ]     = "Freeze all the enemies."
    
    -- Narration
    target[ "miner-begin" ]             = "Mine for treasure and stay alive!"
    target[ "miner-move-north" ]        = "You walk north."
    target[ "miner-move-south" ]        = "You walk south."
    target[ "miner-move-east" ]         = "You walk east."
    target[ "miner-move-west" ]         = "You walk west."
    target[ "miner-mine" ]              = "You swing your pick."
    target[ "miner-eat-sandwich" ]      = "You eat the cave sandwich."
    target[ "use-earthquake" ]          = "The earth shakes violently."
    target[ "use-blizzard" ]            = "Everything freezes over." 
    target[ "enemies-thaw" ]            = "Everything has thawed out."
    target[ "use-potion" ]              = "You feel strong again."
    target[ "miner-collect-copper" ]    = "You pick up copper."
    target[ "miner-collect-silver" ]    = "You pick up silver."
    target[ "miner-collect-gold" ]      = "You pick up gold."
    target[ "miner-collect-amethyst" ]  = "You pick up amethyst."
    target[ "miner-collect-sapphire" ]  = "You pick up sapphire."
    target[ "miner-collect-diamond" ]   = "You pick up diamond."
    target[ "miner-collect-emerald" ]   = "You pick up emerald."
    target[ "miner-collect-ruby" ]      = "You pick up ruby."
    target[ "miner-attack-snail" ]      = "You attack the snail."
    target[ "miner-attack-mole" ]       = "You attack the mole."
    target[ "miner-attack-mushroom" ]   = "You attack the mushroom."
    target[ "miner-attack-bat" ]        = "You attack the bat."
    target[ "miner-attack-rabbit" ]     = "You attack the rabbit."
    target[ "miner-attack-snake" ]      = "You attack the snake."
    target[ "miner-attack-moose" ]      = "You attack the moose."
    target[ "miner-attack-skeleton" ]   = "You attack the skeleton."
    target[ "miner-go-down-ladder" ]    = "You descend the ladder."
    target[ "miner-rope" ]              = "You flee upward by using the rope."
    target[ "miner-dynamite" ]          = "You flee downward by using the dynamite."
    target[ "miner-died" ]              = "You have been killed."
	
	-- Copies
	
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this	
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
	
	-- Ignore this block
    
	return helper, target    
end
