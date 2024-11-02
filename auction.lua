---@diagnostic disable: lowercase-global

local _, FPX = ...
FPX.auction = auction
auction = {}

function FPX.InitAuctionFrame()
    auction.SearchBar = AuctionHouseFrame.SearchBar
    auction.FilterButton = AuctionHouseFrame.SearchBar.FilterButton
    auction.SearchButton = AuctionHouseFrame.SearchBar.SearchButton
    auction.filter = Enum.AuctionHouseFilter.CurrentExpansionOnly
end

function FPX.SetCustomAuctionText(isEnabled)
    if isEnabled then
        auction.SearchButton:SetTextToFit("FlowerSearch");
        auction.FilterButton:SetText("FPX ON");
    else
        auction.SearchButton:SetTextToFit("Search");
        auction.FilterButton:SetText("Filter");
    end
end

function FPX.ToggleCustomAuctionSearch(isEnabled)
    auction.FilterButton.filters[auction.filter] = isEnabled
    auction.FilterButton.ResetButton:SetShown(isEnabled)
    FPX.SetCustomAuctionText(isEnabled)
end

function FPX.OnAuction(self, event)
    if event == "AUCTION_HOUSE_SHOW" then
        FPX.InitAuctionFrame()
        FPX.ToggleCustomAuctionSearch(true)
    end
end

local f = CreateFrame("frame")
f:RegisterEvent("AUCTION_HOUSE_SHOW")
f:SetScript("OnEvent", FPX.OnAuction)
