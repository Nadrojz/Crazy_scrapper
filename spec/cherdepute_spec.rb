require_relative '../lib/cherdepute.rb'

describe "the perform method" do
  it "should return not nil" do
    expect(perform).not_to be_nil
  end

  it "should return an array with these values" do
    expect(perform.reduce({}, :merge)).to include("email" => "michel.zumkeller@assemblee-nationale.fr",+"first_name" => "Michel",+"last_name" => "Zumkeller",)
  end
end
