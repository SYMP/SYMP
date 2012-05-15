class ForumController < ApplicationController
  def index
  	@sections = Section.all
  	@topics = Topic.all
  end
end
