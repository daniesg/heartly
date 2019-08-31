class HomesController < ApplicationController
  layout "authenticated"

  def index
    redirect_to(new_user_session_path) && return unless user_signed_in?

    @meals = []
    gon.meals = []
  end
end
