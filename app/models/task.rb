class Task < ApplicationRecord
  belongs_to :parent, optional: true
  has_many :children, foreign_key: :parent_id, class_name: "Task", dependent: :destroy
  validates :label, presence: true

  scope :root, -> { where(parent_id: nil) }
end
