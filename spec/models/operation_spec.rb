require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe 'Test validations' do
    before(:all) do
      @user = User.new(name: 'Arnold')
      @user.save
    end

    subject do
      @operation = Operation.new(author: @user, name: 'Dinner delivery')
    end

    before { subject.save }

    it 'should be valid if it has an author' do
      expect(subject).to be_valid
    end

    it 'should not be valid if author is missing' do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it 'should have a default amount of 0' do
      expect(subject.amount).to eql 0
    end
  end
end
