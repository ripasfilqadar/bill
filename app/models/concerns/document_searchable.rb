module DocumentSearchable
  extend ActiveSupport::Concern
  included do
    searchkick word_start: [:title, :content], callbacks: true
  end
	def search_data
    {
      title: title,
      content: content,
      description: description,
      type: data_content_type,
      category_id: category_id,
      state: state
    }
  end
	
	class Search
    extend ActiveModel::Naming
    include ActiveModel::Conversion

    attr_reader :page, :per_page, :keywords, :category_id, :file_type

    def initialize(params)
      @page             = params[:page] || 1
      @per_page         = params[:per_page] || 24
      @keywords         = params[:keywords].presence || '*'
      @file_type				= params[:file_type].presence
      @category_id      = params[:category_id].presence
    end

    def searchkicked
      @searchkicked ||= begin
        args = default_args
        where = {}
        where[:category_id] = category_id if category_id.present?
        where[:type] = file_type if file_type.present?
        ::Document.search keywords, args.merge({where: where})
      end
    end

    def results
      searchkicked.results
    end

    def total
      searchkicked.total_count
    end

    def default_args
      {
        order: {title: :asc},
        per_page: per_page,
        page: page,
        fields: [{title: :word_start}, {content: :word_start}],
        state: 1
      }
    end
  end	
end