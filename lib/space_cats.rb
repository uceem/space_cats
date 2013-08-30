require "uri"
require "space_cats/version"

module SpaceCats
  def space_cat(options = {})
    "<a href='http://omgcatsinspace.tumblr.com'> \
        alt='omg, a cat in space' \
      <img src='#{ get_cat_url(options) }'></img> \
     </a>".html_safe
  end

  def get_cat_url(options = {})
    options[:local] ? get_cat_url_from_file : get_cat_url_from_tumblr
  end

  private

    def get_cat_url_from_tumblr
      begin
        get_random_url_from_blob(RestClient.get(tumblr_api_url))
      rescue
        return pizza_cat_url
      end
    end

    def get_cat_url_from_file
      begin
        parse_url_from_file(File.open(get_random_space_cat_file))
      rescue
        return pizza_cat_url
      end
    end

    def get_random_url_from_blob(blob)
      URI.extract(blob).select { |url| url.include?('500.gif') }.shuffle.first
    end

    def get_random_space_cat_file
      possible_space_cat_files.shuffle.first
    end

    def possible_space_cat_files
      Dir["#{ File.join(File.dirname(File.dirname(__FILE__)), 'omgcatsinspace') }/*"]
    end

    def parse_url_from_file(file)
      file.read.split.grep(/http[s]?:\/\/\w/).first
    end

    def tumblr_api_url
      'http://omgcatsinspace.tumblr.com/api/read?format=json&num=50'
    end

    def pizza_cat_url
      'http://24.media.tumblr.com/42181e20797b546c2f842ce8f6bf9f55/tumblr_mmel6b5X5K1r4xjo2o1_250.gif'
    end
end

ActionView::Base.send(:include, SpaceCats) if defined?(ActionView::Base)