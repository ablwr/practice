def normalize_phone_number(number)
  plain_number = number.gsub(/\D/, "")
  if plain_number.length != 10
    number
  else
    normal_number = "(#{plain_number[0, 3]}) #{plain_number[3,3]}-#{plain_number[6,4]}"
  end
end
