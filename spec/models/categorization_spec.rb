require 'rails_helper'

RSpec.describe Categorization, type: :model do
  describe 'Test associations' do
    before(:all) do
      @user = User.new(name: 'Arnold', email: 'arnold@email.com', password: '123456', password_confirmation: '123456')
      @user.skip_confirmation!
      @user.save

      @category = Category.create(user: @user, name: 'Medical')

      @operation = Operation.create(author: @user, name: 'Cough Syrup')
    end

    subject do
      @categorization = Categorization.new(operation: @operation, category: @category)
    end

    before { subject.save }

    it 'should be valid if it has an operation and a category' do
      expect(subject).to be_valid
    end

    it 'should not be valid if operation is missing' do
      subject.operation = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid if category is missing' do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end
