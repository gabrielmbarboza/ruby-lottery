# frozen_string_literal: true

require 'spec_helper'
require 'lotto/cli/commands'

RSpec.describe "CLI Commands" do
  describe "version command" do
    it 'prints version successfully' do
      allow_any_instance_of(Lotto::CLI::Commands::Version).to receive(:puts)
      cmd = Lotto::CLI::Commands::Version.new

      expect { cmd.call }.not_to raise_error
    end
  end

  describe "random command" do
    it 'generates random games' do
      cmd = Lotto::CLI::Commands::RandomTens.new
      output = capture_output { cmd.call(games: "2", tens: "6") }

      lines = output.split("\n").reject(&:empty?)
      expect(lines.size).to eq(2)
    end
  end

  private

  def capture_output
    old_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = old_stdout
  end
end
