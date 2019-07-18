require_relative '../lib/darktrader.rb'

describe "the perform method" do
  it "should return not nil" do
    expect(perform).not_to be_nil
  end


  it "should return an array with these values" do
    expect(perform.reduce({}, :merge)).to include("BTC")
    expect(perform.reduce({}, :merge)).to include("ETH")
  end

end
