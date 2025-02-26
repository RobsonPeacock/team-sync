class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  enum :status, %i(active archived)

  validates :name, presence: true
end
