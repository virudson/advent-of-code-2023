# frozen_string_literal: true

require 'benchmark'

cube_limit = { 'red' => 12, 'green' => 13, 'blue' => 14 }

Benchmark.bmbm do |x|
  x.report('Day 02 - Part 1') do
    sum = 0
    File.foreach('input.txt').each.with_index(1) do |line, game_id|
      # capture any two digits following color red, green, blue
      invalid_game = line.gsub(/(\d{2}) (red|green|blue)/).any? do |_m|
        $1.to_i > cube_limit[$2]
      end

      # add game IDs when game is valid
      sum += line[/\d+/].to_i unless invalid_game
    end

    puts "Sum of the IDs game is: #{sum}"
  end
end