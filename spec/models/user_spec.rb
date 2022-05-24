require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test validations' do
    subject { User.new(name: 'Willy', email: 'willy@email.com', password: '123456', password_confirmation: '123456') }

    before do
      subject.skip_confirmation!
      subject.save
    end

    it 'should be valid if the name contains text' do
      expect(subject).to be_valid
    end

    it 'should not be valid if name is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid if email is nil' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should not be valid if password has less than 6 characters' do
      subject.password = 'abc'
      expect(subject).to_not be_valid
      subject.password = '54321'
      expect(subject).to_not be_valid
    end
  end
end
