require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Test validations' do

    before(:all) do
      @user = User.new(name: 'Arnold')
      @user.save
    end

    subject do 
      @category = Category.new(user: @user, name: 'Groceries')
    end

    before { subject.save }

    it 'should be valid if it has a name' do
      expect(subject).to be_valid
    end

    it 'should not be valid if name is missing' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid if user is missing' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end
end
