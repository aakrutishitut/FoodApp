require 'rails_helper'

RSpec.describe "Currents", type: :request do
  describe "GET /currents" do
    it "works! (now write some real specs)" do
      get currents_path
      expect(response).to have_http_status(200)
    end
  end
end
