require 'spec_helper'

describe Topic do

   describe "initialization" do

  	it "should have a title" do
  		topic = Topic.new	
  		topic.title = "Test Title"
  	end 
  
  end
end
