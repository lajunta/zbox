require "quick_magick"
module Zbox
  module Qm       
    def self.resize(filepath,opts={})
      img = QuickMagick::Image.open(filepath).first
      if opts[:width] 
        mw = opts[:width]
      elsif opts[:height]
        mh = opts[:height]
      end
      mw ||= img.width
      mh ||= img.height
      if opts[:percent]
        img.resize opts[:percent]
      else
        img.resize "#{mw}x#{mh}"
      end 
      img.save! 
    end
  end
end
