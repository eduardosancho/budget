require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe 'Test validations' do
    before(:all) do
      @user = User.new(name: 'Parmenio', email: 'parmenio@email.com', password: '123456',
                       password_confirmation: '123456')
      @user.skip_confirmation!
      @user.save

      @category = Category.create(user: @user, name: 'Running')
    end

    subject do
      @operation = Operation.new(author: @user, name: 'Diesel', amount: 2.02, categories: [@category])
    end

    before { subject.save }

    it 'should be valid if it has an author, name, amount, and categories' do
      expect(subject).to be_valid
    end

    it 'should not be valid if author is missing' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'should have a default amount of 2.02' do
      expect(subject.amount).to eql 2.02
    end
  end
end
