module Phoneword
  class Phone
    def initialize(args={})
      @number = args[:number]
    end

    def mapping
      @mapping ||= {
        2 => %w(a b c),
        3 => %w(d e f),
        4 => %w(g h i),
        5 => %w(j k l),
        6 => %w(m n o),
        7 => %w(p q r s),
        8 => %w(t u v),
        9 => %w(w x y z)
      }
    end

    def mapping_array(digits=[])
      digits.map do |d|
        mapping[d]
      end
    end

    def digits
      @digits ||= number.digits.reverse
    end

    def number_size
      @number_size ||= digits.size - 1
    end

    private

    attr_reader :number

  end
end
