require 'rubygems'
require 'bundler/setup'
require 'nokogiri'

file = File.open("test.html")
doc = Nokogiri::HTML(file)

def mapping(chil)
  #TODO:クラスオブジェクトを返すようにする
  unless chil.children.size == 0
    #TODO:Size == 1ではなく、最後の子だと判定したい。。。
    if chil.children.size == 1 && chil.children.first.children.size == 0
      puts "#{chil.children}::#{chil.children.class}"
    end
    chil.children.each {|ccc|
      mapping(ccc)
    }
  end
end

mapping(doc.xpath('//body'))

