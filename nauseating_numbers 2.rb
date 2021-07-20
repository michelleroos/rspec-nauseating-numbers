def strange_sums(array)
    count = 0

    i = 0
    while i < array.length
        j = i + 1
        while j < array.length
            if array[i] + array[j] == 0
                count += 1
            end
        j += 1
        end 
    i += 1
    end

    count 
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0 

def pair_product(array, num)
    array.each_with_index do |ele1, idx1|
        array.each_with_index do |ele2, idx2|
            if idx2 > idx1 && ele1 * ele2 == num
                return true 
            end                 
        end
    end
    false 
end

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

def rampant_repeats(string, hash)
    # Iterate over string
    # Return the char * the hash value
    # Else return the char

    new_word = ""

    string.each_char do |char|
        if hash.has_key?(char)
            new_word += char * hash[char]
        else
            new_word += char
        end
    end
    
    new_word
end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(n)
    # Create a range from 1 to the number
    # Iteratethrough the range, multiplying each num of range by itself
    # If num * num == n, return true
    # Else false

    (1..n).each do |num|
        if num * num == n
            return true
        end
    end
    false
end

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false

def anti_prime?(num)
    (1..num).each do |n|
        if divisor(n) > divisor(num) 
            return false
        end
    end
    true 
end
  # create a range from 1 to num (inclusive)
    # call on the helper method to get the total divisors for n 
    # compare each iteration with amount of divisors for num 

def divisor(n)
    count = 0
    (1..n).each do |d|
        if n % d == 0
            count += 1
        end 
    end 
    count 
end
 # create a variable for counter 
    # range from 1 to num (inclusive), increment counter each time we hit divisor

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false

def matrix_addition(arr1, arr2)
    array = []

    i = 0
    while i < arr1.length 
        sub_array1 = arr1[i]
        sub_array2 = arr2[i]
        array << [sub_array1.first + sub_array2.first, sub_array1.last + sub_array2.last]
    
    i += 1
    end    
    
  array
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors(*nums)
    new_array = []
    nums_array = *nums.to_a
    length = nums_array.length 

    i = 0

    while i < nums_array.length

        (1..nums_array[i]).each do |n|

            if nums_array[i] % n == 0 
                new_array << n
            end 
        end
        
        i += 1
    end
    
    mutuals(new_array, length)
end

def mutuals(array, num)
    hash = Hash.new(0)
    new_arr = []

    array.each do |n|
        hash[n] += 1 
    end

    hash.each do |k, v|
        if v == num
            new_arr << k
        end 
    end 

    new_arr
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

# def add(*nums)
#     return *nums.to_a
# end

# p add(10, 15, 20)

def tribonacci_number(number) # 4
    tribonacci = [1, 1, 2]

    i = 0
    while tribonacci.length < number 
        next_num = tribonacci[i] + tribonacci[i + 1] + tribonacci[i + 2]
        tribonacci << next_num 
    i += 1
    end 

    tribonacci[number - 1]
end 

# calculate tribonacci array up to number 
# take i + 1 + 2 to get the next number
# return the last number of the array

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
    matrix_array = *matrices.to_a
    return nil if matrix_array.length != matrix_array[0].length
    # [[[2,5], [4,7]], [[9,1], [3,0]]]
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil