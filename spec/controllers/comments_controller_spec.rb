require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:logged_in_user) { User.create(email: "a@a.com", password: "abc123") }
  let(:post_creator) { User.create(email: 'b@b.com', password: 'cde567') }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(logged_in_user)
  end

  describe "POST /posts/:post_id/comments" do
    it "creates a comment" do
      @post = Post.create(message: "Hello, world!", user: post_creator)
      post :create, params: { post_id: @post.id, comment: { body: "Some comment" } }
      expect(Comment.find_by(body: "Some comment")).to be
      expect(response).to redirect_to(post_url(@post.id))
    end
  end

end
