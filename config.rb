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

# Localization (i18n) - 'de' as default
activate :i18n, :mount_at_root => :de


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

# Create blog feed XML
page "/feed.xml", layout: false

# Sitemap
activate :search_engine_sitemap

# Methods defined in the helpers block are available in templates
helpers do

  # Default site title (also used in feed.xml.builder)
  def site_title
    "Example site"
  end

  # Default site subtitle (also used in feed.xml.builder)
  def site_subtitle
    "Cool site with cool stuff"
  end

  # Used in feed.xml.builder
  def blog_author
    "John Doe"
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
set :svg_dir, 'assets/svg'

# Vanity URLs
activate :directory_indexes

# Meta tags
# Source: https://github.com/tiste/middleman-meta-tags
activate :meta_tags

# Set URL root
set :url_root, 'http://www.example.com'

# Autoprefixer settings
# Source: https://github.com/middleman/middleman-autoprefixer
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.cascade  = false
  config.inline   = true
  config.ignore   = ['hacks.css']
end

# Build-specific configuration
configure :build do

  # Exclude any vendor components (bower or custom builds) in the build
  ignore 'assets/css/utils/*'
  ignore 'assets/css/layout/*'
  ignore 'assets/css/components/*'
  ignore 'assets/css/modules/*'
  ignore 'assets/js/vendor/*'
  ignore 'assets/icons/preview.html' # grunticon generated preview.html

  # Gzip build
  # More info: https://middlemanapp.com/advanced/file_size_optimization/
  activate :gzip

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Minifiy HTML
  # Source: https://github.com/middleman/middleman-minify-html
  activate :minify_html do |html|
    #html.remove_multi_spaces        = true   # Remove multiple spaces
    html.remove_comments            = true   # Remove comments
    html.remove_intertag_spaces     = true  # Remove inter-tag spaces
    html.remove_quotes              = false   # Remove quotes
    #html.simple_doctype             = false  # Use simple doctype
    #html.remove_script_attributes   = true   # Remove script attributes
    #html.remove_style_attributes    = true   # Remove style attributes
    #html.remove_link_attributes     = true   # Remove link attributes
    #html.remove_form_attributes     = false  # Remove form attributes
    #html.remove_input_attributes    = true   # Remove input attributes
    #html.remove_javascript_protocol = true   # Remove JS protocol
    #html.remove_http_protocol       = true   # Remove HTTP protocol
    #html.remove_https_protocol      = false  # Remove HTTPS protocol
    #html.preserve_line_breaks       = false  # Preserve line breaks
    #html.simple_boolean_attributes  = true   # Use simple boolean attributes
    #html.preserve_patterns          = nil    # Patterns to preserve
  end

  # Imageoptim
  # Source: https://github.com/plasticine/middleman-imageoptim
  activate :imageoptim

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
