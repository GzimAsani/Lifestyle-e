require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = article(:one)
  end



  test "creating a Category" do
    visit articles_url
    click_on "New Article"

    click_on "Create Article"

    assert_text "Article was successfully created"
    click_on "Back"
  end
end
