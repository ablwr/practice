class MazeSolver
  attr_reader :maze, :maze_array, :traveled_path, :visited_nodes, :node_queue

  def initialize(maze_string)
    @node_queue = []
    @visited_nodes = []
    @traveled_path = []
    @parent_nodes = {}
    @start = []
    @finish = []
    @maze = maze_string
    @maze_array = maze_string.split(/\n/)
    @maze_array.collect! do |arr|
      arr.strip.split("")
    end
  end

  def find_start
    @maze_array.each_with_index do |inner_array, y_coord|
      inner_array.each_with_index do |node, x_coord|
        if node == "→"
          return [x_coord,y_coord]
        end
      end
    end
  end

  def solve
    @start = self.find_start
    @node_queue << @start
    while @node_queue.any?
      current_node = @node_queue.shift
      @finish = current_node if finish?(current_node)
      @visited_nodes << current_node
      self.neighbors(current_node).each do |neighbor|
        unless @visited_nodes.include?(neighbor) || @node_queue.include?(neighbor)
          @node_queue << neighbor
          @parent_nodes[neighbor] = current_node
        end
      end
    end
  end

  def finish?(node)
    x_coord, y_coord = node
    @maze_array[y_coord][x_coord] == "@"
  end

  def neighbors(node)
    neighbors = []
    x_coord, y_coord = node
    #left
    if x_coord > 0 && @maze_array[y_coord][x_coord - 1] != "#"
      neighbors << [x_coord - 1, y_coord]
    end
        #right
    if x_coord < 10 && @maze_array[y_coord][x_coord + 1] != "#"
      neighbors << [x_coord + 1, y_coord]
    end
    #up
    if y_coord > 0 && @maze_array[y_coord - 1][x_coord] != "#"
      neighbors << [x_coord, y_coord - 1] 
    end

    #down
    if y_coord < 10 && @maze_array[y_coord + 1][x_coord] != "#"
      neighbors << [x_coord, y_coord + 1]
    end
    return neighbors
  end

  def solution_path
    @traveled_path = [@finish]
    current_node = @finish
    until current_node == @start
      current_node = @parent_nodes[current_node]
      @traveled_path << current_node
    end
    return @traveled_path.reverse!
  end

  def display_solution_path
    #@maze version?
    solution_path if @traveled_path == []
    solved_maze = ""
    path = @traveled_path.dup
    path.pop
    path.shift
    @maze_array.each_with_index do |row, y_coord|
      row.each_with_index do |cell, x_coord|
        #binding.pry
        if(path.include?([x_coord,y_coord]))
          solved_maze << "."
        else
          solved_maze << cell
        end
      end
      solved_maze << "\n"
    end
    solved_maze.chomp!
    puts solved_maze
  end
end

