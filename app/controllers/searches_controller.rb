class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  def index

    @searches = Search.all
   # @users = User.all 
 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show

     @search = Search.all

     respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
    
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.json
  def create
          
      # If Userfield is empty, only search for city

      if params[:search][:name].empty? && params[:search][:city]

              @users = User.where('city = ?', params[:search][:city]) 

                # Or if Cityfield is empty, only search for name
        elsif  params[:search][:name] && params[:search][:city].empty?

             @users = User.where('name = ? ', params[:search ][:name])

        else

            @users = User.where('name = ? AND city =? ', params[:search ][:name], params[:search ][:city])

        respond_to do |format|

     
     #flash[:notice] = "Ergebnis" # so kann man flash nachrichten ausgeben
      
      format.html 
      format.json { render json: @search }  
     
 end
  end
    
  end

  # PUT /searches/1
  # PUT /searches/1.json
  def update
    @search = Search.find(params[:id])

    respond_to do |format|
      if @search.update_attributes(params[:search])
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end
end

