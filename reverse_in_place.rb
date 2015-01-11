def reverse_in_place(string)

  most_left = 0
  most_right = string.size - 1

  while most_left < most_right
    holder = string[most_left]
    string[most_left] = string[most_right]
    string[most_right] = holder

    most_left += 1
    most_right -= 1

  end
  return string
end

reverse_in_place([1,2,3,4,5,6,7,8])