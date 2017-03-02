require "unifaun/line.rb"
class CustomsDeclaration<Base
  attr_accessor :invoiceType
  attr_accessor :invoiceNo
  attr_accessor :termCode
  attr_accessor :currencyCode
  attr_accessor :lines
  attr_accessor :printSet
  def initialize(args,lines)
    args.each do |k,v|
      send("#{k}=",v) rescue p "#{k} dose not exist"
    end
    p lines
    @lines = lines.map{|s| Line.new(s)}
  end
end
