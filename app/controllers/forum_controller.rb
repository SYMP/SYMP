class ForumController < ApplicationController
  def index
  	@sections = Section.all
  	
  	@sectionTopics = Hash.new
  	@sections.each { |s| @sectionTopics[s.id] = s.topics}
  	
  	@latestSectionPost = Hash.new
  	
  	for section in @sections do
	  	for topic in @sectionTopics[section.id] do 
			 posts = topic.posts.sort_by {|obj| obj.updated_at}
			 latestPost = posts.last
			 tmp = @latestSectionPost[section.id]
			 			 
			 if tmp.nil?
			 	@latestSectionPost[section.id] = latestPost if !latestPost.nil?
			 else
			 	@latestSectionPost[section.id] = latestPost if latestPost.updated_at > tmp.updated_at
		 	 end
		end	
    end
  end
end



