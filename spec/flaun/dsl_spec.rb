require 'spec_helper'
require 'flaun/dsl'

describe Flaun::DSL do
  let(:dsl) { Flaun::DSL.new }

  describe '#port' do
    subject { dsl.port number }

    context 'when port number 4000' do
      let(:number) { 4000 }

      it 'config.port eq 4000' do
        subject
        expect( dsl.config.port ).to eq(4000)
      end
    end
  end
end
