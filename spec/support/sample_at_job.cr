struct SampleAtJob
  include Guru::AtJob

  run_at 1.millisecond.from_now

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
