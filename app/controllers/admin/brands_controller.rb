class Admin::BrandsController < Admin::BaseController
  include CategoriesConcern
  before_action :set_brand, only: %i[edit show destroy update]
  before_action :load_categories, only: %i[new edit create update]


  def index
    @brands = Brand.all
  end

  def show; end

  def new
    @brand = Brand.new
  end

  def edit
    @category      = Category.category_by_brand(@brand)
    @subcategories = @category.subcategories
    @selected_subcategories = @brand.subcategories
  end


  def create
    @brand = Brand.new(brands_params)
    if @brand.save
      redirect_to admin_brands_path, notice: 'Brand successfully created.'
    else
      render :new
    end
  end

  def update
    if @brand.update(brands_params)
      redirect_to admin_brands_path, notice: 'Brand successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @brand.destroy
      flash[:notice] = 'Brand successfully deleted.'
    else
      flash[:alert] = 'Error in deleting the brand.'
    end
    redirect_to admin_brands_path
  end

  private
  def brands_params
    params.require(:brand).permit(:name, :description, subcategory_ids: [])
  end

  def set_brand
    @brand = Brand.friendly.find(params[:id])
  end

end
