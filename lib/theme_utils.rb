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
		'background_color' => {'name' => 'Background color', 'color' => 'FFD200', 'file' => 'background_color.txt'},
		'base_color' => {'name' => 'Base color', 'color' => 'FFD200', 'file' => 'background_color.txt'}
	}

	CONSOLE_THEME_CSS = {
		#'base' => {'name' => 'Base CSS', 'file' => 'base.css'}
	}

	CONSOLE_THEME_IMAGES = {
		'main_menu_logo' => {'name' => 'Main Menu logo', 'file' => 'img/abiquo_login.png'},
		'main_menu_buttons_sprite' => {'name' => 'Main menu buttons sprite', 'file' => 'img/mainmenu-buttons.png'},
		'virtual_machine_default_icon' => {'name' => 'Virtual Machine default icon', 'file' => 'img/vm_user_icon.png'}
	}

	LOGIN_THEME_COLORS = {
		'base_color' => {'name' => 'Base color', 'color' => 'CCCCCC', 'file' => 'base_color.txt'}
	}

	LOGIN_THEME_IMAGES = {
		'login_watermark' => {'name' => 'Login watermark', 'file' => 'img/abiquo_watermark.png'},
		'login_logo' => {'name' => 'Login logo', 'file' => 'img/abiquo_login.png'}
	}

	LOGIN_THEME_CSS = {
		#'abicloud_premium' => {'name' => 'Abicloud Premium', 'file' => 'abicloud_premium.css'}
	}

  ROOT_THEME_EXAMPLE_PATH = File.join(Padrino.root,'/public/theme-generator/')
	CONSOLE_THEME_EXAMPLE_PATH = File.join(Padrino.root,'/public/console_theme/')
	LOGIN_THEME_EXAMPLE_PATH = File.join(Padrino.root,'/public/login_theme/')
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
					case id
						when "color_loader" then
							File.open(@path + LOGIN_THEME_COLORS[id]['file'], 'r+')  do |f|
								line = f.readlines[0].gsub(/[A-Fa-f0-9]{6}/, color)
								f.pos = 0
								f.write line
							end
						else
							File.open(@path + LOGIN_THEME_COLORS[id]['file'], 'r+')  do |f|
								lines = f.readlines
								group_init = lines.index{|x| x.include? LOGIN_THEME_COLORS[id]['group']}
								return unless group_init
								group_end = group_init + lines[group_init..-1].index{|x| x.include? '}'}
								color_line = group_init + lines[group_init..group_end].index{|x| x.split(':')[0].strip ==  LOGIN_THEME_COLORS[id]['element']}
								lines[color_line] = lines[color_line].gsub(/[A-Fa-f0-9]{6}/, color)
								f.pos = 0
								f.write lines
							end
					end
					@custom_colors[id] = CONSOLE_THEME_COLORS[id]
				end
			elsif @type == :login
				colors.each do |id, color|
					File.open(@path + LOGIN_THEME_COLORS[id]['file'], 'r+')  do |f|
						lines = f.readlines
						group_init = lines.index{|x| x.include? LOGIN_THEME_COLORS[id]['group']}
						return unless group_init
						group_end = group_init + lines[group_init..-1].index{|x| x.include? '}'}
						color_line = group_init + lines[group_init..group_end].index{|x| x.split(':')[0].strip ==  LOGIN_THEME_COLORS[id]['element']}
						lines[color_line] = lines[color_line].gsub(/[A-Fa-f0-9]{6}/, color)
						f.pos = 0
						f.write lines
					end
					@custom_colors[id] = LOGIN_THEME_COLORS[id]
				end

			end
		end
	end

	def compile theme
		if theme.type == :console
			css_files = CONSOLE_THEME_CSS
		else
			css_files = LOGIN_THEME_CSS
		end

		css_files.values.each do |css|
		 	if css['file'].include? 'base.css'
		 		res = %x(#{FLEX_SDK}/bin/mxmlc #{theme.path + css['file']} -compiler.library-path #{UTILS_PATH}/degrafa_swc #{FLEX_SDK}/frameworks/libs/flex.swc)
		 		raise Exception.new "Error compiling #{theme.path + css['file']}: #{res}" unless $? == 0
		 	else
		 		res = %x(#{FLEX_SDK}/bin/mxmlc #{theme.path + css['file']})
		 		raise Exception.new "Error compiling #{theme.path + css['file']}: #{res}" unless $? == 0
		 	end
		end
	end

	def pack theme
		css_files = ''
		if theme.type == :console
			css_files = CONSOLE_THEME_CSS
		else
			css_files = LOGIN_THEME_CSS
		end

		#Delete useless files
		css_files.values.each {|css| %x(rm -f #{theme.path + css['file']})}
		%x(rm -rf #{theme.path}/assets/)

		#Tar it!
		%x(cd /tmp/; tar cfvz #{Padrino.root}/public/downloads/#{theme.name}.tar.gz  #{theme.name})
		raise Exception.new "Error running tar on #{theme.path}" unless $? == 0

		%x(rm -rf /tmp/#{theme.path})

		return "#{theme.name}.tar.gz"
	end

	def create_login_theme name
		path = "/tmp/#{name}_login_theme/"
		
		raise Exception.new 'Already exists a login theme with this name' if File.exist? "#{Padrino.root}/public/downloads/#{name}_login_theme.tar.gz"
		%x(rm -rf #{path})
		%x(cp -R #{LOGIN_THEME_EXAMPLE_PATH} #{path})

		return Theme.new :login, "#{name}_login_theme", path
	end

	def create_console_theme name
		path = "/tmp/#{name}_console_theme/"

		raise Exception.new 'Already exists a console theme with this name' if File.exist? "#{Padrino.root}/public/downloads/#{name}_console_theme.tar.gz"
		%x(rm -rf #{path})
		%x(cp -R #{CONSOLE_THEME_EXAMPLE_PATH} #{path})

		return Theme.new :console, "#{name}_console_theme", path
	end

end
