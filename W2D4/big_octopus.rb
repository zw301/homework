# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
#
# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.
#
# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggishOctopus(fish)
  i = 0
  while i < fish.length
    longest = true
    j = 0
    while j < fish.length
      if i != j && fish[i].length < fish[j].length
        longest = false
      end
      j += 1
    end
    return fish[i] if longest
    i += 1
  end
end

def dominantOctopus(fish)
  quicksort(fish)
  fish[-1]
end

def quicksort(arr)
  return arr if arr.length <= 1

  pivot = arr.first
  left = arr[1..-1].select {|el| el.length < pivot.length}
  right = arr[1..-1].select {|el| el.length >= pivot.length}

  quicksort(left) + [pivot] + quicksort(right)
end

def cleverOctopus(fish)
  longest = nil
  fish.each do |el|
    if longest.nil? || el.length >= longest.length
      longest = el
    end
  end
  longest
end




# Slow Dance
# Given a tile direction, iterate through a tiles array to return the
# tentacle number (tile index) the octopus must move. This should take O(n) time.
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, arr)

  arr.each_with_index do |dir, idx|
    return idx if direction == dir
  end

end

def constant_dance(direction, arr)
  dir_hash = {}
  arr.each_with_index do |dir, idx|
    dir_hash[dir] = idx
  end
  dir_hash[direction]
end
