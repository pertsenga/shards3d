require "shards3d/version"
require "stl"
require "geo3d"

class Shards3d
  attr_reader :stl, :max_x, :max_y, :max_z

  def initialize(stl_file)
    @stl_faces = STL.read(stl_file) # gem doesn't work exactly as stated on its doc
    @max_x, @max_y, @max_z = [800, 800, 800]
  end

  def max_dimensions
    @stl.faces
  end

  def slice(increment = 0.1) # milimeters
    slicer = Slicer.new(max_x, max_y, max_z, increment)
    # slice here
  end
end
