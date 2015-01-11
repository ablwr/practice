def fibo_finder(n)

  case n
  when 0
    result = 0
  when 1
    result = 1
  else
    previous_terms = [0,1]
    (n-1).times do
      result = previous_terms.inject(:+)
      previous_terms.shift
      previous_terms.push(result)
    end
  end
  result
end