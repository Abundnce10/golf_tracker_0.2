require "spec_helper"

describe PlayedHolesController do
  describe "routing" do

    it "routes to #index" do
      get("/played_holes").should route_to("played_holes#index")
    end

    it "routes to #new" do
      get("/played_holes/new").should route_to("played_holes#new")
    end

    it "routes to #show" do
      get("/played_holes/1").should route_to("played_holes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/played_holes/1/edit").should route_to("played_holes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/played_holes").should route_to("played_holes#create")
    end

    it "routes to #update" do
      put("/played_holes/1").should route_to("played_holes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/played_holes/1").should route_to("played_holes#destroy", :id => "1")
    end

  end
end
