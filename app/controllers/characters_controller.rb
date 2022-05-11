class CharactersController < ApplicationController
  def index
    @characters = Character.all
    render template: "characters/index"
  end

  def show
    @character = Character.find_by(name: params[:name])
    render template: "characters/show"
  end
end
