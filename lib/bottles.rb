class Bottles
  def verse(bottles)
    verse_first_line(bottles) + \
      verse_second_line(bottles)
  end

  def verses(starting, stopping)
    starting.downto(stopping).map do |current|
      verse(current)
    end.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def inflector(num_bottles, capitalize: false)
    if num_bottles == 1
      "#{num_bottles} bottle"
    elsif num_bottles == 0
      if capitalize
        'no more bottles'.capitalize
      else
        'no more bottles'
      end
    else
      "#{num_bottles} bottles"
    end
  end

  def verse_first_line(bottles)
    "#{inflector(bottles, capitalize: true)} of beer on the wall, #{inflector(bottles)} of beer.\n"
  end

  def verse_second_line(bottles)
    if bottles == 0
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "Take #{one_or_it?(bottles)} down and pass it around, #{inflector(bottles-1)} of beer on the wall.\n"
    end
  end

  def one_or_it?(num_bottles)
    if num_bottles > 1
      'one'
    else
      'it'
    end
  end
end
