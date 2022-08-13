module CategoriesConcern
  extend ActiveSupport::Concern

  def load_categories
    @categories = Category.all
  end
end