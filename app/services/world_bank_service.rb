class WorldBankService

  def initialize
    @connection = Faraday.new(url: "http://api.worldbank.org/")
    binding.pry
  end

  def country
    response = @connection.get("/countries/arg?format=JSON")
    json = JSON.parse(response.body)
  end
end