---@diagnostic disable: lowercase-global

local _, FPX = ...
FPX.order = order
order = {}

function FPX.InitOrderFrame()
    order.searchBar = ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar
    order.filterDropdown = order.searchBar.FilterDropdown
    order.searchButton = order.searchBar.SearchButton
    order.filter = Enum.AuctionHouseFilter.CurrentExpansionOnly
end

function FPX.SetCustomOrderText(isEnabled)
    if isEnabled then
        order.filterDropdown:SetText("FPX ON")
        order.searchButton:SetTextToFit("FlowerSearch")
    else
        order.filterDropdown:SetText("Filter")
        order.searchButton:SetTextToFit("Search")
    end
end

function FPX.ToggleCustomOrderSearch(isEnabled)
    order.filterDropdown.filters[order.filter] = isEnabled
    order.filterDropdown.ResetButton:SetShown(isEnabled)
    FPX.SetCustomOrderText(isEnabled)
end

function FPX.OnOrder(self, event)
    if event == "CRAFTINGORDERS_SHOW_CUSTOMER" then
        FPX.InitOrderFrame()
        FPX.ToggleCustomOrderSearch(true)
    end
end

local f = CreateFrame("frame")
f:RegisterEvent("CRAFTINGORDERS_SHOW_CUSTOMER")
f:SetScript("OnEvent", FPX.OnOrder)
