require 'spec_helper'
require 'url'

describe Url do
  include Url

  describe "full_url" do
    let(:url) { "http://yahoo.com" }
    let(:code) { "abcde1234" }
    let(:param_url) { "https://google.com" }
    let(:param_encoded_url) { "https%3A%2F%2Fgoogle.com" }
    let(:params) {
      {
        code: code,
        url: param_url
      }
    }
    let(:full_encoded_url) { "#{url}?code=#{code}&url=#{param_encoded_url}" }

    it "should return full encoded url" do
      set_url(url)
      set_params(params)
      full_url.should == full_encoded_url
    end
  end
end