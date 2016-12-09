class WorksController < ApplicationController
  def index
    @works = Work.where('title LIKE ? OR keywords LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
  end
end
