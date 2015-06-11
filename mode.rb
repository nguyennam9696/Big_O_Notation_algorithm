require 'benchmark'

# def mode(nums)
#   mode_return = nums.inject(Hash.new(0)) { |k, v| k[v] = nums.count(v); k }
#   mode_return.select { |k,v| v == mode_return.values.max }.keys
# end

def n2_mode(nums)
    mode = nums[0]
    max_count = 0
    nums.each do |potential_mode|
        count = 0
        nums.each do |num|
            if num == potential_mode
                count += 1
            end
        end
        if count > max_count
            max_count = count
            mode = potential_mode
        end
    end
    mode
end

def nlogn_mode(nums)
    mode = nums[0]
    max_count = 0
    sorted = nums.sort
    last_num = nil
    count = 0
    sorted.each do |num|
        if num == last_num
            count += 1
        elsif count > max_count
            max_count = count
            mode = last_num
            count = 0
        end
        last_num = num
    end
    mode
end

def mode(nums)
    counts = Hash.new(0)
    nums.each do |num|
        counts[num] += 1
    end
    mode = nums[0]
    max_count = 0
    counts.each do |num, count|
        if count > max_count
            max_count = count
            mode = num
        end
    end
end

puts Benchmark.measure { mode([5, 6, 7, 7, 7, 8, 8, 8, 10, 10, 10, 15]) }
puts Benchmark.measure { nlogn_mode([5, 6, 7, 7, 7, 8, 8, 8, 10, 10, 10, 15]) }
puts Benchmark.measure { n2_mode([5, 6, 7, 7, 7, 8, 8, 8, 10, 10, 10, 15]) }