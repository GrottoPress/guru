struct SampleEveryJob
  include Guru::EveryJob

  run_every 1.millisecond

  def initialize(@count : Int32)
  end

  private def perform
    @count += 1
  end
end
