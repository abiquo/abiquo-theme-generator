Abiquo Theme Generator
======================

Web based abiquo theme generator 

Install
=======

git clone git://github.com/abiquo/abiquo-theme-generator.git 

cd abiquo-theme-generator

bundle install

thin start -d

Web access
==========
http://IP:3000/

How to add more elements to the branding form
=============================================

Locate the hash of the elements you want to modify on the file
lib/theme_utils.rb

ENTERPRISE_IMAGES
ENTERPRISE_COLORS
BASE_THEME_IMAGES
BASE_THEME_COLORS
BASE_THEME_CSS

Add to that hash the element you want to add to the generator,
to add a new button with three states, e.g.

'configuration' => {
  'name' => 'Configuration icon',
  'files' => {
    'up_icon' => {'name' => 'Default icon', 'path' => 'assets/application/main/header/configurationbutton/up_icon.png'},
    'over_icon' => {'name' => 'Over icon', 'path' => 'assets/application/main/header/configurationbutton/over_icon.png'},
    'down_icon' => {'name' => 'Down icon', 'path' => 'assets/application/main/header/configurationbutton/down_icon.png'}
   }
},

Make sure you use unique key for the top element.
All element of the hash will be parsed and show on the
webform. Name elements will be the ones displayed on the form.

