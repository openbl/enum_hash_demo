require 'rails_helper'

RSpec.describe Post, type: :model do
  context "#kind" do
    it "handles identical key-value enum values" do
      post = Post.new(kind: Post.kinds[:announcement])

      expect(post.read_attribute_before_type_cast(:kind)).to eq(Post.kinds[:announcement])
      expect(post.kind).to eq(Post.kinds[:announcement])
    end

    it "handles non-identical key-value enum values" do
      post = Post.new(kind: Post.kinds[:article])

      expect(post.read_attribute_before_type_cast(:kind)).to eq(Post.kinds[:article])
      # Failure/Error: expect(post.kind).to eq(Post.kinds[:article])
      #
      #   expected: "discussion"
      #        got: "article"
      #
      #   (compared using ==)
      expect(post.kind).to eq(Post.kinds[:article])
    end
  end
end
