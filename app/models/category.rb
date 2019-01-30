class Category < ApplicationRecord
	validates_presence_of :name

	DELETED = 0
	ACTIVE = 1
	INACTIVE = 2
	
	enum state: {
		deleted: DELETED,
		active: ACTIVE,
		inactive: INACTIVE
	}
end
