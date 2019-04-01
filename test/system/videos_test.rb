require "application_system_test_case"

class VideosTest < ApplicationSystemTestCase
  test 'Visiting the New Video page' do
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
    assert_selector "a", text: 'Biggest Movie'
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

    assert has_no_link?("Delete Movie")
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
end
