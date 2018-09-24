# A plane that will cut the model into Sheets
module Shards3d
  attr_accessor :layer_height, :plane

  class Slicer
    def initialize(max_w, max_d, max_h, layer_height)
      @layer_height = layer_height
      init_plane(max_w, max_d)
    end

    private

    def init_plane(max_x, max_y)
      padding = 10
      p1 = Geo3d::Vector.point(max_x + padding, 0)
      p2 = Geo3d::Vector.point(0, max_y + padding)
      p3 = Geo3d::Vector.point(max_x + padding, max_y + padding)
      @plane = Geo3d::Plane.from_points(p1, p2, p3)
    end
  end
end