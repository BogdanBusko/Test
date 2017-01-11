class LinksController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  def index
    @links = current_user.links
  end

  def new
    @link = current_user.links.build
  end

  def edit
    @links = current_user.links
    @link = @links.find(link_id_params)
  end

  def create
    @link = current_user.links.new(link_params)
    
    if @link.save
      redirect_to links_path
    else 
      render 'new'
    end
  end

  def update
    @links = current_user.links
    @link = @links.find(link_id_params)

    if @link.update_attributes(link_params)
      redirect_to links_path
    else 
      render 'edit'
    end
  end

  def destroy
    @links = current_user.links
    @link = @links.find(link_id_params)
    @link.destroy
    
    redirect_to links_path
  end

  private
    def link_params
      params.require(:link).permit(:link_text, :tags, :descriptio)
    end

    def link_id_params
      return params[:id]
    end 
end
