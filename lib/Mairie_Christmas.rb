require 'nokogiri'
require 'open-uri'
require 'pp'

def get_mairie_names #méthode pour scrapper les noms de toutes les mairies
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    mairie_name = []
    mairie = page.xpath("//a[@class='lientxt']")
    mairie.map{ |mairie| mairie_name << mairie.text}
	return  mairie_name
end

def get_mairie_urls #méthode pour scrapper l'url de toutes les mairies
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	url_array = []
	urls = page.xpath('//*[@class="lientxt"]/@href')
	urls.each do |url|
		url = "http://annuaire-des-mairies.com" + url.text[1..-1] 
		url_array << url
	end
	return url_array
end

def get_mairie_emails #méthode pour scrapper les emails de toutes les mairies
	url = get_mairie_urls
	email = []
	url.length.times do |index|
		page = Nokogiri::HTML(open(url[index]))
		email << page.xpath('//*[contains(text(), "@")]').text
	end
	return email
end

def mairie_info #méthode pour associés leurs noms avc leurs emails
	names = get_mairie_names
	emails = get_mairie_emails
	mairie_info = []
	names.length.times { |index| mairie_info << {names[index] => emails[index]} }
	return mairie_info
end


def perform
	#print get_mairie_names
	#print get_mairie_urls
	#print get_mairie_emails
	puts "Voici les noms et les mails de toutes les mairies du Val d'Oise :"
	pp mairie_info
end

perform