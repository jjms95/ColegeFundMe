require 'rails_helper'

RSpec.describe "KeyDonorChildren", type: :request do
  describe "GET /key_donor_children" do
    it "works! (now write some real specs)" do
      get key_donor_children_path
      expect(response).to have_http_status(200)
    end
  end
end
