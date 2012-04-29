module Architects
  class Board
    COLS = 15
    ROWS = 8

    def initialize
      @positions = Array.new(ROWS) { Array.new(COLS) { Place.new } }
    end

    def build player, col, row
      @positions[row][col].claim player
      neighbors(col, row).each do |place|
        place.close
      end
    end

    def owner_at col, row
      @positions[row][col].owner
    end

    def neighbors col, row
      [
        @positions[row][col - 1],
        @positions[row][col + 1],

        if col.odd?
          if row.odd?
            @positions[row + 1][col + 1]
          else
            @positions[row + 1][col - 1]
          end
        else
          if row.odd?
            @positions[row - 1][col + 1]
          else
            @positions[row - 1][col - 1]
          end
        end
      ]
    end
  end
end

