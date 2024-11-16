
*******************
Come With All Setting!!!
*******************

```lua
--[[ 
    WARNING: Use of this script may violate Roblox's Terms of Service.
    Ensure you understand the risks involved, including account bans.
]]

local Params = {
    RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
    SSI = "saveinstance",
}

-- Load the external script
local success, synsaveinstance = pcall(function()
    return loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
end)

if not success then
    warn("Failed to load SynSaveInstance. Check your URL or internet connection.")
    return
end

-- Define options with correct Lua syntax
local Options = {
    SaveBytecode = false,
    ShowStatus = true,
    IgnoreDefaultPlayerScripts = true,
    NilInstancesFixes = {
        BaseWrap = nil,
        Animator = nil,
        Attachment = nil,
        PackageLink = nil,
        AdPortal = nil,
    },
    IgnoreList = {"CoreGui", "CorePackages"},
    __DEBUG_MODE = false,
    decomptype = "custom", -- Set your custom decompiler type here
    IgnoreNotArchivable = true,
    RemovePlayerCharacters = true,
    Object = false,
    DecompileIgnore = {"TextChatService", nil},
    IgnoreSpecialProperties = true,
    TreatUnionsAsParts = true,
    IsModel = false,
    NilInstances = false,
    ExtraInstances = {},
    noscripts = false,
    ReadMe = true,
    OptionsAliases = {
        IsolatePlayers = "SavePlayers",
        FilePath = "FileName",
        IgnoreNotArchivable = "IgnoreArchivable",
        SaveNonCreatable = "SaveNotCreatable",
        IgnoreDefaultProperties = "IgnoreDefaultProps",
        timeout = "DecompileTimeout",
        scriptcache = "DecompileJobless",
    },
    scriptcache = true,
    SharedStringOverwrite = false,
    AlternativeWritefile = true,
    mode = "optimized",
    SaveCacheInterval = 56320,
    IgnoreSharedStrings = true,
    IsolatePlayers = false,
    NotCreatableFixes = {"Player", "PlayerScripts", "PlayerGui", "TouchTransmitter"},
    timeout = 10,
    SaveNonCreatable = false,
    Anonymous = false,
    IsolateStarterPlayer = false,
    IsolateLocalPlayerCharacter = false,
    IgnorePropertiesOfNotScriptsOnScriptsMode = false,
    FilePath = false,
    IgnoreDefaultProperties = true,
    IsolateLocalPlayer = false,
    ShutdownWhenDone = false,
    AntiIdle = true,
    SafeMode = false,
    IgnoreProperties = {},
    DecompileJobless = false,
}

-- Run the tool with options
pcall(function()
    synsaveinstance(Options)
end)
```
