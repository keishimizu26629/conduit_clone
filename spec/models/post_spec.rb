require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Postモデルのバリデーション' do
    let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }

    it 'Postが問題なく作成されること' do
      post = Post.new(title: '55555', user_id: user.id, content: 'Valid content')
      expect(post).to be_valid
    end

    it 'タイトルが100文字以内で通ること' do
      post = Post.new(title: 'a' * 100, user_id: user.id, content: 'Valid content')
      expect(post).to be_valid
    end

    it 'タイトルが5文字未満で通らないこと' do
      post = Post.new(title: '4444', user_id: user.id, content: 'Valid content')
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("is too short (minimum is 5 characters)")
    end

    it 'タイトルが100文字より多い文字列で通らないこと' do
      post = Post.new(title: nil, user_id: user.id, content: 'Valid content')
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'タイトルが空白で通らないこと' do
      post = Post.new(title: nil, user_id: user.id, content: 'Valid content')
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'User_idが空白で通らないこと' do
      post = Post.new(title: 'Short', user_id: nil, content: 'Valid content')
      expect(post).not_to be_valid
      expect(post.errors[:user_id]).to include("can't be blank")
    end

    it 'Contentが空白で通らないこと' do
      post = Post.new(title: 'Short', user_id: user.id, content: nil)
      expect(post).not_to be_valid
      expect(post.errors[:content]).to include("can't be blank")
    end
  end
end
