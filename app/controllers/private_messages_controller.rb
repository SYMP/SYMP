class PrivateMessagesController < ApplicationController
  # GET /private_messages
  # GET /private_messages.json
  def index
    @private_messages = PrivateMessage.where("recipient = ?", current_user.id)
    #@private_messages = PrivateMessage.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @private_messages }
    end
  end

  def outbox
    @private_messages = PrivateMessage.where("sender = ?", current_user.id)

    respond_to do |format|
      format.html
      format.json {render json: @private_messages }
    end
  end

  # GET /private_messages/1
  # GET /private_messages/1.json
  def show
    @private_message = PrivateMessage.find(params[:id])
    @private_message.unread = false
    @private_message.save

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @private_message }
    end
  end

  # GET /private_messages/new
  # GET /private_messages/new.json
  def new
    @private_message = PrivateMessage.new
    if(params[:id] != nil)
      @private_message.recipient = User.find(params[:id]).name
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @private_message }
    end
  end

  # GET /private_messages/1/edit
  def edit
    @private_message = PrivateMessage.find(params[:id])
  end

  # POST /private_messages
  # POST /private_messages.json
  def create
    @private_message = PrivateMessage.new(params[:private_message])
    @private_message.sender = current_user.id
    rec = User.where('name = ?', params[:private_message][:recipient])
    if rec[0] != nil
      @private_message.recipient = rec[0].id
    end

    @private_message.unread = true

    respond_to do |format|
      if @private_message.recipient == 0
        @private_message.errors.add(:recipient, "- a user with that name does not exist")
        format.html { render action: "new" }
        format.json { render json: @private_message.errors, status: :unprocessable_entity }
      elsif @private_message.save
        @popup_message = 'Your message has been sent!'
        format.html { redirect_to private_messages_url, notice: 'Your message has been sent' }
        format.json { render json: @private_message, status: :created, location: @private_message }
      else
        format.html { render action: "new" }
        format.json { render json: @private_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def reply
    #@private_message = PrivateMessage.find(params[:id])
    #@private_message.recipient = User.find(@private_message.sender).name
    #@private_message.subject = ['Re: ', @private_message.subject].join('')
    #@private_message.message = ["\n\n", User.find(@private_message.sender).name, " wrote:\n", @private_message.message].join('')
    reply_msg = PrivateMessage.find(params[:id])
    @private_message = PrivateMessage.new
    @private_message.recipient = User.find(reply_msg.sender).name
    @private_message.subject = ['Re: ', reply_msg.subject].join('')
    @private_message.message = ["\n\n", User.find(reply_msg.sender).name, " wrote:\n", reply_msg.message].join('')
  end

  # PUT /private_messages/1
  # PUT /private_messages/1.json
  def update
    @private_message = PrivateMessage.find(params[:id])

    respond_to do |format|
      if @private_message.update_attributes(params[:private_message])
        format.html { redirect_to @private_message, notice: 'Private message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @private_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_messages/1
  # DELETE /private_messages/1.json
  def destroy
    @private_message = PrivateMessage.find(params[:id])
    @private_message.destroy

    respond_to do |format|
      format.html { redirect_to private_messages_url }
      format.json { head :no_content }
    end
  end
end
