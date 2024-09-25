local _, ns = ...

SLASH_FLOWERPOWER1 = "/fpx"
SLASH_FLOWERPOWER2 = "/flower"

function ns.HelpFunction()
   print(" /fpx on - to enable custom search")
   print(" /fpx off - to disable custom search")
end

function ns.Diagnostics()
    print("FPX diahs")
end

function ns.Enable()
    print("FPX on")
end


function ns.DisableCustomSearch()
    local f = AuctionHouseFrame.SearchBar
    local filter = Enum.AuctionHouseFilter.CurrentExpansionOnly

    if f.FilterButton.filters[filter] then
        f.FilterButton:ToggleFilter(filter)
    end

    f.SearchButton:SetText("Search")
    f.FilterButton:SetText("Filter")
end

function ns.EnableCustomSearch()
    local f = AuctionHouseFrame.SearchBar
    local filter = Enum.AuctionHouseFilter.CurrentExpansionOnly

    if not f.FilterButton.filters[filter] then
        f.FilterButton:ToggleFilter(filter)
    end

    f.SearchButton:SetText("FlowerSearch")
    f.FilterButton:SetText("FlowerPower")
end

SlashCmdList["FLOWERPOWER"] = function(userInput)    local input = tostring(userInput)
    if input == "" then ns.HelpFunction();
    elseif input == "off" then ns.DisableCustomSearch();
    elseif input == "on" then ns.EnableCustomSearch();
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("AUCTION_HOUSE_SHOW")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event)
    if event == "AUCTION_HOUSE_SHOW" then
        ns.EnableCustomSearch()
        f:UnregisterEvent("AUCTION_HOUSE_SHOW")
    elseif event == "ADDON_LOADED" then
        --do nothing
        f:UnregisterEvent("ADDON_LOADED")
    end
end)

