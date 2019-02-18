require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:follower_id).of_type(:integer)}
      it {should have_db_column(:followed_id).of_type(:integer)}
    end
  end
end
