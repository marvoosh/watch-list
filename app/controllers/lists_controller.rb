class ListsController < ApplicationController
  before_action :find_list, only: [:show, :destroy]
  def index
    @lists = List.all
    @list = List.new
  end

  def show; end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_param)

    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path # , notice: 'List was deleted'
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_param
    params.require(:list).permit(:name)
  end
end
