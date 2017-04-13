class BestBuyService

  def initialize(zip_code)
    @connection = Faraday.new("https://api.bestbuy.com")
    @api_key = ENV['api_key']
    @zip = zip_code
    @show = "name,city,distance,phone,storeType"
  end

  def stores
    response = @connection.get("/v1/stores(area(#{@zip},25))?format=json&show=#{@show}&pageSize=10&apiKey=#{@api_key}")
    body = JSON.parse(response.body)
  end
end