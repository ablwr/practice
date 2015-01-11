def bracket_checker(doc)

  openers_to_closers_map = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }

  openers = openers_to_closers_map.keys
  closers = openers_to_closers_map.values

  checker = []

    doc.each do |sym|
      if sym.match(openers)
        checker << sym
        if checker.last != openers_to_closers_map[checker]
          return False
        end

      end
    end
    
  end