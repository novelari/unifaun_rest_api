class UnifaunPDF
  attr_accessor :href
  attr_accessor :id
  attr_accessor :description
  attr_accessor :pdf
  def initialize(args)
    args.each do |k,v|
      send("#{k}=",v) rescue p "#{k} dose not exist"
    end
  end
end
