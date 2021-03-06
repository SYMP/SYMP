class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json
  def index
    	
	if current_user.role.eql?("Administrator")  
		@topics = Topic.all
	else
	   if params[:mode].eql?("my")   		
	    	@topics = Topic.where("user_id=?", current_user.id);
	   else
			if params[:section_id]
				@section = Section.find(params[:section_id])
				@topics = @section.topics	
			end   		
	   end
	end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show

    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    @topicOwner = User.find(@topic.user_id)
    @postOwners = Hash.new
    @posts.each { |p| @postOwners[p.id] = User.find(p.user_id)}
   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
	if params[:section_id]
		@section = Section.find(params[:section_id])	
	end
		
	@topic = Topic.new()
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
	  
	if params[:section_id]
	    @section = Section.find(params[:section_id])
	    @topic = @section.topics.build(params[:topic])
	else
		@topic = Topic.new(params[:topic])
	end

	@topic.user_id = current_user.id

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
end
