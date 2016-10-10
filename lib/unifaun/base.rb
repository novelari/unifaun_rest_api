require 'unifaun/api.rb'
class Base
  include API
  def to_h
    instance_variables.map do |iv|
      value = instance_variable_get(:"#{iv}")
      [
        iv.to_s[1..-1], # name without leading `@`
        case value
        when Base then value.to_h # Base instance? convert deeply
        when Array # Array? convert elements
          value.map do |e|
            e.respond_to?(:to_h) ? e.to_h : e
          end
        else value # seems to be non-convertable, put as is
        end
      ]
    end.to_h
  end
end
