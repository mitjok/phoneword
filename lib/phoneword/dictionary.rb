module Phoneword
  class Dictionary
    def initialize(args={})
      @file_path =
        args.fetch(:file_path, File.expand_path('../../../data/dictionary.txt', __FILE__))
    end

    def words
      @words ||=
        File.readlines(file_path).each { |w| w.chomp! }
    end

    def word_size
      @word_size ||= 2
    end

    def search(variations)
      variations.map { |v| words.bsearch { |x| v <=> x } }.compact
    end

    def search_word(word)
      words.bsearch { |x| word <=> x }
    end

    private

    attr_reader :file_path
  end
end
