require 'rails_helper'

describe "post request creates an item" do
  it "returns a 201 status when item is created" do
    params = "name=we_the_best&description=bless_up&image_url=wethebest.com"

    post "/api/v1/items?#{params}"

    expect(response).to have_http_status(201)
    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item).to have_key "name"
    expect(item).to have_key "description"
    expect(item).to have_key "image_url"
    expect(item).to_not have_key "created_at"
    expect(item).to_not have_key "updated_at"

    expect(item["name"]).to eq("we_the_best")
    expect(item["description"]).to eq("bless_up")
    expect(item["image_url"]).to eq("wethebest.com")

    item_find = Item.all

    expect(item_find.name).to eq("we_the_best")
    expect(item_find.description).to eq("bless_up")
  end
end