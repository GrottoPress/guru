struct SampleInJob
  include Guru::InJob

  run_in 1.millisecond

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
