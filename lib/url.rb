module Url
  attr_reader :url, :params

  def set_url(url = "")
    @url = url
  end

  def set_params(params = {})
    @params = params
  end

  def full_url
    "#{@url}?#{params_string}"
  end

  private
  def params_string
    @params.inject([]) do |result, pair|
      key, value = pair
      value.present? ? result << "#{key.to_s}=#{CGI::escape(value.to_s)}" : result
    end.join('&')
  end
end