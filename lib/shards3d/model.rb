module Shards3d
  class Model
    def initialize(faces)
      @triangles = process_faces(faces)
      @points = triangles.map(&:points).flatten
    end

    def max_point
      @max_point ||= outlier_point(max)
    end

    def min_point
      @min_point ||= outlier_point(min)
    end

    def normalise_to_print_bed
      translation_matrix = Geo3d::Matrix.translation(*min_point)
      @points.map{ |point| point * translation_matrix }
    end

    def normalise_to_print_bed!
      @points = normalise_to_print_bed
    end

    private
    def process_faces(faces)
      faces.map do |face|
        _normal, triangle = face
        points = triangle.points.map { |coordinates| Geo3d::Vector.new(*coordinates.to_a) }
        Geo3d::Triangle.new(*points)
      end
    end

    def outlier_point(which_end)
      x = @points.map{ |vec| vec.x }.send(which_end)
      y = @points.map{ |vec| vec.y }.send(which_end)
      z = @points.map{ |vec| vec.z }.send(which_end)
      [x, y, z]
    end
  end
end