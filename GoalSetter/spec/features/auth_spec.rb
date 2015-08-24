require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit "/users/new"
  end


  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      expect(page).to have_content "Username"
    end

    it "takes a password on the sign up page" do
      expect(page).to have_content "Password"
    end

    it "ensures that a username is given" do
      click_button "Sign Up"
      expect(page).to have_content "Username can't be blank"
    end

    it "ensures that a password is at least 6 characters" do
      fill_in "Username", with: "tester"
      fill_in "Password", with: "pass"
      click_button "Sign Up"
      expect(page).to have_content "Password must be at least 6 characters"
    end

    it "signing up redirects to the user's show page" do
      sign_up_as_test_user
      expect(page).to have_content "tester"
    end

    it "remains on sign up page on failed sign up" do
      click_button "Sign Up"
      expect(page).to have_content "Sign Up"
    end
  end
end
