class GifsController < ApplicationController
  respond_to :html, :json, :js
  before_filter :load, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:tag]
      @gifs = Gif.tagged_with(params[:tag])
    else
      @gifs = Gif.search(params[:q])
    end
    @gifs = @gifs.page(params[:page]).per(5)

    respond_with @gifs
  end

  def show
    respond_with @gif
  end

  def new
    @gif = Gif.new
  end

  def edit
  end

  def create
    @gif = Gif.create(params[:gif])
    if @gif.save
      redirect_to root_path, notice: 'Gif was successfully created.' 
    else
      render action: "new" 
    end
  end

  def update
    if @gif.update_attributes(params[:gif])
      redirect_to @gif, notice: 'Gif was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @gif.destroy
  end

  private

  def load
    @gif = Gif.find(params[:id])
  end
  
end
