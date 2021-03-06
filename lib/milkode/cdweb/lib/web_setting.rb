# -*- coding: utf-8 -*-
#
# @file 
# @brief
# @author ongaeshi
# @date   2012/03/24

require 'milkode/cdweb/lib/database'
require 'yaml'

module Milkode
  class WebSetting
    DEFAULT_SETTING = {
      :home_title    => "Milkode",
      :home_icon     => "/images/MilkodeIcon135.png",

      :header_title => "Milkode",
      :header_icon  => "/images/MilkodeIcon135.png",

      :display_about_milkode => true
    }

    def self.hash_method(name)
      define_method(name) do
        @data[name]
      end
    end

    def initialize
      fname = File.join(Database.dbdir, "milkweb.yaml")
      if FileTest.exist? fname
        open(fname) do |f|
          @data = YAML.load(f.read)
        end
      else
        @data = DEFAULT_SETTING
      end
    end

    hash_method :home_title
    hash_method :home_icon
    
    hash_method :header_title
    hash_method :header_icon

    def about_milkode
      if (@data[:display_about_milkode])
        ', <a href="http://milkode.ongaeshi.me">milkodeについて</a>'
      else
        ''
      end
    end
  end
end

