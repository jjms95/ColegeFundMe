require 'rails_helper'

RSpec.describe "ParentChildren", type: :request do
  describe "GET /parent_children" do
    it "works! (now write some real specs)" do
      get parent_children_path
      expect(response).to have_http_status(200)
    end
  end
end
