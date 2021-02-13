require "../spec_helper"

describe Guru::EveryJob do
  it "runs" do
    i = 0

    SampleEveryJob.run(i) do |_, task|
      task.each do |count|
        i += 1
        count.should eq(i)
        task.cancel if count > 3
      end
    end
  end
end
