require 'spec_helper'

describe Cranson::Parsers::Dcc do

  let(:parser) { Cranson::Parsers::Dcc.new }

  describe '#parse' do
    let(:data) do
      {
        "Plan_Ref" => "AB/123    ",
        "PROPOSAL" => "first proposal",
        "LOCATION" => "first location",
        "STAGE" => "permission requested",
        "REGDATE" => "12-02-2018",
        "DECDATE" => "",
        "Northing" => "53.335",
        "Easting" => "-6.234"
      }
    end

    before { allow(CSV).to receive(:foreach).and_yield(data).and_yield(data) }

    it 'instantiates an application from each row' do
      expect(parser).to receive(:build_planning_application).twice
      parser.parse('file')
    end
  end
end
