###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Defines blog settings
activate :blog do |blog|
  blog.sources = "blog/{year}/{title}.html"
  blog.permalink = "blog/{year}/{title}.html"
end

page "/feed.xml", layout: false

# Methods defined in the helpers block are available in templates
helpers do

  # TODO: Change title
  def site_title
    "Example site"
  end

  # Site title settings
  def title_separator
    " &mdash; "
  end

  def render_page_title(title, current_page_url)
    if title.nil? || title.empty?
      raise RuntimeError, "You must provide a page title for your page!"
    end

    if current_page_url == "/"
      site_title + title_separator + title
    else
      title + title_separator + site_title
    end
  end

  # Defines active class for navigation
  def nav_active(url)
    active_nav_class = "current"

    if (url.instance_of? String)
      current_resource.url == url_for(url) ? {class: active_nav_class} : {}
    elsif (url.instance_of? Array)
      url.map { |url| url_for(url) }.include?(current_resource.url) ? {class: active_nav_class} : {}
    else
      {}
    end
  end

  # Source: https://gist.github.com/mrreynolds/4fc71c8d09646567111f
  #
  # Acts as a thin wrapper for image_tag and generates an srcset attribute for regular image tags
  # for usage with responsive images polyfills. Supports asset pipeline path helpers.
  #
  # image_set_tag 'pic_1980.jpg', { 'pic_640.jpg' => '640w', 'pic_1024.jpg' => '1024w' }, sizes: '100vw', class: 'my-image'
  #
  # => <img src="/assets/ants_1980.jpg" srcset="/assets/pic_640.jpg 640w, /assets/pic_1024.jpg 1024w" sizes="100vw" class="my-image">
  #
  def image_set_tag(source, srcset = {}, options = {})
    srcset = srcset.map { |src, size| "#{asset_path(:images, src)} #{size}" }.join(', ')
    image_tag(source, options.merge(srcset: srcset))
  end
end

# Basic paths settings
set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

# Vanity URLs
activate :directory_indexes

set :url_root, 'http://www.elfacht.com'

# Build-specific configuration
configure :build do
  # Exclude any vendor components (bower or custom builds) in the build
  ignore 'assets/css/settings/*'
  ignore 'assets/css/partials/*'
  ignore 'assets/css/components/*'
  ignore 'assets/css/vendor/*'
  ignore 'assets/js/vendor/*'


  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  #activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
