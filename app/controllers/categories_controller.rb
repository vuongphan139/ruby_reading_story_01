class CategoriesController < ApplicationController
  before_action :logged_in_user, :admin_permission

  def index
    @category = Category.new
    @categories = Category.page(params[:page])
                          .per Settings.categories_per_page
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = t "add_category_successful"
      redirect_to categories_path
    else
      flash.now[:danger] = t "add_category_failed"
      render :index
    end
  end

  def destroy
    @category = Category.find_by id: params[:id]

    if @category.destroy
      flash[:success] = t "deleted_category"
      redirect_to categories_path
    else
      flash.now[:danger] = t "delete_category_failed"
      render :index
    end
  end

  private

  def admin_permission
    return if current_user.admin?
    flash[:danger] = t "not_allowed_access_page"
    redirect_to root_path
  end

  def category_params
    params.require(:category).permit :name, :description
  end
end
