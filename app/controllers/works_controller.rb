class WorksController < ApplicationController
  def index
    @works = Work.search(params[:search])
                 .paginate(page: params[:page], per_page: 10)
  end
end
