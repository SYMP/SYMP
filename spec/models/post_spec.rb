require 'spec_helper'

describe Post do
 
  describe "initialization" do

  	it "should have a subject" do
  		post = Post.new	
  		post.subject = "Test Subject"
  	end 
  
  	it "should have a message" do
  		post = Post.new	
  		post.message = "This is the test message"
  	end

  end

end
