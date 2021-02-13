require "../spec_helper"

describe Guru::InJob do
  it "runs" do
    name = "sample_in_job"

    SampleInJob.run(name) do |_, task|
      task.get.should eq(name)
      task.cancel
    end
  end
end
