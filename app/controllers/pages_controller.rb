class PagesController < ApplicationController
  before_action :set_page, only: %i[show]

  def show; end

  private

  def set_page
    @page = StaticPage.find_by_id(params[:id])
  end

end
