require "../spec_helper"

describe Guru::AtJob do
  it "runs" do
    name = "sample_at_job"

    SampleAtJob.run(name) do |_, task|
      task.get.should eq(name)
      task.cancel
    end
  end
end
