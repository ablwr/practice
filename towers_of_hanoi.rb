def move_disk(number_of_disks,from = [],to = [],via = [])
  if number_of_disks == 0
    []
  else
      move_disk(number_of_disks-1,from, via, to)
      to.unshift(from.shift)
      move_disk(number_of_disks-1, via, to, from)
  end
  to
end