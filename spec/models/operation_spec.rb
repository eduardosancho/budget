require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe 'Test validations' do
    before(:all) do
      @user = User.new(name: 'Parmenio', email: 'parmenio@email.com', password: '123456',
                       password_confirmation: '123456')
      @user.skip_confirmation!
      @user.save

      @category = Category.create(user: @user, name: 'Medical')
    end

    subject do
      @operation = Operation.new(author: @user, name: 'Diesel', categories: [@category])
    end

    before { subject.save }

    it 'should be valid if it has an author' do
      expect(subject).to be_valid
    end

    it 'should not be valid if author is missing' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'should have a default amount of 0.00' do
      expect(subject.amount).to eql 0.00
    end
  end
end
