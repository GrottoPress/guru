module Guru::AtJob
  macro included
    include Guru::Job

    def run
      Tasker.at(at) { perform }
    end
  end

  private macro run_at(time)
    run_at { {{ time }} }
  end

  private macro run_at
    private def at : Time
      {{ yield }}
    end
  end
end
