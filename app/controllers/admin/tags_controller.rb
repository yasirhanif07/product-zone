class Admin::TagsController < Admin::BaseController
  before_action :set_tag, only: %i[edit show destroy update]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tags_params)

    if @tag.save
      redirect_to admin_tags_path, notice: 'Tag successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @tag.update(tags_params)
      redirect_to admin_tags_path, notice: 'Tag successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      flash[:notice] = 'Tag is deleted successfully.'
    else
      flash[:alert] = 'Error in deleting the tag.'
    end
    redirect_to admin_tags_path
  end

  private
  def tags_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find_by_id(params[:id])
  end
end
