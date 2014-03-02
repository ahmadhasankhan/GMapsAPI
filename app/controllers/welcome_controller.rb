class WelcomeController < ApplicationController
  require 'rubygems'
  require 'json'
  require 'pp'
  require 'open-uri'

  def index
  end

  def myquery
    #json_contents=File.read('D:\projects\ruby\placesearch\app\controllers\result.json')
    address= params[:address]
    url="https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{address}&sensor=true&key=AIzaSyD9r1peompoZwg8PCZYZnL7B3V58X466fI".force_encoding('ASCII-8BIT')
    url = url.force_encoding('ASCII-8BIT')
    url= URI::encode(url)
    contents = open(url)
    @json_response = contents.read
    @parsed_results = JSON.parse(@json_response)
    #@parsed_results["results"].each do |result|
    #  p result
    #end
  end

end
