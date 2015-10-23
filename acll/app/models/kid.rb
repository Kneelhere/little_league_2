class Kid < ActiveRecord::Base
	belongs_to :user
	belongs_to :team
end
