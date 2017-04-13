require 'rails_helper'

describe "get request an item" do
  it "returns an item as JSON" do
    #make some data
    item_1 = Item.create(name: "we_the_best_1", description: "Bless Up_1", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")
    item_2 = Item.create(name: "we_the_best_2", description: "Bless Up_2", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")
    item_3 = Item.create(name: "we_the_best_3", description: "Bless Up_3", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")

    get '/api/v1/items/2'

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "image_url"
    expect(item).to_not have_key "created_at"
    expect(item).to_not have_key "updated_at"

    expect(item["name"]).to eq("we_the_best_2")
    expect(item["description"]).to eq("we_the_best_2")
  end
end