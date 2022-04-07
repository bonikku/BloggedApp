require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'User', email: 'user@user.com', password: 'password')
    @article = Article.new(title: 'Title new', description: 'Lorem Ipsum Lorem Ipsum', user_id: @user.id)
  end

  test 'article should be valid' do
    assert @article.valid?
  end

  test 'article should have a user' do
    @article.user_id.present?
    assert @article.valid?
  end

  test 'title should be present' do
    @article.title = ' '
    assert_not @article.valid?
  end

  test 'description should be present' do
    @article.description = ' '
    assert_not @article.valid?
  end

  test 'title should not be too long' do
    @article.title = 'a' * 101
    assert_not @article.valid?
  end

  test 'description should not be too long' do
    @article.description = 'a' * 2501
    assert_not @article.valid?
  end

  test 'title should not be too short' do
    @article.title = 'a'
    assert_not @article.valid?
  end

  test 'description should not be too short' do
    @article.description = 'a'
    assert_not @article.valid?
  end
end