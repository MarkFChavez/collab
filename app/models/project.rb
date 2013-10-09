class Project < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :description, presence: true
  
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :tasks, dependent: :destroy
  belongs_to :owner, foreign_key: "user_id", class_name:"User"
end
