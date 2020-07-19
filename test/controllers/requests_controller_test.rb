require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
  end


  test "should get index" do
    get '/api/v1/requests', as: :json
    assert_response :success
  end

  # Data types
  test "should not create if title is not string" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: 123901249,
        request_type: "One-time task",
        description: "This is the description of the request. Keep in mind that the description is expected to exceed 30 characters in order to be added to the backend DB. Also, it's supposed to have a length inferior to 300 characters. Make sure it's the case to have a valid input.",
        location: "43.290165506, 5.36916519",
        fullfilled: false
        }
      }, as: :json
    end
  end

  test "should not create if type is not string" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: "please help me",
        request_type: true,
        description: "This is the description of the request. Keep in mind that the description is expected to exceed 30 characters in order to be added to the backend DB. Also, it's supposed to have a length inferior to 300 characters. Make sure it's the case to have a valid input.",
        location: "43.290165506, 5.36916519",
        fullfilled: false
        }
      }, as: :json
    end
  end

  test "should not create if description is not string" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: "please help me",
        request_type: "One-time task",
        description: true,
        location: "43.290165506, 5.36916519",
        fullfilled: false
        }
      }, as: :json
    end
  end

  test "should not create if location is not string" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: "please help me",
        request_type: "One-time task",
        description: "This is the description of the request. Keep in mind that the description is expected to exceed 30 characters in order to be added to the backend DB. Also, it's supposed to have a length inferior to 300 characters. Make sure it's the case to have a valid input.",
        location: 1,
        fullfilled: false
        }
      }, as: :json
    end
  end

  test "should not create if id is not an integer" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: "random number",
        title: 123901249,
        request_type: "One-time task",
        description: "This is the description of the request. Keep in mind that the description is expected to exceed 30 characters in order to be added to the backend DB. Also, it's supposed to have a length inferior to 300 characters. Make sure it's the case to have a valid input.",
        location: "43.290165506, 5.36916519",
        fullfilled: false
        }
      }, as: :json
    end
  end

  test "should not create if fulfilled is not a boolean" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: 123901249,
        request_type: "One-time task",
        description: "This is the description of the request. Keep in mind that the description is expected to exceed 30 characters in order to be added to the backend DB. Also, it's supposed to have a length inferior to 300 characters. Make sure it's the case to have a valid input.",
        location: "43.290165506, 5.36916519",
        fullfilled: "random string, not a boolean"
        }
      }, as: :json
    end
  end

  # Input length
  test "should not create if title is below 10 characters" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: "help",
        request_type: "One-time task",
        description: "This is the description of the request. Keep in mind that the description is expected to exceed 30 characters in order to be added to the backend DB. Also, it's supposed to have a length inferior to 300 characters. Make sure it's the case to have a valid input.",
        location: "43.290165506, 5.36916519",
        fullfilled: false
        }
      }, as: :json
    end
  end

  test "should not create if title is more than 50 characters" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: "this title is very long and aims at testing if the user is writing a too detailed title. If he has more info to write, there's a description textarea!",
        request_type: "One-time task",
        description: "This is the description of the request. Keep in mind that the description is expected to exceed 30 characters in order to be added to the backend DB. Also, it's supposed to have a length inferior to 300 characters. Make sure it's the case to have a valid input.",
        location: "43.290165506, 5.36916519",
        fullfilled: false
        }
      }, as: :json
    end
  end

  test "should not create if description is less than 30 characters" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: "please help me",
        request_type: "One-time task",
        description: (0...21).map { ('a'..'z').to_a[rand(26)] }.join,
        location: "43.290165506, 5.36916519",
        fullfilled: false
        }
      }, as: :json
    end
  end

  test "should not create if description is more than 300 characters" do
    assert_no_difference('Request.count') do
      post '/api/v1/requests', params: { request: {
        id: 3451,
        title: "please help me",
        request_type: "One-time task",
        description: (0...350).map { ('a'..'z').to_a[rand(26)] }.join,
        location: "43.290165506, 5.36916519",
        fullfilled: false
        }
      }, as: :json
    end
  end

end
