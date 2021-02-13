# Guru

**Guru** is a jobs processor based on [Tasker](https://github.com/spider-gazelle/tasker). It allows to define job templates that can be run multiple times.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   # ->>> shard.yml

   # ...
   dependencies:
     guru:
       github: GrottoPress/guru
       branch: master
   # ...
   ```

1. Run `shards install`

1. In your app's bootstrap, require *Guru*:

   ```crystal
   # ->>> src/my_app.cr

   # ...
   require "guru"
   # ...
   ```

## Usage

All jobs are required to define a `#perform` method, indicating the actual work to be done.

### *At* Jobs

An *At* job runs once, at a defined time:

```crystal
# ->>> src/jobs/sample_at_job.cr

struct SampleAtJob
  include Guru::AtJob

  # Accepts either a `Time`, or a block that returns same.
  run_at 1.minute.from_now

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
```

Schedule this job thus:

```crystal
# ->>> src/app.cr

SampleAtJob.run(name)

# OR

SampleAtJob.run(name) do |job, task|
  # `job` is a `SampleAtJob` instance
  # `task` is a `Tasker::OneShot` instance
  # ...
end
```

### *Cron* Jobs

A *Cron* job runs at times defined in a *Unix* cron format:

```crystal
# ->>> src/jobs/sample_cron_job.cr

struct SampleCronJob
  include Guru::CronJob

  # Accepts either a `String`, or a block that returns same.
  run_cron { "10 8 * * *" }

  # Optionally indicate the time zone
  #
  # Accepts either a `Time::Location`, or a block that returns same.
  timezone Time::Location.load("Africa/Accra")

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
```

Schedule this job thus:

```crystal
# ->>> src/app.cr

SampleCronJob.run(name)

# OR

SampleCronJob.run(name) do |job, task|
  # `job` is a `SampleCronJob` instance
  # `task` is a `Tasker::CRON` instance
  # ...
end
```

### *Every* Jobs

An *Every* job runs periodically, at a defined time interval:

```crystal
# ->>> src/jobs/sample_every_job.cr

struct SampleEveryJob
  include Guru::EveryJob

  # Accepts either a `Time::Span`, or a block that returns same.
  run_every { 1.minute }

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
```

Schedule this job thus:

```crystal
# ->>> src/app.cr

SampleEveryJob.run(name)

# OR

SampleEveryJob.run(name) do |job, task|
  # `job` is a `SampleEveryJob` instance
  # `task` is a `Tasker::Repeat` instance
  # ...
end
```

### *In* Jobs

An *In* job runs once, after a defined period has elapsed:

```crystal
# ->>> src/jobs/sample_in_job.cr

struct SampleInJob
  include Guru::InJob

  # Accepts either a `Time::Span`, or a block that returns same.
  run_in 1.minute

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
```

Schedule this job thus:

```crystal
# ->>> src/app.cr

SampleInJob.run(name)

# OR

SampleInJob.run(name) do |job, task|
  # `job` is a `SampleInJob` instance
  # `task` is a `Tasker::OneShot` instance
  # ...
end
```

### *Now* Jobs

A *Now* job runs once, immediately after it is scheduled:

```crystal
# ->>> src/jobs/sample_now_job.cr

struct SampleNowJob
  include Guru::NowJob

  def initialize(@name : String)
  end

  private def perform
    @name
  end
end
```

Schedule this job thus:

```crystal
# ->>> src/app.cr

SampleNowJob.run(name)

# OR

SampleNowJob.run(name) do |job, task|
  # `job` is a `SampleNowJob` instance
  # `task` is a `Tasker::OneShot` instance
  # ...
end
```

## Contributing

1. [Fork it](https://github.com/GrottoPress/guru/fork)
1. Switch to the `master` branch: `git checkout master`
1. Create your feature branch: `git checkout -b my-new-feature`
1. Make your changes, updating changelog and documentation as appropriate.
1. Commit your changes: `git commit`
1. Push to the branch: `git push origin my-new-feature`
1. Submit a new *Pull Request* against the `GrottoPress:master` branch.

## Security

Kindly report suspected security vulnerabilities in private, via contact details outlined in this repository's `.security.txt` file.
