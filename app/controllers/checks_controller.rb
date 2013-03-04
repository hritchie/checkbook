class ChecksController < ApplicationController
  def index
    @checks = Check.all
  end

  def show
    @check = Check.find(params[:id])
  end
end
