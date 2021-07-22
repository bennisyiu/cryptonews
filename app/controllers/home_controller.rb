class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    # Get price data
    @price_url = 'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDT,ADA,DOGE,XRP,DOT,USDC,UNI&tsyms=USD'
    @price_uri = URI(@price_url)
    @price_response = Net::HTTP.get(@price_uri)
    @prices = JSON.parse(@price_response)

    # Get news data

    @url = 'https://min-api.cryptocompare.com/data/v2/news/?lang=EN'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @news = JSON.parse(@response)
  end

  def prices
    require 'net/http'
    require 'json'
    @symbol = params[:sym]
    @symbol = @symbol.upcase


    # Get price data
    @quote_url = 'https://min-api.cryptocompare.com/data/quotemultifull?fsyms=#{@symbol}&tsyms=USD'
    @quote_uri = URI(@quote_url)
    @quote_response = Net::HTTP.get(@quote_uri)
    @quote = JSON.parse(@quote_response)

  end
end
