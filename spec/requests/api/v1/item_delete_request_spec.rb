require 'rails_helper'

describe "delete request deletes an item" do
  it "returns a 200 status when item is deleted" do
    #make some data
    item_1 = Item.create(name: "we_the_best_1", description: "Bless Up_1", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")
    item_2 = Item.create(name: "we_the_best_2", description: "Bless Up_2", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")
    item_3 = Item.create(name: "we_the_best_3", description: "Bless Up_3", image_url: "http://cdn.shopify.com/s/files/1/1055/0970/products/blessu-charger-1_large.jpg?v=1469807910")

    delete '/api/v1/items/3'

    expect(response).to have_http_status(204)

    items = Item.all

    expect(items.first.name).to eq("we_the_best_1")
    expect(items.last.name).to eq("we_the_best_2")
  end
end