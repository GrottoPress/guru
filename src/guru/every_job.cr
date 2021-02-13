module Guru::EveryJob
  macro included
    include Guru::Job

    def run
      Tasker.every(every) { perform }
    end
  end

  private macro run_every(period)
    run_every { {{ period }} }
  end

  private macro run_every
    private def every : Time::Span
      {{ yield }}
    end
  end
end
