require 'rubygems'
require 'bundler/setup'

require 'nokogiri'


file = File.open("test.html")
doc = Nokogiri::HTML(file)

def mapping(chil)
  if chil.children.size == 0
  else
    #TODO:Size == 1ではなく、最後の子だと判定したい。。。
    if chil.children.size == 1
      puts "#{chil.children}::#{chil.children.class}"
    end
    chil.children.each {|ccc|
      mapping(ccc)
    }
  end
end

mapping(doc.xpath('//body'))

