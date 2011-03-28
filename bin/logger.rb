#!/usr/bin/env ruby

def usage
  puts %q{
    Usage: logger.sh [-hV] [-t type] [-p project] [-d count] [-s] text
    Try 'logger.sh -h' for more information.
  }
end

def help
  puts %q{
Usage: logger.sh [-hv] [-t type] [-p project] [-d count] [-s] text

With no options or input, logger.sh outputs the last 10 lines of the log.

Options:
  -t TYPE
    The type classification that the log event belongs to. example: work, school etc.
  -p PROJECT
    The project that the log event belongs to. This helps group log events together which might belong to the same type or which my not belong to a type at all.
  -d COUNT
    The number of lines to show when output the tail of the log. Defaults to 10.
  -s text
    Searches the log file for the given text and displays those entries
  -h
    Help Text.
  -v
    Show version information and credits.
}
end


require 'getoptlong'

opts = GetoptLong.new(
  [ '-h', '--help', GetoptLong::NO_ARGUMENT ],
  [ '-v', '--version', GetoptLong::NO_ARGUMENT ],
  [ '-t', '--type', GetoptLong::REQUIRED_ARGUMENT ],
  [ '-p', '--project', GetoptLong::REQUIRED_ARGUMENT ],
  [ '-d','--count',  GetoptLong::REQUIRED_ARGUMENT ],
  [ '-s', '--search', GetoptLong::REQUIRED_ARGUMENT ]
)

usage
