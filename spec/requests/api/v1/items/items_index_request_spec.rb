require 'rails_helper'

describe "get request returns all items" do
  it "returns all items as JSON" do
    #make some data
    item_1 = Item.create(name: "we_the_best_1", description: "Bless Up_1", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")
    item_2 = Item.create(name: "we_the_best_2", description: "Bless Up_2", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")
    item_3 = Item.create(name: "we_the_best_3", description: "Bless Up_3", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")

    get '/api/v1/items'
    binding.pry
    expect(response).to be_success

    items = JSON.parse(response.body)

    item_first = items.first
    item_last = items.last

    expect(items.first).to have_key "name"
    expect(items.first).to have_key "description"
    expect(items.first).to have_key "image_url"
    expect(items.first).to_not have_key "created_at"
    expect(items.first).to_not have_key "updated_at"

    expect(item_first["name"]).to eq("we_the_best_1")
    expect(item_last["name"]).to eq("we_the_best_3")
  end
end