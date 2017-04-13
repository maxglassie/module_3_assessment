class BestBuyService

  def initialize(zip_code)
    @api_key = ENV['api_key']
    @zip = zip_code
    @show = "name,city,distance,phone,storeType"
  end

  def stores
    response = Faraday.get("https://api.bestbuy.com/v1/stores(postalCode=80202)?apiKey=#{@api_key}&format=json&show=city,location,name,phone,storeType")
    body = JSON.parse(response.body)
  end
end