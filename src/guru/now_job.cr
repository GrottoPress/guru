module Guru::NowJob
  macro included
    include Guru::Job

    def run
      Tasker.in(0.seconds) { perform }
    end
  end
end
