require 'spec_helper'
require 'reason_parser'

RSpec.describe ReasonParser do

  let(:parser_instance) { ReasonParser.new }

  describe "#scan_expression" do
    let(:regexp) { /\d+|x[1-4]/ }
    let(:scannable_string) { "123/456x1x2111100000x3jkjjx4" }
    it "matches a regular expression with passed content" do
      expect(parser_instance.scan_expression(regexp, scannable_string)).to eq(["123", "456", "x1", "x2", "111100000", "x3", "x4"])
    end
  end

  describe "#parse_reasons_from" do
    let(:reasons_string) { "jhgjh1/2,345x1////111100000" }
    it "parses out valid reasons from passed string" do
      expect(parser_instance.parse_reasons_from(reasons_string)).to eq("1,2,3,4,5,x1,8")
    end
  end
end
