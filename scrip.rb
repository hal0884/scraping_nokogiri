require 'rubygems'
require 'bundler/setup'

require 'nokogiri'

file = File.open("test.html")
doc = Nokogiri::HTML(file)

class NScraping
  attr_reader :ans

  def initialize()
    @ans = []
  end

  def mapping(chil)
    #TODO:クラスオブジェクトを返すようにする
    unless chil.children.size == 0
      #TODO:Size == 1ではなく、最後の子だと判定したい。。。
      if chil.children.size == 1 && chil.children.first.children.size == 0
        @ans.push(chil.children.text)
      end
      chil.children.each {|ccc|
        mapping(ccc)
      }
    end
    @ans
  end
end

ns = NScraping.new()
aaa = ns.mapping(doc.xpath('//body'))
puts aaa

