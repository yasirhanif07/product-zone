class ProductsController < ApplicationController
  include VideoPlayerConcern
  before_action :set_product, only: %i[show]
  before_action :set_tag, only: %i[search_by_tag]

  def show
    @product.increment!(:viewed_count) if @product.present?
    @product_video_url = @product&.video_id
    @url = iframe_video_url(@product_video_url) if @product_video_url.present?
  end

  def search_by_tag
    @searched_products = @tag&.products
  end

  def search_by_brand
    @brand = Brand.find_by_id(params[:brand_id])
    @searched_products = @brand&.products
  end

  def render_video
    @iframe_video_url = iframe_video_url(params[:video_url]) if params[:video_url].present?
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def set_tag
    @tag = Tag.find_by_id(params[:tag_id])
  end
end
