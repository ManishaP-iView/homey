class Comment < ApplicationRecord
	belongs_to :project

	include PublicActivity::Model
  tracked

	include ActionView::RecordIdentifier

	validates_presence_of :body

	after_create_commit { broadcast_append_to [project, :comments], target: "#{dom_id(project)}_comments" }
end
