require "rails_helper"

RSpec.describe Story, type: :model do
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:name).of_type(:string)}
      it {should have_db_column(:author_name).of_type(:string)}
      it {should have_db_column(:cover_image).of_type(:string)}
      it {should have_db_column(:progress).of_type(:integer)}
      it {should have_db_column(:description).of_type(:string)}
      it {should have_db_column(:user_id).of_type(:integer)}
    end
  end

  describe "validates" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:progress)}
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:author_name)}
    it {should validate_presence_of(:description)}
  end

  describe "associations" do
    it {should belong_to :user}
    it {should have_many :chapters}
  end
end
