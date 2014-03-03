class WelcomeController < ApplicationController
  require 'rubygems'
  require 'json'
  require 'pp'
  require 'open-uri'

  def index
    address= params[:address]
    #if address.nil?
    #  address = "Delhi,India"
    #end
    #@json_response=File.read('D:\projects\ruby\forheroku\placesearch\app\controllers\result.json')
    #@json_response=File.read('D:\projects\ruby\forheroku\placesearch\app\controllers\result2.json')

    url="https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{address}&sensor=true&key=AIzaSyD9r1peompoZwg8PCZYZnL7B3V58X466fI".force_encoding('ASCII-8BIT')
    url = url.force_encoding('ASCII-8BIT')
    url= URI::encode(url)
    contents = open(url)
    @json_response = contents.read
    @parsed_results = JSON.parse(@json_response)

    if @parsed_results['status']
      flash[:notice] = "Query Status: #{@parsed_results['status']}."
    end
    #@parsed_results["results"].each do |result|
    #  p result
    #end

    respond_to do |format|
      format.js { render :index }
      format.html { render :index }
    end
  end
end
