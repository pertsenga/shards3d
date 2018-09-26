# A plane that will cut the model into Sheets
module Shards3d
  class Slicer
    attr_accessor :layer_interval_vec, :plane_slicer

    def initialize(max_w, max_d, max_h, layer_height)
      @layer_interval_vec = Geo3d::Vector.new(0, layer_height, 0)
      @plane_slicer = plane(max_w, max_d)
    end

    def plane(max_x, max_y)
      padding = 10
      p1 = Geo3d::Vector.new(max_x + padding, 0)
      p2 = Geo3d::Vector.new(0, max_y + padding)
      p3 = Geo3d::Vector.new(max_x + padding, max_y + padding)
      Geo3d::Plane.from_points(p1, p2, p3)
    end
  end
end