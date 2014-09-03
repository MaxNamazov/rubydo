class Task < ActiveRecord::Base
  belongs_to :project
  acts_as_list scope: :project
  default_scope {order("position ASC")}
  validates :name, presence: true
  validates :project, presence: true
end
