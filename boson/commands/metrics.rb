module Metrics
  # @desc Flog the specified directories
  def flog(*dirs)
    xargs('flog', *dirs)
  end
  
  # @desc Run reek on the specified directories
  def reek(*dirs)
    xargs('reek', *dirs)
  end
  
  # @desc Run flay on the specified directories
  def flay(*dirs)
    xargs('flay', *dirs)
  end
  
  # @desc Run roodi on the specified directories
  def roodi(*dirs)
    xargs('roodi', *dirs)
  end
  
  private
  
  def xargs(cmd, *dirs)
    dirs = ['.'] if dirs.empty?
    system "find #{dirs.join(' ')} -name \\*.rb | xargs #{cmd}"
  end
  
end
