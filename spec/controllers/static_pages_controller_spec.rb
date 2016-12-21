require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
	describe "get home" do
		it "render the home page" do
			get :home
			expect(response).to render_template("home")
		end
	end
end
