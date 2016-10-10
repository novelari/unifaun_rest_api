class Option<Base
  attr_accessor :message
  attr_accessor :to
  attr_accessor :id
  attr_accessor :languageCode
  attr_accessor :from
  def initialize(message,to,id,languageCode,from)
    @message = message
    @to = to
    @id = id
    @languageCode = languageCode
    @from = from
  end
end
