class LicensesController < ApplicationController
  def index
    @licenses = License.all
    if params[:search]
      @licenses = License.search(params[:search])
    else
      @licenses = License.all
    end
  end

  def new
  end

  def create
    @license = License.new(license_params)
    if @license.save
      redirect_to license_url(@license)
    else
      flash.now[:errors] = @license.errors.full_messages
      render :new
    end
  end

  def show
    @license = License.find(params[:id])
    render :show
  end

  def destroy
    @license = License.find(params[:id])
    @license.destroy
    redirect_to root_url
  end

  private

  def license_params
    params.require(:license).permit(:body)
  end

end
