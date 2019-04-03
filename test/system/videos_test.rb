require "application_system_test_case"

class VideosTest < ApplicationSystemTestCase
  test 'User not logged in can not create a video' do
    visit '/videos/new'

    assert_selector 'h2', text: 'Welcome'
  end
  test 'Users can create a video' do
    login_as users(:user)
    visit '/videos/new'
    fill_in 'video_name', with: 'Biggest Movie'
    page.attach_file("video_miniature", Rails.root + 'app/assets/images/home-banner-2.jpg')
    click_on 'Create video'
    visit '/videos/new'
    fill_in 'video_name', with: 'Smallest Movie'
    page.attach_file("video_miniature", Rails.root + 'app/assets/images/home-banner-2.jpg')
    click_on 'Create video'
    visit '/'

    assert_selector 'a', text: 'Biggest Movie'
    assert_selector 'a', text: 'Smallest Movie'
  end

  test 'Should only have a delete/edit button for video owner' do
    login_as users(:user)
    visit '/videos/new'
    fill_in 'video_name', with: 'Biggest Movie'
    page.attach_file("video_miniature", Rails.root + 'app/assets/images/home-banner-2.jpg')
    click_on 'Create video'
    assert has_link?('Delete video')
    assert has_link?('Edit video')
    login_as users(:user2)
    visit '/'
    click_on 'Biggest Movie'

    assert has_no_link?('Delete Video')
    assert has_no_link?('Edit video')
  end

  test 'Video owner can delete their video' do
    login_as users(:user)
    visit '/videos/new'
    fill_in 'video_name', with: 'Delete Movie'
    page.attach_file("video_miniature", Rails.root + 'app/assets/images/home-banner-2.jpg')
    click_on 'Create video'
    click_on 'Delete video'
    page.driver.browser.switch_to.alert.accept
    assert has_no_link?('Delete Movie')
  end

  test 'Video onwer can edit their video' do
    login_as users(:user)
    visit '/videos/new'
    fill_in 'video_name', with: 'Edit Movie'
    page.attach_file("video_miniature", Rails.root + 'app/assets/images/home-banner-2.jpg')
    click_on 'Create video'
    click_on 'Edit video'
    fill_in 'video_name', with: 'Movie edit test'
    click_on 'Update video'

    assert_selector 'h1', text: 'Movie edit test'
  end

  test 'Users can see collections of an user' do
    login_as users(:user)
    visit '/videos/new'
    fill_in 'video_name', with: 'First Movie'
    page.attach_file("video_miniature", Rails.root + 'app/assets/images/home-banner-2.jpg')
    click_on 'Create video'
    visit '/videos/new'
    fill_in 'video_name', with: 'Second Movie'
    page.attach_file("video_miniature", Rails.root + 'app/assets/images/home-banner-2.jpg')
    click_on 'Create video'
    visit '/UserOne'

    assert_selector 'a', text: 'First Movie'
    assert_selector 'a', text: 'Second Movie'
  end

  test 'Any user can see videos of another user and video views should increase' do
    login_as users(:user)
    visit '/videos/new'
    fill_in 'video_name', with: 'Another User Movie'
    page.attach_file("video_miniature", Rails.root + 'app/assets/images/home-banner-2.jpg')
    click_on 'Create video'
    login_as users(:user2)
    visit '/'
    click_on 'Another User Movie'

    assert_selector 'h1', text: 'Another User Movie'
    assert_selector 'p', text: 'Views: 2'
    save_and_open_screenshot
  end
end
