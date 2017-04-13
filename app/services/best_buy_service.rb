class BestBuyService

  def initialize(zip_code)
    @api_key = ENV['api_key']
    @zip = zip_code
    @show = "name,city,distance,phone,storeType"
  end

  def stores
    response = Faraday.get("https://api.bestbuy.com/v1/stores((postalCode=80202))?&show=city,location,name,phone,storeType&format=json&apiKey=#{@api_key}")
    body = JSON.parse(response.body)
  end
end