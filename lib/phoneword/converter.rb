module Phoneword
  class Converter
    def initialize(args={})
      @dictionary = Dictionary.new
      @phone = Phone.new(number: args[:phone])
    end

    def process
      results = []
      index = dictionary.word_size

      while index < phone.number_size

        head_digits = phone.digits[0..index]
        tail_digits = phone.digits[index+1..phone.number_size]

        match_head = dictionary.search(variations(head_digits))
        match_tail = dictionary.search(variations(tail_digits))

        results << match_head << match_tail
        index += 1
      end
      results.compact
    end

    private

    def variations(digits)
      head, *tail = digits
      head_letters = phone.mapping[head]
      tail_letters = phone.mapping_array(tail)
      head_letters.product(*tail_letters).map do |variant|
        variant.join.upcase
      end
    end

    attr_reader :dictionary,
                :phone
  end
end
