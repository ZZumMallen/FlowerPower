local _, FPX = ...

local function HelpFunction()
    print(" /fpx on - to enable custom search");
    print(" /fpx off - to disable custom search");
end

-- local function Diagnostics()
--     print("FPX diags");
-- end

-- local function Enable()
--     print("FPX on")
-- end

-- local function Disable()
--     print("FPX off")
-- end

local function DisableCustomSearch()
    if ProfessionsCustomerOrdersFrame:IsVisible() then
        FPX.ToggleCustomOrderSearch(false)
    elseif AuctionHouseFrame:IsVisible() then
        FPX.ToggleCustomAuctionSearch(false)
    else
        print("No FPX Custom windows are shown")
        return
    end
end

local function EnableCustomSearch()
    if ProfessionsCustomerOrdersFrame:IsVisible() then
        FPX.ToggleCustomOrderSearch(true)
    elseif AuctionHouseFrame:IsVisible() then
        FPX.ToggleCustomAuctionSearch(true)
    else
        print("Already open")
        return
    end
end

SLASH_FLOWERPOWER1 = "/fpx";
SLASH_FLOWERPOWER2 = "/flower";

SlashCmdList["FLOWERPOWER"] = function(userInput)
    local input = tostring(userInput)

    if input == "" then
        HelpFunction();
    elseif input == "off" then
        --Disable()
        DisableCustomSearch()
    elseif input == "on" then
        --Enable()
        EnableCustomSearch()
    elseif input == "diags" then
        --Diagnostics()
    end
end