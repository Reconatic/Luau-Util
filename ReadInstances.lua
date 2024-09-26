-- Local variables to control behavior
local highlight_stayed = false -- Set to true if you want highlights to stay
local include_player_avatar = true -- Set to true to include the player's avatar in the highlights
local read_replicated_storage = true -- Set to true to read from ReplicatedStorage
local read_other = false -- Set to true to read from other specified services/objects
local read_script = true -- Set to true to read scripts
local decompile = true -- Set to true to "decompile" scripts (this is just a placeholder print)
local read_highlight_instances = true -- Set to false to skip highlighting instances

-- Function to build the full path of an instance
local function getFullPath(instance)
    local path = instance.Name
    local current = instance.Parent
    
    -- Loop upwards through the hierarchy to build the full path
    while current and current.Name ~= "game" do
        path = current.Name .. "." .. path
        current = current.Parent
    end
    
    return path
end

-- Function to highlight a part based on its original color
local function highlightPart(part, delayed)
    if not read_highlight_instances then return end -- Skip if highlighting is disabled

    -- Create a highlight
    local highlight = Instance.new("Highlight")
    highlight.Parent = part

    -- Set highlight color based on part's color
    local partColor = part.Color
    highlight.FillColor = partColor -- Use part's color
    highlight.FillTransparency = 0.5 -- Semi-transparent
    highlight.OutlineTransparency = 0 -- No outline transparency
    
    -- Wait for the delayed time if not staying highlighted
    if not highlight_stayed then
        wait(delayed) -- Use delayed here
        
        -- Remove the highlight after waiting
        highlight:Destroy()
    end
    
    return highlight -- Return the highlight if you want to manage it later
end

-- Function to "decompile" a script (for now just print its path and name)
local function decompileScript(scriptObj)
    print("[ decompile ] - [ script ] - " .. getFullPath(scriptObj) .. " - " .. scriptObj.Name)
    -- Add your real decompiling logic here if possible
end

-- Recursive function to read and print all children with their full paths
local function readChildren(parent, delayed)
    -- Iterate over each child of the parent
    for _, child in ipairs(parent:GetChildren()) do
        -- Include the player's avatar if specified
        if include_player_avatar and child:IsA("Player") then
            print("[Highlight] - " .. getFullPath(child)) -- Print highlight for player avatar
            highlightPart(child, delayed) -- Highlight the player's avatar
        end

        -- Determine if the child is a directory (Folder/Model) or a part
        if child:IsA("Folder") or child:IsA("Model") then
            print("[ dir ] - " .. getFullPath(child)) -- Print directory path
            readChildren(child, delayed) -- Recursively read children of the directory
        elseif child:IsA("Part") or child:IsA("MeshPart") then
            print("[Highlight] - " .. getFullPath(child)) -- Print highlight for part
            highlightPart(child, delayed) -- Highlight the part (conditional based on read_highlight_instances)
        end

        -- Handle reading scripts if enabled
        if read_script and child:IsA("Script") then
            print("[ script ] - " .. getFullPath(child)) -- Print script path

            -- Decompile script if the option is enabled
            if decompile then
                decompileScript(child)
            end
        end
        
        -- Check if reading from ReplicatedStorage is enabled
        if read_replicated_storage and parent == game.ReplicatedStorage then
            print("[ dir ] - " .. getFullPath(child)) -- Print directory path from ReplicatedStorage
            readChildren(child, delayed) -- Recursively read children of ReplicatedStorage
        end

        -- Check if reading from other specified objects/services is enabled
        if read_other then
            -- Add specific conditions for reading other services or objects here.
        end
    end
end

-- Main function
local function main()
    local root = game -- Set the root to game
    local delayed = 0.1 -- Set delay time
    readChildren(root, delayed)
    
    -- Check if reading from ReplicatedStorage is enabled
    if read_replicated_storage then
        readChildren(game.ReplicatedStorage, delayed) -- Read ReplicatedStorage
    end

    -- Check if reading from other specified objects/services is enabled
    if read_other then
        -- Add custom reading logic for other services/objects here.
    end

    -- Print thank you message after everything is done
    print("Thank You For Using Instance Read")
end

main()
