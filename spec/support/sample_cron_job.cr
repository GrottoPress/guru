struct SampleCronJob
  include Guru::CronJob

  run_cron do
    time = Time.local
    minute = time.minute + 1
    minute = 0 if minute == 60

    "#{minute} * * * *"
  end

  timezone Time::Location.load("Africa/Accra")

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
