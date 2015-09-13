function SetupIthkuil()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = ""                    -- Header text: "Translators" for Translator credits section
    
    helper[ "website" ]                 = ":"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "Ithkaiwîl ubzál"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = ""
    target[ "This is still a work in progress" ]                = ""
    target[ "There may be errors or bugs" ]                     = ""
    target[ "Report problems at EMAIL" ]                        = ""
    target[ "Want to keep up with this game's progress?" ]      = ""
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "Ováweš"              -- Button to begin the game
    target[ "previous" ]                = "Rçawel"                    -- Go backward one page (one menu)
    target[ "next" ]                    = "Ultárunš"                    -- Go forward one page (one menu)
    target[ "options" ]                 = "Ênyar"             -- Configure options in a game
    target[ "help" ]                    = "Âdnan"                -- Get help / instructions for a game or function
    target[ "menu" ]                    = "Ênyarinš"                -- Open up sub-menu screen
    target[ "close-menu" ]              = "Rçarļ"                -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = ""                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Xháwîl"
    helper[ "Easy" ]      = "Xháwîlürt"
    helper[ "Medium" ]    = "Xháwîlart"
    helper[ "Hard" ]      = "Xháwîlert"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "Uk'awîr kî"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Qò rq'il ômrar"      -- Male miner (temporary)
    target[ "Floor" ]                   = "Mthal:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Îmsawur:"              -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Glawul:"             -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Upšákt"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Âļnal"
    target[ "mole" ]                    = "Çqhwal"
    target[ "mushroom" ]                = "Cnalek"
    target[ "bat" ]                     = "Ftçal"
    target[ "rabbit" ]                  = "Lxwal"
    target[ "snake" ]                   = "Knal"
    target[ "skeleton" ]                = "Eiqairp'alo"
    target[ "moose" ]                   = "Ndwal"
    
    -- Items
    target[ "rock" ]                    = "Ktal"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Uk'ar"
    target[ "sandwich" ]                = "Âčmawîr"
    target[ "amethyst" ]                = "Ktél khwal"
    target[ "sapphire" ]                = "Ktél přal"
    target[ "diamond" ]                 = "Stral"
    target[ "emerald" ]                 = "Żp'al"
    target[ "ruby" ]                    = "Ktél xt'al"
    target[ "copper" ]                  = "Xhtal"              -- It is a copper coin
    target[ "silver" ]                  = "Rqal"
    target[ "gold" ]                    = "Xral"
    target[ "ladder" ]                  = "Otnal"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "Ebawul ki čeil?"
    target[ "You don't have enough money" ]   = "Spalir to"
    
    -- Button options
    target[ "Don't buy anything" ]      = "Spalir" -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Îmsar:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Ôgral tâ"              -- Restores health
    target[ "PotionDescription" ]       = "Iglalač tu"
    target[ "Earthquake" ]              = "Perţkwaekpar"
    target[ "EarthquakeDescription" ]   = "Italir tiļ tie"
    target[ "Dynamite" ]                = "Xčálrak"
    target[ "DynamiteDescription" ]     = "Ejal"
    target[ "Rope" ]                    = "Öxpál"
    target[ "RopeDescription" ]         = "Jal"
    target[ "Blizzard" ]                = "Uţwálûk"
    target[ "BlizzardDescription" ]     = ""
    
    -- Narration
    target[ "miner-begin" ]             = "Ko rq'il ômrar. Ka uglawelir"
    target[ "miner-move-north" ]        = "Ku gwal osroar."
    target[ "miner-move-south" ]        = "Ku gwal ösroar."
    target[ "miner-move-east" ]         = "Ku gwal öcmoar."
    target[ "miner-move-west" ]         = "Ku gwal ocmoar."
    target[ "miner-mine" ]              = "Čel obval kî ko"
    target[ "miner-eat-sandwich" ]      = "Čmel gral ko"
    target[ "use-earthquake" ]          = "Perţkwaekpair"
    target[ "use-blizzard" ]            = "Uţwaílûk" 
    target[ "enemies-thaw" ]            = ""
    target[ "use-potion" ]              = "Uglailir ôgral kâ"
    target[ "miner-collect-copper" ]    = "Xhtel ômrar ko"
    target[ "miner-collect-silver" ]    = "Rqel ômrar ko"
    target[ "miner-collect-gold" ]      = "Xrel ômrar ko"
    target[ "miner-collect-amethyst" ]  = "Ktél khwal ômrar ko"
    target[ "miner-collect-sapphire" ]  = "Ktél přal ômrar ko"
    target[ "miner-collect-diamond" ]   = "Strel ômrar ko"
    target[ "miner-collect-emerald" ]   = "Żp'al ômrar ko"
    target[ "miner-collect-ruby" ]      = "Ktél xtal ômrar ko"
    target[ "miner-attack-snail" ]      = "Âļnel fřál ko"
    target[ "miner-attack-mole" ]       = "Çqhwel fřál ko"
    target[ "miner-attack-mushroom" ]   = "Cnelek fřál ko"
    target[ "miner-attack-bat" ]        = "Ftçel fřál ko"
    target[ "miner-attack-rabbit" ]     = "Lxwel fřál ko"
    target[ "miner-attack-snake" ]      = "Knel fřál ko"
    target[ "miner-attack-moose" ]      = "Ndwel fřál ko"
    target[ "miner-attack-skeleton" ]   = "Eiqairp'elo fřál ko"
    target[ "miner-go-down-ladder" ]    = "Ejal ti"
    target[ "miner-rope" ]              = "Expál ko"
    target[ "miner-dynamite" ]          = ""
    target[ "miner-died" ]              = "Italir ti"
    
	return helper, target    
end
