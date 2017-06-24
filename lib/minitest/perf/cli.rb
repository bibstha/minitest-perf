module Minitest
  module Perf
    class Cli
      def run
        count = ARGV[0]&.to_i || 10
        puts "Slowest individual tests"
        puts
        Statistics.slowest_tests(count).each do |suite, test_name, time|
          printf "% 12.2fms | %s#%s\n", time * 1000, suite, test_name
        end

        puts
        puts
        puts "Slowest test suites"
        puts
        Statistics.slowest_suites(count).each do |suite_name, tests_count, avg_test_time|
          printf "% 12.2fms | % 4i | %s\n", avg_test_time * 1000, tests_count, suite_name
        end
      end
    end
  end
end
