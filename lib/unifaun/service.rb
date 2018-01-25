require "unifaun/addon.rb"
class Service<Base
  attr_accessor :id
  attr_accessor :paymentMethodType
  attr_accessor :addons
  def initialize(id,paymentMethodType,addons)
    @id = id
    @addons = addons.map{|s| AddOn.new(s)}
    @paymentMethodType = paymentMethodType
  end
end
