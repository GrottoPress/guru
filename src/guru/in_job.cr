module Guru::InJob
  macro included
    include Guru::Job

    def run
      Tasker.in(in) { perform }
    end
  end

  private macro run_in(period)
    run_in { {{ period }} }
  end

  private macro run_in
    private def in : Time::Span
      {{ yield }}
    end
  end
end
