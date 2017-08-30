# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w(ckeditor/config.js)

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.precompile += ['bootstrap.js','home.coffee','jquery.js','jquery.raty.js','jquery.textcomplete.js','jqueryui.min.js','npm,js','ratyrate.js','search_nav.js']
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += ['search_nav.js', 'jquery.textcomplete.js']
