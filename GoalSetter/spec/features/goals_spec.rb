require 'spec_helper'
require 'rails_helper'

feature "goal creation" do
  before :each do
    sign_in_as_test_user
  end

  it "has a link to new goal" do
    expect(page).to have_content "Create New Goal"
  end

  feature "creating a goal" do
    before :each do
      click_link "Create New Goal"
    end

    it "allows text of goal" do
      expect(page).to have_content "Text"
    end

    it "can be set to private" do
      expect(page).to have_content "Private"
    end

    it "ensures that goal has text" do
      click_button "Add New Goal"
      expect(page).to have_content "Text can't be blank"
    end
  end

  feature "editing a goal" do
    before :each do
    end

  end



end
