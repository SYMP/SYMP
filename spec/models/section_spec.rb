require 'spec_helper'

describe Section do
  
  describe "initialization" do

  	it "should have a title" do
  		section = Section.new	
  		section.title = "Test Title"
  		
  	end 
  
  	it "should have a message" do
  		section = Section.new	
  		section.description = "This is the test description"
  	end

  end
end
