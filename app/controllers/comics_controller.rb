class ComicsController < ApplicationController
  def index
    # @comics = Comic.all
    # if params[:search_term]
    #   @comics = Comic.where("username LIKE ?", "%#{params[:search_term]}%").order(:id)
    # end
    @comics = Comic.all.order(:id)
    render template: "comics/index"
  end

  def show
    @comic = Comic.find_by(id: params[:id])
    render template: "comics/show"
  end
end
