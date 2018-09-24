require "shards3d/version"

class Shards3d
  attr_reader :stl, :max_x, :max_y, :max_z

  def initialize(stl_file)
    @stl = STL.read(stl_file)
    @max_x, @max_y, @max_z = [800, 800, 800]
  end

  def slice(increment = 0.1) # milimeters - should depend to model's measure unit
    slicer = Slicer.new(max_x, max_y, max_z, increment)
    # slice here
  end
end
