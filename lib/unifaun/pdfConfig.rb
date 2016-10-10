class PdfConfig<Base
  attr_accessor :target4XOffset
  attr_accessor :target2YOffset
  attr_accessor :target1Media
  attr_accessor :target1YOffset
  attr_accessor :target3YOffset
  attr_accessor :target2Media
  attr_accessor :target4YOffset
  attr_accessor :target4Media
  attr_accessor :target3XOffset
  attr_accessor :target3Media
  attr_accessor :target1XOffset
  attr_accessor :target2XOffset

  def initialize(targetMedia="laser-ste")
    @target4XOffset = 0
    @target2YOffset = 0
    @target1Media = targetMedia
    @target1YOffset = 0
    @target3YOffset = 0
    @target2Media = targetMedia
    @target4YOffset = 0
    @target4Media = nil
    @target3XOffset = 0
    @target3Media = nil
    @target1XOffset = 0
    @target2XOffset = 0
  end
  def to_json
    JSON.dump to_h
  end
end
