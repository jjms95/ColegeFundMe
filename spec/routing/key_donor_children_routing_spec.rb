require "rails_helper"

RSpec.describe KeyDonorChildrenController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/key_donor_children").to route_to("key_donor_children#index")
    end

    it "routes to #new" do
      expect(:get => "/key_donor_children/new").to route_to("key_donor_children#new")
    end

    it "routes to #show" do
      expect(:get => "/key_donor_children/1").to route_to("key_donor_children#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/key_donor_children/1/edit").to route_to("key_donor_children#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/key_donor_children").to route_to("key_donor_children#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/key_donor_children/1").to route_to("key_donor_children#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/key_donor_children/1").to route_to("key_donor_children#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/key_donor_children/1").to route_to("key_donor_children#destroy", :id => "1")
    end

  end
end
