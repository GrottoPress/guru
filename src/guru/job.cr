module Guru::Job
  macro included
    def run : Tasker::Task
    end

    def self.run(*args, **named_args)
      run(*args, **named_args) {}
    end

    def self.run(*args, **named_args)
      job = new(*args, **named_args)
      task = job.run

      yield job, task
    end
  end
end
