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
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end

    it "signing up redirects to the user's show page" do
      sign_up_as_test_user
      expect(current_path).to match(/^\/users\/(\d)+/)
    end

    it "remains on sign up page on failed sign up" do
      click_button "Sign Up"
      expect(page).to have_content "Sign Up"
    end
  end



  feature "logging in" do
    it "takes a password and a username" do
      expect(page).to have_content "Username"
      expect(page).to have_content "Password"
    end
    it "remains on sign in page after failed sing in" do
      click_button "Sign In"
      expect(page).to have_content "Sign In"
    end
    it "shows username on the homepage after login" do
      sign_in_test_user
      expect(page).to have_content "tester"
    end
  end

  
end
