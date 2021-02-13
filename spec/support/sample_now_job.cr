struct SampleNowJob
  include Guru::NowJob

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
