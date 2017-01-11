class LinksController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = current_user.links
  end


  # GET /links/new
  def new
    @link = current_user.links.build
  end

  # GET /links/1/edit
  def edit
    @links = current_user.links
    @link = @links.find(link_id_params)
  end

  # POST /links
  # POST /links.json
  def create
    @user = current_user
    @link = @user.links.create!(link_params)

    redirect_to links_path
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @links = current_user.links
    @link = @links.find(link_id_params)
    @link.update(link_params)

    redirect_to links_path
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @links = current_user.links
    @link = @links.find(link_id_params)
    @link.destroy
    
    redirect_to links_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:link_text, :tags, :descriptio)
    end

    def link_id_params
      return params[:id]
    end 
end
