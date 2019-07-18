require 'nokogiri'
require 'open-uri'


def get_depute_email(url)
  page_email = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr#{url}"))
  depute_email = page_email.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
  full_name = page_email.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1').text
  array_name = full_name.split(" ")
  first_name = array_name[1]
  last_name = array_name[2..-1].join(" ")
  infos = {'first_name' => first_name, 'last_name' => last_name, 'email' => depute_email}
  return infos
end

def get_depute_urls
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  url = page.xpath('//*[@id="deputes-list"]/div/ul/li/a')
  url_depute = url.to_s.scan(/"([^"]*)"/)
  return url_depute
end

def perform
  final_array = []
  array_url = get_depute_urls
  url_depute = get_depute_urls
  array_url.each do |url|
    final_array << get_depute_email(url.join)
  end
  final_array
end

puts perform
