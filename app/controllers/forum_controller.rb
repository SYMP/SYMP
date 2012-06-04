class ForumController < ApplicationController
  def index
  	@sections = Section.all
  	
  	@sectionTopics = Hash.new
  	@sections.each { |s| @sectionTopics[s.id] = s.topics}
  	
  end
end
