# desc "Explaining what the task does"
namespace :fuelux_rails do

	desc "Update files"
	task :update do
		require 'open-uri'
		tag = (ENV['TAG'] || 'master')
		bump_version = (ENV['BUMP_VERSION'] || false)
		bump_version = false if tag.eql? 'master'
		update_all tag
		update_version tag if bump_version
		puts "Updated assets to #{tag}"
	end

	SCRIPTS_REPO = "https://raw.github.com/ExactTarget/fuelux/%s/src/%s.js"
	SCRIPTS_PATH = "./vendor/assets/javascripts/fuelux/%s.js"

	SCRIPTS = %w( util checkbox combobox datagrid intelligent-dropdown pillbox 
								radio search select spinner tree wizard).freeze

	STYLESHEETS_REPO = "https://raw.github.com/ExactTarget/fuelux/%s/src/less/%s.less"
	STYLESHEETS_PATH = "./vendor/toolkit/fuelux/%s.less"
	EXTRA_VARIABLES = "// Tree\n// --------------------------------------------------\n@treeBackgroundHover: #DFEEF5;\n@treeBackgroundSelect: #B9DFF1;\n"

	def update_javascript(file, tag = 'master')
		repo = SCRIPTS_REPO % [tag, file]
		path = SCRIPTS_PATH % file
		begin
			original_file = open(repo)
		rescue OpenURI::HTTPError
			return ''
		end
		open(path, 'wb') do |doc|
			doc << original_file.read
		end

		lines = IO.readlines(path).map do |line|
			case
			when line =~ /define\(/
				'!function ($) {'
			when line =~ /require\(/
				''
			when line =~ /^\}\);/
				'}(window.jQuery);'
			else
				line
			end
		end

		File.open(path, 'w') {|doc| doc.puts lines }
		"//= require fuelux/#{file}\n"
	end

	def update_all_javascripts(tag = 'master')
		requires = SCRIPTS.map do |script|
			update_javascript script, tag
		end
		open('./vendor/assets/javascripts/fuelux.js', 'wb') do |file|
			requires.each {|r| file << r }
		end
	end

	def update_stylesheet(file, tag = 'master')
		repo = STYLESHEETS_REPO % [tag, file]
		path = STYLESHEETS_PATH % file
		begin
			original_file = open(repo)
		rescue OpenURI::HTTPError
			return ''
		end
		open(path, 'wb') do |doc|
			doc << original_file.read
		end
		lines = IO.readlines(path).map do |line|
			line.gsub /url\(\.{2}\/img\/([^\)]+)\)/, "image-url('fuelux/\\1')"
		end
		File.open(path, 'w') {|doc| doc.puts lines }
		%(@import "fuelux/#{file}.less";\n)
	end

	def update_all_stylesheets(tag = 'master')
		
		requires = SCRIPTS.map do |script|
			update_stylesheet script, tag
		end.unshift EXTRA_VARIABLES
		
		open('./vendor/toolkit/fuelux.less', 'wb') do |file|
			requires.each {|r| file << r }
		end
	end

	def update_all(tag = 'master')
		update_all_stylesheets
		update_all_javascripts
	end

	def update_version(tag)
		open('./lib/fuelux-rails/version.rb', 'wb') do |file|
			file << "module FueluxRails\n  VERSION = \"#{tag}\"\nend"
		end
	end
end
