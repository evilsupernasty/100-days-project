class Project < ApplicationRecord
  belongs_to :user

  validates :title, :start_date, presence: true
end
