require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = Article.create(title: 'FirstA', description: 'Bla bla bla bla')
  end

  test 'should show article' do
    get @article_url
    assert_response :success
  end

  test 'Should get new' do
    get new_article_url
    assert_redirected_to login_url
  end

  test 'should create article' do
    assert_difference('Article.count', 0) do
      post articles_url, params: { article: { title: 'Travel' } }
    end
  end
end
