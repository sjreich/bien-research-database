class WorksController < ApplicationController
  before_action :prepare_search_options, only: [:index]

  def index
    @works = Work.search(search_params)
                 .includes(:authors)
                 .paginate(page: params[:page], per_page: 10)
  end

  private

  def search_params
    params.permit(
      :full_search,
      :title,
      :author,
      :keywords,
      :published_after,
      :published_before,
      :language,
      :type_of_work
    ).select { |_, value| value.present? }
  end

  def prepare_search_options
    @languages = Work.distinct.pluck(:language)
    @types = Work.distinct.pluck(:type_of_work)
    @authors = Author.order(:last_name).map { |author| [author.to_s, author.id] }
  end
end
