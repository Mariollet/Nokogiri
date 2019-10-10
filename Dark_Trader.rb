require 'nokogiri'
require 'open-uri'
require 'pp'

def crypto_name_scrapper #méthode pour scrapper les noms de toutes les cryptos
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    crypto_name = []
    crypto = page.xpath("//td[3]")
	crypto.map{ |crypto| crypto_name << crypto.text}
	return crypto_name
end

def crypto_price_scrapper #méthode pour scrapper les prix de toutes les cryptos
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    crypto_price = []
    crypto = page.xpath("//td[5]/a")
	crypto.map{ |crypto| crypto_price << crypto.text.delete('$').to_f}
	return crypto_price
end

def crypto_all #méthode pour associés leurs noms avc leurs valeurs
	crypto_all = []
	crypto_name = crypto_name_scrapper
	crypto_price = crypto_price_scrapper
	total = crypto_name.length
	crypto_name.length.times { |index| crypto_all << {crypto_name[index] => crypto_price[index]} }
	return crypto_all
end

def perform
#print crypto_name_scrapper
#print crypto_price_scrapper
puts "Voici le cours de toutes les cryptomonnaies du marché :"
pp crypto_all
end

perform