require 'nokogiri'
require 'open-uri'

def analyzed_page
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  return page
end

def crypto_name
  array_name = []
  page = analyzed_page
  page.xpath('//*[@id]/td[3]').each {|link| array_name << link.content}
  return array_name
end


def crypto_price
  array_price = []
  page = analyzed_page
  page.xpath('//*[@id]/td[5]/a').each {|link| array_price << link.content[1..-1]}
  return array_price
end

def integrate
  i=0
  symbol = crypto_name
  price = crypto_price
  final_array = []
  hash = {}
  symbol.length.times do |i|
    hash = {symbol[i] => price[i].to_f}
    final_array << hash
  end
  return final_array
end

def perform
  currency_name = currency_name
  currency_price = currency_price
  integrate
end

puts perform
