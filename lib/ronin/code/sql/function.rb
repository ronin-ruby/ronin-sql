#
#--
# Ronin SQL - A Ronin library providing support for SQL related security
# tasks.
#
# Copyright (c) 2007-2008 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#++
#

require 'ronin/code/sql/expr'

module Ronin
  module Code
    module SQL
      class Function < Expr

        # Name of the function
        attr_reader :name

        # Fields passed to the function
        attr_reader :fields

        def initialize(name,*fields)
          @name = name
          @fields = fields
        end

        def emit
          tokens = emit_token(@name)
          
          tokens << Token.open_paren
          tokens += emit_list(@fields)
          tokens << Token.close_paren

          return tokens
        end

      end
    end
  end
end
