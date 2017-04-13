class BestBuyService

  def initialize(zip_code)
    @connection = Faraday.new(url: "https://api.bestbuy.com/v1")
    @api_key = ENV['api_key']
    @zip = zip_code
    @show = "name,city,distance,phone,storeType"
  end

  def stores
    response = @connection.get("/stores(postalCode=#{@zip})?format=json&show=#{@show}&apiKey=#{@api_key}")
    binding.pry
    body = JSON.parse(response.body)
  end
end