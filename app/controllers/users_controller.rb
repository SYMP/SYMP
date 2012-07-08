class UsersController < ApplicationController
  skip_before_filter :authenticate, :only => [:new, :create, :index]
  @roles = Role.all 

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @skills = Skill.where('user_id = ?', params[:id])
    #@role = case Role.where('user_id = ?', params[:id])[0].role 
    #  when 0 then "Administrator"
    #  when 1 then "Moderator"
    #  else "User"
    #end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    namecheck = User.where('name = ?', params[:user][:name])

    respond_to do |format|
      if namecheck.count > 0
        @user.errors.add(:name, "- this username is already taken")
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      elsif @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def delete_avatar
    if current_user.role.eql?('Administrator')
      @user = User.find(params[:id])
      @user.avatar = nil
      @user.save
      @message = 'Avatar deleted'
      pm = PrivateMessage.new(:sender => current_user.id, :recipient => params[:id], :subject => 'Warning', :message => 'Your avatar sucked and has been deleted!', :unread => true)
      pm.save
    else
      @message = 'Get lost, you aren\'t allowed to delete anything'
    end
  end


  private
    #10.2
    def current_user?(user)
      user == current_user
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
# war vorher im relationships_controller - vllt muss es wieder zurück?
    def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
    end

    def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
    end


    #def admin_user
     # redirect_to(root_path) unless current_user && current_user.admin?
    #end

end