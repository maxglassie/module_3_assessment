class Store
  attr_reader :name, :city, :distance, :phone, :type

  def initialize(data)
    @name = data["name"]
    @city = data["city"]
    @distance = data["distance"]
    @phone = data["phone"]
    @type = data["storeType"]
  end
end
