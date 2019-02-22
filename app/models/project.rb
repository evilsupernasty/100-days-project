class Project < ApplicationRecord
  Gutentag::ActiveRecord.call self
  belongs_to :user

  validates :title, :start_date, presence: true

  def tags_as_string
    tag_names.join(", ")
  end

  def tags_as_string=(string)
    self.tag_names = string.split(/,\s*/)
  end
end
