require "space_cats/version"

module SpaceCats
  module InstanceMethods
    def space_cat
      "<img src='http://24.media.tumblr.com/ad579a792a0bd66f8e52ecad2e8484b0/tumblr_mmpha2CBUT1r4xjo2o1_250.gif' href='http://24.media.tumblr.com/ad579a792a0bd66f8e52ecad2e8484b0/tumblr_mmpha2CBUT1r4xjo2o1_250.gif'></img>"
    end
  end
end

ActionView::Base.send :include, SpaceCats if defined?(ActionView::Base)