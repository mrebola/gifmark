class GifsController < ApplicationController
  respond_to :html, :json
  before_filter :load, only: [ :show, :edit, :create, :update, :destroy ]

  def index
    @gifs = Gif.all
    @gif = Gif.new
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
    if @gif.save
      redirect_to @gif, notice: 'Gif was successfully created.' 
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
