class Admin::ProductsController < Admin::BaseController
  include CategoriesConcern
  before_action :load_categories, only: %i[new edit create update]
  before_action :load_tags,       only: %i[new edit create update]
  before_action :set_product,     only: %i[edit show destroy update]

  def index
    @products = Product.order(viewed_count: :desc)
  end

  def new
    @product = Product.new
  end

  def show; end

  def edit
    @subcategory   = Subcategory.subcategory_by_product(@product)
    @category      = @subcategory&.category
    @brands        = @subcategory&.brands
    @subcategories = @category&.subcategories
    @selected_tags = @product.tags
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Product successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Product successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = 'Product successfully deleted.'
    else
      flash[:alert] = 'Error in deleting the product.'
    end
    redirect_to admin_products_path
  end

  private
  def load_tags
    @tags = Tag.all
  end

  def product_params
    params.require(:product).permit(:name, :description, :brand_id, :image, :video_id, tag_ids:[])
  end

  def set_product
    @product = Product.friendly.find(params[:id])
  end

end
