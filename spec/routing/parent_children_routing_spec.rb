require "rails_helper"

RSpec.describe ParentChildrenController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/parent_children").to route_to("parent_children#index")
    end

    it "routes to #new" do
      expect(:get => "/parent_children/new").to route_to("parent_children#new")
    end

    it "routes to #show" do
      expect(:get => "/parent_children/1").to route_to("parent_children#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/parent_children/1/edit").to route_to("parent_children#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/parent_children").to route_to("parent_children#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/parent_children/1").to route_to("parent_children#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/parent_children/1").to route_to("parent_children#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/parent_children/1").to route_to("parent_children#destroy", :id => "1")
    end

  end
end
