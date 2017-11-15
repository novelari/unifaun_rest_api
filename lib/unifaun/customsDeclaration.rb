require "unifaun/line.rb"
require "unifaun/sender.rb"
class CustomsDeclaration<Base
  attr_accessor :invoiceType
  attr_accessor :invoiceNo
  attr_accessor :termCode
  attr_accessor :currencyCode
  attr_accessor :lines
  attr_accessor :printSet
  attr_accessor :sender
  def initialize(args,lines,sender)
    args.each do |k,v|
      send("#{k}=",v) rescue p "#{k} dose not exist"
    end
    @sender = Sender.new(sender)
    @lines = lines.map{|s| Line.new(s)}
  end
end
