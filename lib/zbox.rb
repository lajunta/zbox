module Zbox
  autoload :Qm,      "zbox/img/qm" 
end

Dir[File.join(File.dirname(__FILE__), 'zbox', 'ext', '*.rb')].each do |extension|
  require extension
end
