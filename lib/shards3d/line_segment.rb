module Shards3d
  class LineSegment
    attr_reader :a, :b

    def initialize(vec_a, vec_b)
      @a = vec_a
      @b = vec_b
    end

    def length
      (a - b).length
    end

    def points
      [a, b]
    end
  end
end