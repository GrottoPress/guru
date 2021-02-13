require "../spec_helper"

describe Guru::NowJob do
  it "runs" do
    name = "sample_now_job"

    SampleNowJob.run(name) do |_, task|
      task.get.should eq(name)
      task.cancel
    end
  end
end
