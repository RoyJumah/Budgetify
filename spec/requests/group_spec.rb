require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe "GET /expenses" do
    it "returns http success" do
      get "/group/expenses"
      expect(response).to have_http_status(:success)
    end
  end

end
