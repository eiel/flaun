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

describe Flaun::DSLTarget do
  let(:dsl) { Flaun::DSLTarget.new(config) }
  let(:config) { Flaun::Config.new }

  describe '#user' do
    subject { dsl.user user }
    context "when user is 'bar'" do
      let(:user) { 'bar' }

      it 'config.user eq "user"' do
        subject
        expect( dsl.config.user ).to eq(user)
      end
    end
  end
end
