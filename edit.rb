require 'rubygems'
require 'bundler/setup'
require 'kconv'
require 'nokogiri'

require 'open-uri'
require 'openssl'


def strip(src, url = nil)

  src = src.toutf8.chars.map{ |s|
    s.valid_encoding? ? s : "\uFFFD"
  }.join("")

  dom = begin
    Nokogiri::HTML.parse(src, url, "UTF-8")
  rescue
    retry
  end

  dom.xpath('//style|//script').each{ |n|
    n.unlink
  }

  dom.xpath('//text()').each do |t|
    if t.content.strip.length > 0
      #puts t.parent
      puts t.path
      puts t.content.strip
      puts "========================================================"
    end
  end
  #ans = dom.xpath('//text()').map{ |n|
  #  n.content
  #}.join(' ').gsub(/\p{WSpace}+/,' ').strip
  #return ans
end


#file = File.open("test.html")
#doc = Nokogiri::HTML(file)
#file_url = 'https://stores.jp'
file_url = '/Users/hal0884/project/scraping_nokogiri/test.html'
doc = Nokogiri::HTML(open(file_url , :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
strip(doc.inner_html)
