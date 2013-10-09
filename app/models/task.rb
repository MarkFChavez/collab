class Task < ActiveRecord::Base
  attr_accessible :task

  belongs_to :project
  belongs_to :user

  validates :task, presence: true
end
