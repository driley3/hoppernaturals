set :css_dir,               'css'
set :js_dir,                'js'
set :images_dir,            'img'
set :fonts_dir,             'fonts'

# Slim template engine
require 'slim'

# explicit require of sass as suggested by 'tilt'
require 'sass'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

end

# work-around to remove copies of font-awesome files. Where are they pulled in?
after_build do |builder|
  build_dir = config[:build_dir]
  Dir.glob(build_dir + '/fonts/*wesome*').each { |f| File.delete(f) if File.file? f }
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  # Optional Settings
  deploy.remote   = 'git@github.com:driley3/hoppernaturals.git' # remote name or git url, default: origin
  deploy.branch   = 'master'
  # deploy.strategy = :submodule      # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
