# Provided, don't edit
require 'directors_database'
require 'pp'

#pp directors_database
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point


  #GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  

def movies_with_director_key(name, movies_collection)
  result = [ ]
  index = 0 
  while index < movies_collection.length do 
    movie_info = movies_collection[index]
    result << movie_with_director_name(name, movie_info )
    index += 1 
  end 
  result
end

  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  # collection = [{:name},{:studio},{worldwide_gross}]
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  
def gross_per_studio(collection)
  result = { }
  index = 0 
  while index < collection.length do 
    header = collection[index]
    if !result[header[:studio]] 
      result[header[:studio]] = header[:worldwide_gross]
    else 
      result[header[:studio]] += header[:worldwide_gross]
    end 
  index += 1 
  end
result
end 


  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  # source = [{:name => value, :movies => value},{:name => value, :movies => value}]
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.


def movies_with_directors_set(source)
  result = [ ]
  index = 0 
  while index < source.length do 
    header = source[index]
    directors_name = header[:name]
    directors_movies_info = header[:movies]
    result << movies_with_director_key(directors_name, directors_movies_info)
    index += 1 
  end 
  result
end



# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!


def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
