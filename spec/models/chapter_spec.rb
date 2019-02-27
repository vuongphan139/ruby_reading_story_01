require "rails_helper"

RSpec.describe Chapter, type: :model do
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:name).of_type(:string)}
      it {should have_db_column(:content).of_type(:string)}
      it {should have_db_column(:progress).of_type(:integer)}
      it {should have_db_column(:story_id).of_type(:integer)}
    end
  end

  describe "validates" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:content)}
    it {should validate_presence_of(:story_id)}
    it {should validate_presence_of(:progress)}
  end

  describe "associations" do
    it {should belong_to :story}
  end
end
