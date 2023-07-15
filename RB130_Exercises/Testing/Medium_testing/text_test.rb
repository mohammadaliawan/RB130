require 'minitest/autorun'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.new('sample_text.txt')
    @sample_text = Text.new(@file.read)
  end

  def test_swap
    swapped_text = <<~TXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TXT

    assert_equal swapped_text, @sample_text.swap('a', 'e')
  end

  def test_word_count
    assert_equal 72, @sample_text.word_count
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end

