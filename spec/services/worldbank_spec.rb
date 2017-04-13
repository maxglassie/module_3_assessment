require 'rails_helper'

describe WorldBankService do
  attr_reader :service

  before (:each) do
    @service = WorldBankService.new
  end

  describe "worldbank service calls the worldbank API", :vcr do
    it "initializes a Faraday connection" do
      connection = @service.connection

      expect(connection.url_prefix.to_s).to eq('worldbank api')
    end

    it "returns a country query" do
      country = @service.country

      expect(country["name"]).to eq("Argentina")
    end
  end
end


