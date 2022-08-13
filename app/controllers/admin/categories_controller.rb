class Admin::CategoriesController < Admin::BaseController
  include CategoriesConcern
  before_action :set_category, only: %i[edit show destroy update load_subcategories]
  before_action :load_categories, only: %i[index]

  def index; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)

    if @category.save
      redirect_to admin_categories_path, notice: 'Category successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @category.update(categories_params)
      flash[:notice] = 'Category successfully updated.'
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = 'Category successfully deleted.'
    else
      flash[:alert] = 'Error in deleting the category.'
    end
    redirect_to admin_categories_path
  end

  def load_subcategories
    @subcategories = @category.subcategories
  end

  private
  def categories_params
    params.require(:category).permit(:name, :description)
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end
