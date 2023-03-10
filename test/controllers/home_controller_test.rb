# Diet Support Program
# Copyright (C) 2023 David A. Taylor of Taylored Web Sites (tayloredwebsites.com)
# Licensed under AGPL-3.0-only.  See https://opensource.org/license/agpl-v3/

require "test_helper"
require "helpers/nokogiri_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include Capybara::DSL

  setup do
    @user = FactoryBot.create(:user)
    sign_in(@user)
  end

  # called after every single test
  teardown do
    # # when controller is using cache it may be a good idea to reset it afterwards
    # Rails.cache.clear
  end

  test "logged in user should get index and see links" do
    get home_index_url
    assert_response :success
    page = Nokogiri::HTML.fragment(response.body)
    assert_at_page(page, 'Food Nutrients Home')
    linksH = get_links_hashes(page)
    # make sure we have 5 links for the header, two for each food_nutrient action (edit, delete), and the 'new' action at the bottom
    assert_equal(5+4, linksH[:count])
    # make sure that we have the correct links on the page
    assert_page_headers(page, linksH)
    assert_link_has(linksH, {
      :link_text => "Foods Listing",
      :link_url => "/foods",
    })
    assert_link_has(linksH, {
      :link_text => "Nutrients Listing",
      :link_url => "/nutrients",
    })
    assert_link_has(linksH, {
      :link_text => "Database Diagrams",
      :link_url => "/diagrams.html",
    })
    assert_link_has(linksH, {
      :link_text => "Sign Out",
      :link_url => "/signout",
    })
  
  end

end
