class Admin::StaticPagesController < Admin::BaseController
  before_action :set_static_page, only: %i[ show edit update destroy ]

  def index
    @static_pages = StaticPage.all
  end

  def show; end

  def new
    @static_page = StaticPage.new
  end

  def edit; end

  def create
    @static_page = StaticPage.new(static_page_params)
    if @static_page.save
      redirect_to admin_static_pages_path, notice: 'Static page successfully created.'
    else
      render :new
    end
  end

  def update
    if @static_page.update(static_page_params)
      redirect_to admin_static_pages_path, notice: "Static page successfully updated."
    else
      render :edit
    end
  end

  def destroy
    if @static_page.destroy
      flash[:notice] = 'Static page successfully deleted.'
    else
      flash[:alert] = 'Error in deleting the static page.'
    end
    redirect_to admin_static_pages_path
  end

  private
    def set_static_page
      @static_page = StaticPage.friendly.find(params[:id])
    end

    def static_page_params
      params.require(:static_page).permit(:name, :title, :content)
    end
end
