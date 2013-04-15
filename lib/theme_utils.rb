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

	BASE_THEME_COLORS = {
		'color_loader' => {'name' => 'Loader ProgressBar color', 'color' => 'FFD200', 'file' => 'color_loader.txt'}
	}

	BASE_THEME_CSS = {
		'base' => {'name' => 'Base CSS', 'file' => 'base.css'},
		'logo' => {'name' => 'Login Logo CSS', 'file' => 'logo.css'}
	}

	BASE_THEME_IMAGES = {
		'custom_preloader_logo' => {'name' => 'Preloader Logo', 'file' => 'CustomPreloaderLogo.png'},
		'login_logo' => {'name' => 'Login logo', 'file' => 'assets/application/login/logo.png'},
		'login_background' => {'name' => 'Login Background', 'file' => 'assets/application/login_background_image.jpg'},
		'button' => {
			'name' => 'Button skins',
			'files' => {
				'up_skin' => {'name' => 'Default skin', 'path' => 'assets/flexcomponents/button/up_skin.png'},
				'over_skin' => {'name' => 'Over skin', 'path' => 'assets/flexcomponents/button/over_skin.png'},
				'down_skin' => {'name' => 'Down skin', 'path' => 'assets/flexcomponents/button/down_skin.png'},
				'disabled_skin' => {'name' => 'Disabled skin', 'path' => 'assets/flexcomponents/button/disabled_skin.png'}
			}
		}
	}

	ENTERPRISE_COLORS = {
		#'footer_text' => {'name' => 'Footer Text', 'group' => 'footerText', 'element' => 'color', 'color' => 'CCCCCC', 'file' => 'main.css'}
	}

	ENTERPRISE_IMAGES = {
		'generalpanel' => {
			'name' => 'Header and bottom skins',
			'files' => {
				'header' => {'name' => 'Header skin', 'path' => 'assets/application/skins/generalpanel_header_skin.png'},
				'bottom' => {'name' => 'Bottom skin', 'path' => 'assets/application/skins/generalpanel_bottom_skin.png'},		
			}
		},
		'button' => {
			'name' => 'Button skins',
			'files' => {
				'up_skin' => {'name' => 'Default skin', 'path' => 'assets/flexcomponents/button/up_skin.png'},
				'over_skin' => {'name' => 'Over skin', 'path' => 'assets/flexcomponents/button/over_skin.png'},
				'down_skin' => {'name' => 'Down skin', 'path' => 'assets/flexcomponents/button/down_skin.png'},
				'disabled_skin' => {'name' => 'Disabled skin', 'path' => 'assets/flexcomponents/button/disabled_skin.png'}
			}
		},
		'configuration' => {
			'name' => 'Configuration icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/configurationbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/configurationbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/configurationbutton/down_icon.png'}
			}
		},
		'documentation' => {
			'name' => 'Documentation icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/documentationbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/documentationbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/documentationbutton/down_icon.png'}
			}
		},
		'infrastructure' => {
			'name' => 'Infrastructure icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/infrastructurebutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/infrastructurebutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/infrastructurebutton/down_icon.png'}
			}
		},
		'logout' => {
			'name' => 'Logout icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/logoutbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/logoutbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/logoutbutton/down_icon.png'}
			}
		},
		'events' => {
			'name' => 'Events icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/meteringbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/meteringbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/meteringbutton/down_icon.png'}
			}
		},
		'pricing' => {
			'name' => 'Pricing icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/pricingbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/pricingbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/pricingbutton/down_icon.png'}
			}
		},
		'reports' => {
			'name' => 'Reports icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/reportbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/reportbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/reportbutton/down_icon.png'}
			}
		},
		'home' => {
			'name' => 'Home icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/startbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/startbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/startbutton/down_icon.png'}
			}
		},
		'support' => {
			'name' => 'Support icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/supportbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/supportbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/supportbutton/down_icon.png'}
			}
		},
		'users' => {
			'name' => 'Users icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/usersbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/usersbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/usersbutton/down_icon.png'}
			}
		},
		'virtualdatacenters' => {
			'name' => 'Virtual Datacenters icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/virtualappbutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/virtualappbutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/virtualappbutton/down_icon.png'}
			}
		},
		'appslibrary' => {
			'name' => 'Apps library icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/virtualimagebutton/up_icon.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/virtualimagebutton/over_icon.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/virtualimagebutton/down_icon.png'}
			}
		},
		'promoteicon' => {
			'name' => 'Promote virtualimage icon',
			'files' => {
				'up_icon' => {'name' => 'Default icon','path' => 'assets/virtualimage/promotebutton/buttonPromote.png'},
				'over_icon' => {'name' => 'Over icon', 'path' => 'assets/virtualimage/promotebutton/buttonPromote_over.png'},
				'down_icon' => {'name' => 'Down icon', 'path' => 'assets/virtualimage/promotebutton/buttonPromote_down.png'}
			}
		}
	}
	ENTERPRISE_CSS = {
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
			@type = type
			@name = name
			@path = path
			@custom_images = {}
			@custom_colors = {}
		end

		def replace_images images
			if @type == :base
				images.each do |id, content|
					id_image = id.split('.')[0]
					id_file = id.split('.')[1]
					tmp_image = BASE_THEME_IMAGES[id_image]
					
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
			elsif @type == :enterprise
				images.each do |id, content|
					id_image = id.split('.')[0]
					id_file = id.split('.')[1]
					tmp_image = ENTERPRISE_IMAGES[id_image]
					
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
			if @type == :base
				colors.each do |id, color|
					case id
						when "color_loader" then
							File.open(@path + BASE_THEME_COLORS[id]['file'], 'r+')  do |f|
								line = f.readlines[0].gsub(/[A-Fa-f0-9]{6}/, color)
								f.pos = 0
								f.write line
							end
						else
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
		%x(rm -rf #{path})
		%x(cp -R #{BASE_THEME_EXAMPLE_PATH} #{path})

		return Theme.new :base, "#{name}_base_theme", path
	end

	def create_ent_theme name
		path = "/tmp/#{name}_theme/"

		raise Exception.new 'Already exists a theme with this name' if File.exist? "#{Padrino.root}/public/downloads/#{name}_theme.tar.gz"
		%x(rm -rf #{path})
		%x(cp -R #{ENT_THEME_EXAMPLE_PATH} #{path})

		return Theme.new :enterprise, "#{name}_theme", path
	end

end
