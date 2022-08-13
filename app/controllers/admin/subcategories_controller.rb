class Admin::SubcategoriesController < Admin::BaseController
  include CategoriesConcern
  before_action :load_categories, only: %i[new edit create update]
  before_action :set_subcategory, only: %i[edit show destroy update load_brands]

  def index
    @subcategories = Subcategory.all
  end


  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(sub_categories_params)
    if @subcategory.save
      redirect_to admin_subcategories_path, notice: 'Subcategory successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @subcategory.update(sub_categories_params)
      redirect_to admin_subcategories_path, notice: 'Subcategory successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @subcategory.destroy
      flash[:notice] = 'Subcategory successfully deleted.'
    else
      flash[:alert] = 'Error in deleting the subcategory.'
    end
    redirect_to admin_subcategories_path
  end

  def load_brands
    @brands = @subcategory.brands
  end

  private
  def sub_categories_params
    params.require(:subcategory).permit(:name, :description, :category_id)
  end

  def set_subcategory
    @subcategory = Subcategory.friendly.find(params[:id])
  end

end
