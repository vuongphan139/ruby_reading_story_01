require "rails_helper"

RSpec.describe User, type: :model do
  describe "db schema" do
    context "columns" do
      it {should have_db_column(:account_name).of_type(:string)}
      it {should have_db_column(:avatar).of_type(:string)}
      it {should have_db_column(:admin).of_type(:boolean)}
      it {should have_db_column(:remember_digest).of_type(:string)}
      it {should have_db_column(:activated).of_type(:boolean)}
      it {should have_db_column(:activation_digest).of_type(:string)}
      it {should have_db_column(:activated_at).of_type(:datetime)}
      it {should have_db_column(:email).of_type(:string)}
      it {should have_db_column(:name).of_type(:string)}
      it {should have_db_column(:password_digest).of_type(:string)}
    end
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should have_secure_password}
    it {should validate_length_of(:password)}
  end

  describe "associations" do
    it {should have_many :stories}
  end
end
