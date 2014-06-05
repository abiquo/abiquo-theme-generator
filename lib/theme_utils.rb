# Copyright 2012 Abiquo Holdings S.L.

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

# http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Salvador Girones

module ThemeUtils

	CONSOLE_THEME_COLORS = {
		'backgroundColor' => {'name' => 'Background color', 'color' => 'AA3333', 'file' => 'less/app.less'},
		'baseColor' => {'name' => 'Base color', 'color' => 'AA3333', 'file' => 'less/app.less'}
	}

	CONSOLE_THEME_IMAGES = {
		'main_menu_logo' => {'name' => 'Main Menu logo', 'file' => 'img/abiquo_logo.png'},
		'main_menu_buttons_sprite' => {'name' => 'Main menu buttons sprite', 'file' => 'img/mainmenu-buttons.png'}
	}

	LOGIN_THEME_COLORS = {
		'baseColor' => {'name' => 'Base color', 'color' => 'BB6666', 'file' => 'less/app_unsecured.less'}
	}

	LOGIN_THEME_IMAGES = {
		'login_watermark' => {'name' => 'Login watermark', 'file' => 'img/abiquo_watermark.png'},
		'login_logo' => {'name' => 'Login logo', 'file' => 'img/abiquo_login.png'}
	}

  ROOT_THEME_EXAMPLE_PATH = File.join(Padrino.root,'/public/root_theme_files/')
	THEME_EXAMPLE_PATH = File.join(Padrino.root,'/public/example_theme/')
	UTILS_PATH = File.join(Padrino.root,'/utils/')

	class Theme
		attr_reader :name, :path, :type, :custom_files
		def initialize type, name, path
			@type = type
			@name = name
			@path = path
			@custom_images = {}
			@custom_colors = {}
		end

		def replace_images images
			if @type == :console
				images.each do |id, content|
					id_image = id.split('.')[0]
					id_file = id.split('.')[1]
					tmp_image = CONSOLE_THEME_IMAGES[id_image]
					
					#if the image is not found, continue with the next
					next if not tmp_image

					if tmp_image["file"]
						File.open(@path + tmp_image['file'], 'w') { |f| f.puts content }
						@custom_images[id_image] = tmp_image
					elsif tmp_image["files"]
						File.open(@path + tmp_image['files'][id_file]['path'], 'w') { |f| f.puts content } if tmp_image['files'][id_file]
						@custom_images[id_image] = tmp_image
					end
				end
			elsif @type == :login
				images.each do |id, content|
					id_image = id.split('.')[0]
					id_file = id.split('.')[1]
					tmp_image = LOGIN_THEME_IMAGES[id_image]
					
					#if the image is not found, continue with the next
					next if not tmp_image

					if tmp_image["file"]
						File.open(@path + tmp_image['file'], 'w') { |f| f.puts content }
						@custom_images[id_image] = tmp_image
					elsif tmp_image["files"]
						File.open(@path + tmp_image['files'][id_file]['path'], 'w') { |f| f.puts content } if tmp_image['files'][id_file]
						@custom_images[id_image] = tmp_image
					end
				end
			end
		end

		def replace_colors colors
			if @type == :console
				colors.each do |id, color|
					%x(sed -i.bak "s/@#{id}: #.\\{6\\}/@#{id}: ##{color}/" #{@path}less/app.less)
				end
			else
				colors.each do |id, color|
					%x(sed -i.bak "s/@#{id}: #.\\{6\\}/@#{id}: ##{color}/" #{@path}less/app_unsecured.less)
				end
			end
		end

	end

	def compile theme

		# Copy the root theme files into tmp folder
		rootpath = "/tmp/ROOT_THEME"
		%x(cp -R #{ROOT_THEME_EXAMPLE_PATH} #{rootpath})
		%x(mv #{theme.path} '#{rootpath}/app/theme/#{theme.name}')
		if theme.type == :console
			%x(cd #{rootpath}; npm install; grunt create_secured_theme --theme=#{theme.name})
		else
			%x(cd #{rootpath}; npm install; grunt create_unsecured_theme --theme=#{theme.name})
		end
	end

	def pack theme

		#Tar it!
		if theme.type == :console
			%x(cd /tmp/ROOT_THEME/build/theme; tar cfvz #{Padrino.root}/public/downloads/#{theme.name}.tar.gz  #{theme.name})
		else
			%x(cd /tmp/ROOT_THEME/build/theme; tar cfvz #{Padrino.root}/public/downloads/#{theme.name}.tar.gz #{theme.name} abicloudDefault)
		end

		raise Exception.new "Error running tar on #{theme.path}" unless $? == 0

		%x(rm -rf /tmp/ROOT_THEME)

		return "#{theme.name}.tar.gz"
	end

	def create_login_theme name
		path = "/tmp/#{name}_login_theme/"
		
		raise Exception.new 'Already exists a login theme with this name' if File.exist? "#{Padrino.root}/public/downloads/#{name}_login_theme.tar.gz"
		%x(rm -rf #{path})
		%x(cp -R #{THEME_EXAMPLE_PATH} #{path})

		return Theme.new :login, "#{name}_login_theme", path
	end

	def create_console_theme name
		path = "/tmp/#{name}_console_theme/"

		raise Exception.new 'Already exists a console theme with this name' if File.exist? "#{Padrino.root}/public/downloads/#{name}_console_theme.tar.gz"
		%x(rm -rf #{path})
		%x(cp -R #{THEME_EXAMPLE_PATH} #{path})

		return Theme.new :console, "#{name}_console_theme", path
	end

end
