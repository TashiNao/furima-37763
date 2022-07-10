require 'test_helper'

class FrimapagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get frimapages_index_url
    assert_response :success
  end
end
