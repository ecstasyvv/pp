
--[[

                 ___                                                  
                (   )                                                 
        .--.     | |_       .---.   ___ .-.     ___ .-.     ___  ___  
      /  _  \   (   __)    / .-, \ (   )   \   (   )   \   (   )(   ) 
     . .' `. ;   | |      (__) ; |  | ' .-. ;   | ' .-. ;   | |  | |  
     | '   | |   | | ___    .'`  |  |  / (___)  |  / (___)  | |  | |  
     _\_`.(___)  | |(   )  / .'| |  | |         | |         | '  | |  
    (   ). '.    | | | |  | /  | |  | |         | |         '  `-' |  
     | |  `\ |   | ' | |  ; |  ; |  | |         | |          `.__. |  
     ; '._,' '   ' `-' ;  ' `-'  |  | |         | |          ___ | |  
      '.___.'     `.__.   `.__.'_. (___)       (___)        (   )' |  
                                                             ; `-' '  
                                                              .__.'   
    ~ discord.gg/luau
    ~ github.com/starry-proj

    <-------------------->
    
      Starry is an all-powerful script hub developed in TypeScript with Roblox-TS.
      
      Alongside being the best script for all supported games, Starry is relatively bug-free.
      
      Starry brought to you by Suno & Zade ❤️

    <-------------------->

    To load the Stable, and bug-free edition of Starry,
    
    change it to `loadVersion(1)`.

]]

local fluent = loadstring(game:HttpGet("https://github.com/mr-suno/Fluent/releases/latest/download/main.lua"))()

local players = game:GetService("Players")
local logService = game:GetService("LogService")

local localPlayer = players.LocalPlayer

local luarmorIssue = false -- Triggers to True if Luarmor experiences loading errors

local function loadVersion(verified: boolean)
    logService:ClearOutput()

    if verified == nil then
        verified = false
    end
    
    local unverified = "219566b932eb38b9819542b23fa68ab2"
    local success, response = pcall(function()
        if verified then
            fluent:Notify({
                Title = `\u{1F6E1}  Luarmor Verified`,
                Content = "This script is verified, and protected using <b>Luarmor</b>",
                Duration = 1.5
            })
        
            return loadstring(game:HttpGet("https://cdn.luarmor.net/verified/Starry.lua"))()
        end
        
        loadstring(game:HttpGet(`api.luarmor.net/files/v3/loaders/{unverified}.lua`))()
    end)

    task.wait(0.5)
    
    if success ~= nil then
        local warns = {}
        local logs = logService:GetLogHistory()
        
        for _, log in pairs(logs) do
            if log.messageType == Enum.MessageType.MessageWarning then
                table.insert(warns, log.message)    
            end
        end
        
        for _, warning in pairs(warns) do
            if string.find(warning, "Err:nil") then
                luarmorIssue = true
            end
        end

        print(luarmorIssue)
    end
    
    if not success or luarmorIssue then
        localPlayer:Kick(`\n\nReport this error in our server,\ndiscord.gg/luau\n\n{response}\n`)
    end
end

loadVersion(false) -- false: Load the Unverified script
                   -- true:  Load the Verified, protection guaranteed script
