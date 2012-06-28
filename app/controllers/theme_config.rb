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
    true
  end

  get :create, :map => "/create_theme" do

    if params['type'] == 'enterprise'

      @enterprise = true
      @images = ThemeUtils::ENTERPRISE_IMAGES.sort
      @colors = ThemeUtils::ENTERPRISE_COLORS.sort

      render 'theme_config/create_theme_form.erb'

    elsif params['type'] == 'base'
      @base = true
      @colors = ThemeUtils::BASE_THEME_COLORS.sort
      @images = ThemeUtils::BASE_THEME_IMAGES.sort

      render 'theme_config/create_theme_form.erb'
    end

  end

  post :create, :map => "/create_theme" do
    #Create a new theme
    begin
      theme = ThemeUtils.create_ent_theme params['theme_name'] if params['type'] == 'enterprise'
      theme = ThemeUtils.create_base_theme params['theme_name'] if params['type'] == 'base'
    rescue Exception => e
      @error = e.message
      return render 'theme_config/error.erb'
    end

    #Only save images from the list
    custom_images = {}
    params.each do |id, content|
      id_image = id.split('.')[0]
      custom_images[id] = content[:tempfile].read if (ThemeUtils::ENTERPRISE_IMAGES[id_image] or ThemeUtils::BASE_THEME_IMAGES[id_image])
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
    @file_name = ThemeUtils.pack theme

    render 'theme_config/created.erb'
  end

  post :delete, :map => "/delete_theme" do
    begin
      file = File.basename(File.expand_path(params['file']))
      path = File.join("#{Padrino.root}/public/downloads/#{file}")
      
      File.delete(path)
    rescue Exception => e
      @error = e.message
      return render 'theme_config/error.erb'
    end

    redirect url(:index)
  end
  
end
