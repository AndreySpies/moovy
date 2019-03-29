require "application_system_test_case"

class VideosTest < ApplicationSystemTestCase
  test "Visiting the New Video page" do
    login_as users(:user)
    visit '/videos/new'
    fill_in "video_name", with: "Biggest Movie"
    click_on "Create"

    visit '/videos/new'
    fill_in "video_name", with: "Smallest Movie"
    click_on "Create"

    visit '/'
    assert_selector "a", text: 'Biggest Movie'
    # save_and_open_screenshot
  end

  test "Should only have a delete button for video owner" do
    login_as users(:user)
    visit '/videos/new'
    fill_in "video_name", with: "Biggest Movie"
    click_on "Create"
    assert has_link?('Delete video')

    login_as users(:user2)
    visit 'videos/1-biggest-movie.m3u8'
    assert has_no_link?('Delete Video')
  end

  test 'Video owner can delete their video' do
    login_as users(:user)
    visit '/videos/new'
    fill_in "video_name", with: "Delete Movie"
    click_on "Create"

    click_on "Delete video"
    assert has_no_link?("Delete Movie")
  end
end
