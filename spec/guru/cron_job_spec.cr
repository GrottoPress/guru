require "../spec_helper"

describe Guru::CronJob do
  it "runs" do
    name = "sample_cron_job"

    SampleCronJob.run(name) do |_, task|
      task.get.should eq(name)
      task.cancel
    end
  end
end
