class GeekettesController < ApplicationController

  respond_to :html, :json

  def start
  end

  def index
    @geekettes = Geekette.all
    respond_with @geekettes #, except: [:created_at, :updated_at] 
  end

  def edit
    @geekette = Geekette.find(params[:id])
    respond_with @geekette
  end

  def update
    @geekette = Geekette.find(params[:id])
    @geekette.update_attributes(params[:geekette])
    respond_with @geekette
  end

  def show
    # show_id = rand(1..Geekette.all.count) unless params[:id]

    @geekette = Geekette.find(params[:id])
    respond_with @geekette, except: [:created_at, :updated_at]
  end

  def import
    @geekette = Geekette.new(params[:data])
    @geekette.save
    redirect_to geekettes_path
  end
end