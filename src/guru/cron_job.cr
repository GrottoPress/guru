module Guru::CronJob
  macro included
    include Guru::Job

    def run
      Tasker.cron(cron, timezone) { perform }
    end

    private def timezone
      Time::Location.local
    end
  end

  private macro run_cron(task)
    run_cron { {{ task }} }
  end

  private macro run_cron
    private def cron : String
      {{ yield }}
    end
  end

  private macro timezone(zone)
    timezone { {{ zone }} }
  end

  private macro timezone
    private def timezone : Time::Location
      {{ yield }}
    end
  end
end
