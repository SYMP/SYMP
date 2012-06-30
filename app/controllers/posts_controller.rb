class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
   def index
   
   	if params[:topic_id]
   		@topic = Topic.find(params[:topic_id])
   		@posts = @topic.posts
   	else
   		if current_user.role.eql?("Administrator")
	   		@posts = Post.all
	   	else
    		@posts = Post.where("user_id=?", current_user.id);
    	end
    end
 
     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @posts }
     end
   end

  # GET /posts/1
  # GET /posts/1.json
  def show
	@post = Post.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
	if params[:topic_id]
		@topic = Topic.find(params[:topic_id])	
	end

    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit

    @post = Post.find(params[:id])
    @topic = @post.topic
    
  end

  # POST /posts
  # POST /posts.json
  def create
	if params[:topic_id]
	    @topic = Topic.find(params[:topic_id])
	    @post = @topic.posts.build(params[:post])
	else
    	@post = Post.new(params[:post])
    end

    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to({:controller => 'topics', :action =>'show', :id => @topic.id }, notice: 'Post was successfully created.')}
        #format.html { redirect_to topic_posts_url, notice: 'Post was successfully created.'}
        #format.html { redirect_to @post, notice: 'Post was successfully created.'}
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @topic = @post.topic

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to({:controller => 'topics', :action =>'show', :id => @topic.id }, notice: 'Post was successfully updated.')}
        #format.html { redirect_to @post, notice: 'Post was successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    
    if current_user.role.eql?("User")
	    @topic = @post.topic
    end
    
    @post.destroy

    respond_to do |format|
      if current_user.role.eql?("Administrator")
	     format.html { redirect_to posts_url }      
      else
     	 format.html { redirect_to({:controller => 'topics', :action =>'show', :id => @topic.id }, notice: 'Post was successfully deleted.')} 
      end
	 
      #format.html { redirect_to posts_url }
      #format.html { redirect_to topic_posts_url }
      format.json { head :no_content }
    end
  end
end
