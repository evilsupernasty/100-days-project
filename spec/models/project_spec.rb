require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is valid with valid attributes" do
    project = Project.new(title: "Title", start_date: Date.current.to_s(:db), user_id: 1)
    expect(project).to be_valid
  end

  it "is not valid without a title" do
    project = Project.new(title: nil)
    expect(project).to_not be_valid
  end

  it "is not valid without a start_date"
end
