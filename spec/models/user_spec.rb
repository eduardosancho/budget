require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test validations' do
    subject { User.new(name: 'Arnold') }

    before { subject.save }

    it 'should be valid if the name contains text' do
      expect(subject).to be_valid
    end

    it 'should not be valid if name is nil' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
