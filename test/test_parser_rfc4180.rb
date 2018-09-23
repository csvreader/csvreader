# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_parser_rfc4180.rb


require 'helper'

class TestParserRfc4180 < MiniTest::Test

def setup
  CsvReader::Parser.debug = true   ## turn on "global" logging - move to helper - why? why not?
end

def parser
  CsvReader::Parser::RFC4180
end


def test_parser_rfc4180
  pp CsvReader::Parser::RFC4180
  pp CsvReader::Parser.rfc4180
  assert true
end

def test_parse
   records = [["a", "b", "c"],
              ["1", "2", "3"],
              ["4", "5", "6"]]

   ## don't care about newlines (\r\n) ??? - fix? why? why not?
   assert_equal records, parser.parse( "a,b,c\n1,2,3\n4,5,6" )
   assert_equal records, parser.parse( "a,b,c\n1,2,3\n4,5,6\n" )
   assert_equal records, parser.parse( "a,b,c\r1,2,3\r4,5,6" )
   assert_equal records, parser.parse( "a,b,c\r\n1,2,3\r\n4,5,6\r\n" )
end

end # class TestParserRfc4180