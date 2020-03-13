class ScreensController < ApplicationController

  def show
    render params[:id]
  end
end
