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

  BASE_THEME_IMAGES = {
    'abiquo_gray' => {'name' => 'abiquo_gray', 'file' => 'img/abiquo_gray.png'},
    'abiquo_login' => {'name' => 'abiquo_login', 'file' => 'img/abiquo_login.png'},
    'abiquo_logo' => {'name' => 'abiquo_logo', 'file' => 'img/abiquo_logo.png'},
    'abiquo_thumb' => {'name' => 'abiquo_thumb', 'file' => 'img/abiquo_thumb.png'},
    'abiquo_watermark' => {'name' => 'abiquo_watermark', 'file' => 'img/abiquo_watermark.png'},
    'arrow' => {'name' => 'arrow', 'file' => 'img/arrow.png'},
    'bg-container1-b' => {'name' => 'bg-container1-b', 'file' => 'img/bg-container1-b.png'},
    'bg-container1' => {'name' => 'bg-container1', 'file' => 'img/bg-container1.png'},
    'bg-sort' => {'name' => 'bg-sort', 'file' => 'img/bg-sort.png'},
    'bg-topiclist1' => {'name' => 'bg-topiclist1', 'file' => 'img/bg-topiclist1.gif'},
    'btn-green-c' => {'name' => 'btn-green-c', 'file' => 'img/btn-green-c.png'},
    'btn-search' => {'name' => 'btn-search', 'file' => 'img/btn-search.png'},
    'btn-sprite-top' => {'name' => 'btn-sprite-top', 'file' => 'img/btn-sprite-top.png'},
    'btn-t-b' => {'name' => 'btn-t-b', 'file' => 'img/btn-t-b.png'},
    'check' => {'name' => 'check', 'file' => 'img/check.png'},
    'chef_icon' => {'name' => 'chef_icon', 'file' => 'img/chef_icon.png'},
    'close' => {'name' => 'close', 'file' => 'img/close.png'},
    'discard_changes' => {'name' => 'discard_changes', 'file' => 'img/discard_changes.png'},
    'divider1' => {'name' => 'divider1', 'file' => 'img/divider1.gif'},
    'divider2' => {'name' => 'divider2', 'file' => 'img/divider2.gif'},
    'divider' => {'name' => 'divider', 'file' => 'img/divider.gif'},
    'drag' => {'name' => 'drag', 'file' => 'img/drag.png'},
    'glyphicons-halflings-white' => {'name' => 'glyphicons-halflings-white', 'file' => 'img/glyphicons-halflings-white.png'},
    'green-btn' => {'name' => 'green-btn', 'file' => 'img/green-btn.png'},
    'ico-edit' => {'name' => 'ico-edit', 'file' => 'img/ico-edit.gif'},
    'icon_error' => {'name' => 'icon_error', 'file' => 'img/icon_error.png'},
    'imagotipo' => {'name' => 'imagotipo', 'file' => 'img/imagotipo.jpg'},
    'img1' => {'name' => 'img1', 'file' => 'img/img1.png'},
    'img2' => {'name' => 'img2', 'file' => 'img/img2.png'},
    'img3' => {'name' => 'img3', 'file' => 'img/img3.png'},
    'item1' => {'name' => 'item1', 'file' => 'img/item1.jpg'},
    'item2' => {'name' => 'item2', 'file' => 'img/item2.jpg'},
    'list_hor_separator' => {'name' => 'list_hor_separator', 'file' => 'img/list_hor_separator.png'},
    'list_ver_separator' => {'name' => 'list_ver_separator', 'file' => 'img/list_ver_separator.png'},
    'loadingCursor' => {'name' => 'loadingCursor', 'file' => 'img/loadingCursor.gif'},
    'loading' => {'name' => 'loading', 'file' => 'img/loading.gif'},
    'logo' => {'name' => 'logo', 'file' => 'img/logo.jpg'},
    'logo' => {'name' => 'logo', 'file' => 'img/logo.png'},
    'mainmenu-buttons' => {'name' => 'mainmenu-buttons', 'file' => 'img/mainmenu-buttons.png'},
    'map-marker' => {'name' => 'map-marker', 'file' => 'img/map-marker.png'},
    'photo1' => {'name' => 'photo1', 'file' => 'img/photo1.jpg'},
    'refresh_black' => {'name' => 'refresh_black', 'file' => 'img/refresh_black.png'},
    'refresh' => {'name' => 'refresh', 'file' => 'img/refresh.png'},
    'separator' => {'name' => 'separator', 'file' => 'img/separator.png'},
    'spinner' => {'name' => 'spinner', 'file' => 'img/spinner.gif'},
    'user' => {'name' => 'user', 'file' => 'img/user.png'},
    'vm_corner_icon' => {'name' => 'vm_corner_icon', 'file' => 'img/vm_corner_icon.png'},
    'vm_slave_icon' => {'name' => 'vm_slave_icon', 'file' => 'img/vm_slave_icon.png'},
    'vm_tomaster_icon' => {'name' => 'vm_tomaster_icon', 'file' => 'img/vm_tomaster_icon.png'},
    'vm_user_icon_bottom' => {'name' => 'vm_user_icon_bottom', 'file' => 'img/vm_user_icon_bottom.png'},
    'vm_user_icon' => {'name' => 'vm_user_icon', 'file' => 'img/vm_user_icon.png'}

  }

	CONSOLE_THEME_COLORS = {
		'backgroundColor' => {'name' => 'Background color', 'color' => 'AA3333', 'file' => 'less/app.less'},
		'baseColor' => {'name' => 'Base color', 'color' => 'AA3333', 'file' => 'less/app.less'}
	}

	CONSOLE_THEME_IMAGES = {
		'main_menu_logo' => {'name' => 'Main Menu logo', 'file' => 'img/abiquo_login.png'},
		'main_menu_buttons_sprite' => {'name' => 'Main menu buttons sprite', 'file' => 'img/mainmenu-buttons.png'},
		'virtual_machine_default_icon' => {'name' => 'Virtual Machine default icon', 'file' => 'img/vm_user_icon.png'}
	}

	LOGIN_THEME_COLORS = {
		'baseColor' => {'name' => 'Base color', 'color' => 'BB6666', 'file' => 'less/app_unsecured.less'}
	}

	LOGIN_THEME_IMAGES = {
		'login_watermark' => {'name' => 'Login watermark', 'file' => 'img/abiquo_watermark.png'},
		'login_logo' => {'name' => 'Login logo', 'file' => 'img/abiquo_login.png'}
	}

  ROOT_THEME_EXAMPLE_PATH = File.join(Padrino.root,'/public/root_theme_files/')
  BASE_THEME_PATH = File.join(Padrino.root,'/public/root_theme_files/app/theme/abicloudDefault/')
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
      elsif @type == :base
        images.each do |id, content|
          id_image = id.split('.')[0]
          id_file = id.split('.')[1]
          tmp_image = BASE_THEME_IMAGES[id_image]

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
			elsif @type == :login
				colors.each do |id, color|
					%x(sed -i.bak "s/@#{id}: #.\\{6\\}/@#{id}: ##{color}/" #{@path}less/app_unsecured.less)
				end
			end
		end

	end

	def compile theme

    if not theme.type == :base
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
	end

	def pack theme

		#Tar it!
		if theme.type == :console
			%x(cd /tmp/ROOT_THEME/build/theme; tar cfvz #{Padrino.root}/public/downloads/#{theme.name}.tar.gz  #{theme.name})
		elsif theme.type == :login
			%x(cd /tmp/ROOT_THEME/build/theme; tar cfvz #{Padrino.root}/public/downloads/#{theme.name}.tar.gz #{theme.name} abicloudDefault)
    elsif theme.type == :base
      %x(cd /tmp/#{theme.name}; tar cfvz #{Padrino.root}/public/downloads/#{theme.name}.tar.gz abicloudDefault > /tmp/command.txt)
		end

		raise Exception.new "Error running tar on #{theme.path}" unless $? == 0

		%x(rm -rf /tmp/ROOT_THEME) 
    %x(rm -rf /tmp/{theme.name}) if theme.type == :base

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

  def create_base_theme name
    path = "/tmp/#{name}_base_theme/"

    raise Exception.new 'Already exists a base theme with this name' if File.exist? "#{Padrino.root}/public/downloads/#{name}_base_theme.tar.gz"
    %x(rm -rf #{path})
    %x(mkdir -p #{path}/abicloudDefault)
    %x(cp -R #{BASE_THEME_PATH}/img #{path}/abicloudDefault/img)

    return Theme.new :base, "#{name}_base_theme", path + "abicloudDefault/"
  end

end
