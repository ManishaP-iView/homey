class Project < ApplicationRecord
	include PublicActivity::Model
  tracked

	has_many :comments

	enum status: [:active, :inactive]
end
