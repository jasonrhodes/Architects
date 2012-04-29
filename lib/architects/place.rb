module Architects
  class Place
    Unowned = Class.new

    class OwnershipError < RuntimeError; end
    class UnbuildableError < RuntimeError; end

    def claim player
      raise OwnershipError if @owner
      raise UnbuildableError if @closed
      @owner = player
    end

    def close
      @closed = true
    end

    def owner
      @owner || Unowned
    end
  end
end

