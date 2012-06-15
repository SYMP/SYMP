require "spec_helper"

describe PrivateMessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/private_messages").should route_to("private_messages#index")
    end

    it "routes to #new" do
      get("/private_messages/new").should route_to("private_messages#new")
    end

    it "routes to #show" do
      get("/private_messages/1").should route_to("private_messages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/private_messages/1/edit").should route_to("private_messages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/private_messages").should route_to("private_messages#create")
    end

    it "routes to #update" do
      put("/private_messages/1").should route_to("private_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/private_messages/1").should route_to("private_messages#destroy", :id => "1")
    end

  end
end
