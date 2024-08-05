class QpsController < ApplicationController
  require 'net/http'
  require 'json'
 
  def index
    uri = URI('http://192.175.175.41:5000/qp/closed')
    response = Net::HTTP.get(uri)
    @qps = JSON.parse(response)
  end

  def end_qp
    qp_number = params[:qp_number]
    closing_date = params[:date]

    uri = URI("http://192.175.175.41:5000/qp/closed?number=#{qp_number}&closingdate=#{closing_date}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)

    response = http.request(request)

    if response.code == '200'
      render json: { status: "success", message: 'QP ended successfully'}
    else
      render json: { status: 'error', message: 'Failed to end QP'}
    end
  end
end
