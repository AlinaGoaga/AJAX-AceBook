require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do

  let(:logged_in_user) { User.create(email: "a@a.com", password: "abc123") }
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(logged_in_user)
  end

  scenario "Can submit posts and view them" do
    submit_post
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can visit the individual post page and view the post and edit/delete buttons" do
    submit_post
    click_link "Hello, world!"
    expect(page).to have_content("Hello, world!")
    page.should have_selector(:link_or_button, 'Delete')
    page.should have_selector(:link_or_button, 'Edit')
  end

  scenario "Can visit the individual post page and post comments" do
    submit_post
    click_link "Hello, world!"
    fill_in "comment_body", with: "This is a new comment"
    click_button "Create Comment"
    expect(page).to have_content("This is a new comment")
  end

end
