require "space_cats/version"

module SpaceCats
  def space_cat
    "<a href='http://omgcatsinspace.tumblr.com'><img src='#{ get_cat_url }'></img></a>".html_safe
  end

  def get_cat_url
    begin
      parse_url_from_string(File.open(get_random_space_cat_file))
    rescue
      return pizza_cat_url
    end
  end

  private

    def get_random_space_cat_file
      possible_space_cat_files.shuffle.first
    end

    def possible_space_cat_files
      Dir["#{ File.join(File.dirname(File.dirname(__FILE__)), 'omgcatsinspace') }/*"]
    end

    def parse_url_from_string(file)
      file.read.split.grep(/http[s]?:\/\/\w/).first
    end

    def pizza_cat_url
      'http://24.media.tumblr.com/42181e20797b546c2f842ce8f6bf9f55/tumblr_mmel6b5X5K1r4xjo2o1_250.gif'
    end
end

ActionView::Base.send(:include, SpaceCats) if defined?(ActionView::Base)