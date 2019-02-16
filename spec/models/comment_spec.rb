require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:content).of_type(:string)}
      it {should have_db_column(:user_id).of_type(:integer)}
      it {should have_db_column(:story_id).of_type(:integer)}
    end
  end

  describe "validates" do
    it {should validate_presence_of(:content)}
    it {should validate_presence_of(:user)}
  end

  describe "associations" do
    it {should belong_to :story}
    it {should belong_to :user}
  end

end
