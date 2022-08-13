class Admin::SocialPagesController < Admin::BaseController
  before_action :set_social_page, only: %i[edit show destroy update]

  def index
    @social_pages = SocialPage.all
  end

  def show;end

  def new
    @social_page = SocialPage.new
  end

  def create
    @social_page = SocialPage.new(social_page_params)

    if @social_page.save
      redirect_to admin_social_page_path(@social_page), notice: 'Social page successfully created.'
    else
      render :new
    end
  end

  def edit;end

  def update
    if @social_page.update(social_page_params)
      redirect_to admin_social_page_path(@social_page),notice: "Social page updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @social_page.destroy
      flash[:notice] = "Social page is deleted successfully"
    else
      flash[:alert] = 'Error in deleting the social page.'
    end
    redirect_to admin_social_pages_path

  end

  private
  def social_page_params
    params.require(:social_page).permit( :facebook_url, :twitter_url, :email_url, :instagram_url, :trailer_video_url)
  end

  def set_social_page
    @social_page = SocialPage.find_by_id(params[:id])
  end
end
