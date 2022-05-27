require 'rails_helper'
RSpec.describe 'Categories', type: :system do
  before(:all) do
    User.destroy_all
    @user = User.new(name: 'Jamie', email: 'third@email.com', password: '123456', password_confirmation: '123456')
    @user.skip_confirmation!
    @user.save

    @category = Category.new(user: @user, name: 'Chase')
    @category.save
  end

  it 'to visit the categories page you need to sign in first' do
    visit categories_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  describe 'show list of categories' do
    before :each do
      visit new_user_session_path
      fill_in 'Email', with: 'third@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Log In'
    end

    it 'should display the list of categories' do
      expect(page).to have_content 'Categories List'
    end

    it "should display the category's name" do
      expect(page).to have_text('Chase')
    end

    it "should display the category's amount" do
      expect(page).to have_text('$0.00')
    end

    it 'should have a create category button' do
      expect(page).to have_link('Create category')
    end
  end
end
