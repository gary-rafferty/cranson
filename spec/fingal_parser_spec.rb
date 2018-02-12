require 'spec_helper'

describe Cranson::Parsers::Fingal do

  let(:parser) { Cranson::Parsers::Fingal.new }

  describe '#start_element' do
    describe 'when element is Planning_Applications' do
      before do
        parser.start_element('Planning_Applications')
      end

      it 'instantiates a new PlanningApplication object' do
        expect(parser.current_object).to be_an_instance_of Cranson::PlanningApplication
      end
    end

    describe 'when element is not a Planning_Applications' do
      before do
        parser.start_element('Planning_Applications')
        parser.start_element('Planning_Reference')
      end

      it 'sets the current_attribute as the downcased element name' do
        expect(parser.current_attribute).to eq 'planning_reference'
      end
    end
  end

  describe '#characters' do
    describe 'when str is not a newline' do
      before do
        parser.start_element('Planning_Applications')
        parser.start_element('Planning_Reference')
        parser.characters('ref1')
      end

      it 'sets the current_attribute value as the str' do
        expect(parser.current_object.planning_reference).to eq 'ref1'
      end
    end

    describe 'when str is a newline' do
       before do
        parser.start_element('Planning_Applications')
        parser.start_element('Planning_Reference')
        parser.characters('\n')
      end

      it 'does not set the current_attribute value as the newline' do
        expect(parser.current_object.planning_reference).not_to eq "\n"
      end
    end
  end

  describe '#end_element' do
    describe 'when element is Planning_Applications' do
      before do
        parser.start_element('Planning_Applications')
        parser.start_element('Planning_Reference')
        parser.characters('ref1')
        parser.end_element('Planning_Reference')
      end

      it 'will notify any observers' do
        expect(parser).to receive(:notify_observers).with(parser.current_object)
        parser.end_element('Planning_Applications')
      end
    end
  end
end
 
