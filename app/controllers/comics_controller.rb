class ComicsController < ApplicationController
  def index
    # @comics = Comic.all

    @comics = Comic.all.order(:id)
    # if params[:search_term]
    #   @comics = Comic.where("username LIKE ?", "%#{params[:search_term]}%").order(:id)
    # end

    render template: "comics/index"
  end

  def show
    @comic = Comic.find_by(id: params[:id])
    render template: "comics/show"
  end
end
