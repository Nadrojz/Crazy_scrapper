require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)
  page_email = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com#{townhall_url[1..-1]}"))
  townhall_email = page_email.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  townhall_name = townhall_url[5..-6]
  {townhall_name => townhall_email}
end

#puts get_townhall_email('m/95/beaumont-sur-oise.html')

def townhall_urls
  page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  townhall_urls = page.xpath('//a[@class="lientxt"]/@href')
end

def perform
  final_array = []
  array_townhall = townhall_urls
  array_townhall.each do |url|
    final_array <<  get_townhall_email(url.text)
  end
  final_array
end

puts perform
