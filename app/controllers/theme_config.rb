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

include ThemeUtils

AbiquoBranding.controllers :theme_config do
  get :index, :map => "/theme" do
    True
  end

  get :create, :map => "/create_theme" do

    if params['type'] == 'enterprise'

      images = []
      ThemeUtils::ENTERPRISE_IMAGES.sort.each do |id, info|
        all_info = info
        all_info.store 'id', id
        images.push all_info
      end

      colors = []
      ThemeUtils::ENTERPRISE_COLORS.sort.each do |id, info|
        all_info = info
        all_info.store 'id', id
        colors.push all_info
      end
      
      header_icons = []
      ThemeUtils::ENTERPRISE_HEADER_IMAGES.sort.each do |id, info|
        all_info = info
        all_info.store 'id', id
        header_icons.push all_info
      end

      render 'theme_config/create_theme_form.liquid', :locals => {:enterprise => true, :colors => colors, :images => images, :header_icons => header_icons}

    elsif params['type'] == 'base'
      
      colors = []
      ThemeUtils::BASE_THEME_COLORS.sort.each do |id, info|
        all_info = info
        all_info.store 'id', id
        colors.push all_info
      end

      images = []
      ThemeUtils::BASE_THEME_IMAGES.sort.each do |id, info|
        all_info = info
        all_info.store 'id', id
        images.push all_info
      end

      render 'theme_config/create_theme_form.liquid', :locals => {:base => true, :colors => colors, :images => images}
    end

  end

  post :create, :map => "/create_theme" do
    #Create a new theme
    begin
      theme = ThemeUtils.create_ent_theme params['theme_name'] if params['type'] == 'enterprise'
      theme = ThemeUtils.create_base_theme params['theme_name'] if params['type'] == 'base'
    rescue Exception => e
      return render 'theme_config/error.liquid', :locals => {:error => e.message}
    end

    #Only save images from the list
    custom_images = {}
    params.each do |id, content|
      id_image = id.split('.')[0]
      custom_images[id] = content[:tempfile].read if (ThemeUtils::ENTERPRISE_IMAGES[id_image] or
                                                      ThemeUtils::BASE_THEME_IMAGES[id_image] or 
                                                      ThemeUtils::ENTERPRISE_HEADER_IMAGES[id_image])
    end

    #Only save colors from the list
    custom_colors = {}
    params.each do |id, color|
      custom_colors[id] = color.delete('#') if (ThemeUtils::ENTERPRISE_COLORS[id] or ThemeUtils::BASE_THEME_COLORS[id])
    end

    #Replace example CSS by custom CSS
    theme.replace_images custom_images

    #Replace example COLORS by custom COLORS
    theme.replace_colors custom_colors

    #Compile
    ThemeUtils.compile theme
    file_name = ThemeUtils.pack theme

    render 'theme_config/created.liquid', :locals => {:file_name => file_name}
  end
  
end
