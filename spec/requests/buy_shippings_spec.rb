require 'rails_helper'

RSpec.describe "BuyShippings", type: :request do
  describe "GET /buy_shippings" do
    it "works! (now write some real specs)" do
      get buy_shippings_index_path
      expect(response).to have_http_status(200)
    end
  end
end
