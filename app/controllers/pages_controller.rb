class PagesController < ApplicationController
  def index
    @pages = Pages.sorted
  end

  def show
    @page = Pages.find(params[:id])
  end

  def new
    @page = Pages.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      redirect_to(page_path(@page))
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(pages_path)
  end

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink)
  end
end
