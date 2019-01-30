class Document < ApplicationRecord
	include DocumentSearchable
	# include LocalStorage
	
	has_attached_file :data,
	  path: ":rails_root/public/:system/upload/:reversed_path/:filename",
	  preserve_files: true

	belongs_to :category

	validates_presence_of :title

	DELETED = 0
	ACTIVE = 1
	INACTIVE = 2
	
	enum state: {
		deleted: DELETED,
		active: ACTIVE,
		inactive: INACTIVE
	}

	private

	def paperclip_path(path)
    ":rails_root/public/:system/#{path}"
  end

  def paperclip_url(path)
    "/:system/#{path}"
  end

end
