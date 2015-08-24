require 'spec_helper'
require 'rails_helper'

feature "commenting" do
  feature "comment on user page" do
    before :each do
      sign_up("Sennacy")
      visit "/goals"
      make_public_goal
      sign_out
      sign_up("Breakfast")
      visit "/users/1/"
    end

    feature "comment creation" do
      it "allows comments to be added from the user page" do
        expect(page).to have_content "Add Comment"
      end

      it "directly adds comments to the page" do
        fill_in "Comment", with: "test comment"
        click_button "Add Comment"
        expect(page).to have_content "test comment"
      end

      it "should remain on the user page after submitting a comment" do
        fill_in "Comment", with: "test comment"
        click_button "Add Comment"
        expect(page).to have_content "test comment"
        expect(page).to have_content "Sennacy"
      end

      it "should validate that comments have content" do
        click_button "Add Comment"
        expect(page).to have_content "can't be blank"
      end
    end

    feature "delete comments" do
      before :each do
        sign_up("Sennacy")
        visit "/goals"
        make_public_goal
        sign_out
        sign_up("Breakfast")
        visit "/users/1/"
        make_comment("first comment")
      end

      it "removes comment from page" do
        expect(page).to have_content "Delete Comment"
      end

      it "allows the commenter to delete the comment" do
        click_button "Delete Comment"
        expect(page).not_to have_content "first comment"
      end

      it "allows the user page owner to delete the comment" do
        sign_out
        sign_in("Sennacy")
        visit "/users/1/"
        click_button "Delete Comment"
        expect(page).not_to have_content "first comment"
      end

      it "doesn't allow anyone else to delete the comment" do
        sign_out
        sign_up("Unauthorized")
        visit "/users/1/"
        expect(page).not_to have_content "Delete Comment"
      end

    end
  end


  feature "comment on goal page" do
    before :each do
      sign_up("Sennacy")
      visit "/goals"
      make_public_goal
      sign_out
      sign_up("Breakfast")
      visit "/goals/1/"
    end

    feature "adding comments to goal page" do

      it "allows comments to be added to goal page" do
        expect(page).to have_content "Add Comment"
      end

      it "adds comments directly to goal page" do
        make_comment("first comment")
        expect(page).to have_content "first comment"
      end

      it "remains on goal page after adding comment" do
        make_comment("first comment")
        expect(page).to have_content "first comment"
        expect(page).to have_content "test public goal"
      end

      it "validates that comment has content" do
        click_button "Add Comment"
        expect(page).to have_content "can't be blank"
      end

    end

    feature "deleting comments from goal page" do
      before :each do
        sign_up("Sennacy")
        visit "/goals"
        make_public_goal
        sign_out
        sign_up("Breakfast")
        visit "/goals/1/"
        make_comment("first comment")
      end

      it "allows comments to be deleted" do
        expect(page).to have_content "Delete Comment"
      end

      it "allows commenter to delete comment" do
        click_button "Delete Comment"
        expect(page).not_to have_content "first commment"
      end

      it "allows goal owner to delete comment" do
        sign_out
        sign_in("Sennacy")
        visit "/goals/1"
        click_button "Delete Comment"
        expect(page).not_to have_content "first comment"
      end

      it "doesn't allow anyone else to delete comment" do
        sign_out
        sign_up("Unauthorized")
        visit "/goals/1"
        expect(page).not_to have_content "Delete Comment"
      end

      it "remains on goal page after deletion" do
        click_button "Delete Comment"
        expect(page).to have_content "test public goal"
      end

    end

  end
end
