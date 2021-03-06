# frozen_string_literal: true

require 'benchmark/ips'

puts "Ruby #{RUBY_VERSION} at #{Time.now}"
puts

firstname = 'soundarapandian'
middlename = 'rathinasamy'
lastname = 'arumugam'

def do_call(&block)
	block.call
end

def do_yield(&block)
	yield
end

def do_yield_without_block
	yield
end

existing_block = proc{}

Benchmark.ips do |x|
	x.report("block.call") do |i|
		buffer = String.new
		
		while (i -= 1) > 0
			do_call(&existing_block)
		end
	end
	
	x.report("yield with block") do |i|
		buffer = String.new
		
		while (i -= 1) > 0
			do_yield(&existing_block)
		end
	end
	
	x.report("yield") do |i|
		buffer = String.new
		
		while (i -= 1) > 0
			do_yield_without_block(&existing_block)
		end
	end
	
	x.compare!
end
