require 'rails_helper'

RSpec.describe "PurchaseRecords", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/purchase_records/new"
      expect(response).to have_http_status(:success)
    end
  end

end
