require_relative '../lib/mairiechristmas.rb'

describe "the perform method" do
  it "should return not nil" do
    expect(perform).not_to be_nil
  end

  it "should return an array with these values" do
    expect(perform.reduce({}, :merge)).to include("vienne-en-arthies")
    expect(perform.reduce({}, :merge)).to include("arthies")
  end
end
