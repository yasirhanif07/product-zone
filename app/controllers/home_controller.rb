class HomeController < ApplicationController
  before_action :set_products, only: %i[ index ]
  def index
    @social_page = SocialPage.last
  end

  def top_most_viewed
    @latest_products = Product.order(viewed_count: :desc).limit(50)
  end

  def search_product
    if params[:remove_results].present?
      set_products
    else
      searched_products
    end
  end

  private
    def set_products
      @latest_products = Product.last(4)
      @most_viewed     = Product.order(viewed_count: :desc).limit(4)
    end
    def searched_products
      @searched_products = Product.where("lower(name) like ?", "%#{params[:search].downcase}%") if params[:search].present?
    end
end
