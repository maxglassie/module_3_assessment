require 'rails_helper'

describe BestBuyService do
  it "returns a list of stores within 25 miles" do
    service = BestBuyService.new("80202")

    stores = service.stores

    expect(stores["stores"].first["name"]).to eq("CHERRY CREEK MALL")
    expect(stores["stores"].first["city"]).to eq("DENVER")
    expect(stores["stores"].first["distance"]).to eq(3.45)
    expect(stores["stores"].first["phone"]).to eq("303-270-9189")
    expect(stores["stores"].first["storeType"]).to eq("Mobile SAS")
  end
end