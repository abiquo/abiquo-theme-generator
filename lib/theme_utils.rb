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

module ThemeUtils

	BASE_THEME_COLORS = {
		#'color_loader' => {'name' => 'Loader Color', 'color' => 'FFD200', 'file' => 'color_loader.txt'},
		#'aplication_theme_color' => {'name' => 'Application Theme Color', 'group' => 'Application', 'element' => 'theme-color', 'color' => '000000', 'file' => 'arialComplete.css'},
		'text_input_color' => {'name' => 'Text Input Color', 'group' => 'TextInput', 'element' => 'color', 'color' => '505050', 'file' => 'base.css'}
	}

	BASE_THEME_CSS = {
		'base' => {'name' => 'Base CSS', 'file' => 'base.css'},
		'logo' => {'name' => 'Login Logo CSS', 'file' => 'logo.css'}
	}

	BASE_THEME_IMAGES = {
		'custom_preloader_logo' => {'name' => 'Custom Preloader Logo', 'file' => 'CustomPreloaderLogo.png'},
		'virtual_image_default_icon' => {'name' => 'VirtualImage default icon', 'file' => 'VirtualImage_defaultIcon.jpg'},
		'login_logo' => {'name' => 'Login logo', 'file' => 'assets/application/login/logo.png'}
	}

	ENTERPRISE_COLORS = {
		'footer_text' => {'name' => 'Footer Text', 'group' => 'footerText', 'element' => 'color', 'color' => 'CCCCCC', 'file' => 'main.css'}
	}

	ENTERPRISE_IMAGES = {
		# 'id'=> { name => 'name', file => 'file'} File path must be from assets/
		'application_postlogin_background_image' => {'name' => 'Post Login Background Image', 'file' => 'assets/application/postlogin_background_image.png'}
	}
	ENTERPRISE_CSS = {
		# 'id'=> { name => 'name', file => 'file'}
		'abicloud_premium' => {'name' => 'Abicloud Premium', 'file' => 'abicloud_premium.css'},
		'application' => {'name' => 'Application', 'file' => 'application.css'},
		'configuration_components_heart_beat' => {'name' => 'Configuration Components HeartBeat', 'file' => 'ConfigurationComponentsHeartBeat.css'},
		'configuration_components_management' => {'name' => 'Configuration Components Management', 'file' => 'ConfigurationComponentsManagement.css'},
		'infrastructure' => {'name' => 'Infrastructure', 'file' => 'infrastructure.css'},
		'main' => {'name' => 'Main', 'file' => 'main.css'},
		'metering' => {'name' => 'Metering', 'file' => 'metering.css'},
		'networking' => {'name' => 'Networking', 'file' => 'networking.css'},
		'user' => {'name' => 'User', 'file' => 'user.css'},
		'virtualappliance' => {'name' => 'Virtual Appliance', 'file' => 'virtualappliance.css'},
		'virtualdatacenter' => {'name' => 'Virtual DataCenter', 'file' => 'virtualdatacenter.css'},
		'virtualimage' => {'name' => 'Virtual Image', 'file' => 'virtualimage.css'}

	}

	ENT_THEME_EXAMPLE_PATH = File.join(Padrino.root,'/enterprise_theme/')
	BASE_THEME_EXAMPLE_PATH = File.join(Padrino.root,'/base_theme/')
	UTILS_PATH = File.join(Padrino.root,'/utils/')
	FLEX_SDK = File.join(UTILS_PATH,'/flex_sdk/')

	class Theme
		attr_reader :name, :path, :type, :custom_files
		def initialize type, name, path
			@name = name
			@path = path
			@type = type
			@custom_images = {} # 'id'=> { name => 'name', file => 'file'}
			@custom_colors = {} # 'id'=> { name => 'name', color => '000000'}
		end

		def replace_images images
			if @type == :base
				images.each do |id, content|
					File.open(@path + BASE_THEME_IMAGES[id]['file'], 'w') { |f| f.puts content } if BASE_THEME_IMAGES[id]
					@custom_images[id] = BASE_THEME_IMAGES[id]
				end
			elsif @type == :enterprise
				images.each do |id, content|
					File.open(@path + ENTERPRISE_IMAGES[id]['file'], 'w') { |f| f.puts content } if ENTERPRISE_IMAGES[id]
					@custom_images[id] = ENTERPRISE_IMAGES[id]
				end
			end
		end


		def replace_colors colors
			if @type == :base
				colors.each do |id, color|
					File.open(@path + BASE_THEME_COLORS[id]['file'], 'r+')  do |f|
						lines = f.readlines
						group_init = lines.index{|x| x.include? BASE_THEME_COLORS[id]['group']}
						return unless group_init
						group_end = group_init + lines[group_init..-1].index{|x| x.include? '}'}
						color_line = group_init + lines[group_init..group_end].index{|x| x.split(':')[0].strip ==  BASE_THEME_COLORS[id]['element']}
						lines[color_line] = lines[color_line].gsub(/[A-Fa-f0-9]{6}/, color)
						f.pos = 0
						f.write lines
					end
					@custom_colors[id] = BASE_THEME_COLORS[id]
				end
			elsif @type == :enterprise
				colors.each do |id, color|
					File.open(@path + ENTERPRISE_COLORS[id]['file'], 'r+')  do |f|
						lines = f.readlines
						group_init = lines.index{|x| x.include? ENTERPRISE_COLORS[id]['group']}
						return unless group_init
						group_end = group_init + lines[group_init..-1].index{|x| x.include? '}'}
						color_line = group_init + lines[group_init..group_end].index{|x| x.split(':')[0].strip ==  ENTERPRISE_COLORS[id]['element']}
						lines[color_line] = lines[color_line].gsub(/[A-Fa-f0-9]{6}/, color)
						f.pos = 0
						f.write lines
					end
					@custom_colors[id] = ENTERPRISE_COLORS[id]
				end

			end
		end
	end

	def compile theme
		#TODO
		if theme.type == :enterprise
			css_files = ENTERPRISE_CSS
		else
			css_files = BASE_THEME_CSS
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
		if theme.type == :enterprise
			css_files = ENTERPRISE_CSS
		else
			css_files = BASE_THEME_CSS
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

	def create_base_theme name
		path = "/tmp/#{name}_base_theme/"
		
		raise Exception.new 'Already exists a base theme with this name' if File.exist? "#{Padrino.root}/public/downloads/#{name}_base_theme.tar.gz"
		%x(cp -R #{BASE_THEME_EXAMPLE_PATH} #{path})

		return Theme.new :base, "#{name}_base_theme", path
	end

	def create_ent_theme name
		path = "/tmp/#{name}_theme/"

		raise Exception.new 'Already exists a theme with this name' if File.exist? "#{Padrino.root}/public/downloads/#{name}_theme.tar.gz"
		%x(cp -R #{ENT_THEME_EXAMPLE_PATH} #{path})

		return Theme.new :enterprise, "#{name}_theme", path
	end

end
