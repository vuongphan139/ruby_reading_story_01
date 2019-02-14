require 'rails_helper'

RSpec.describe Interactive, type: :model do
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:interactive_type).of_type(:integer)}
      it {should have_db_column(:user_id).of_type(:integer)}
      it {should have_db_column(:story_id).of_type(:integer)}
    end
  end
end
