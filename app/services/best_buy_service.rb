class BestBuyService

  def initialize(zip_code)
    @api_key = ENV['api_key']
    @zip = zip_code.to_s
    @show = "name,city,distance,phone,storeType"
  end

  def stores
    response = Faraday.get("https://api.bestbuy.com/v1/stores(postalCode=80202)?format=json&show=name,city,distance,phone,storeType&apiKey=qy8vdpfcgsxtfw657mnbu7nc")
    binding.pry
    body = JSON.parse(response.body)
  end
end
      # "/stores(postalCode=#{@zip})?format=json&show=#{@show}&apiKey=#{@api_key}"