# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

extension_name = 'handeval'
dir_config(extension_name)
have_library 'pokerlib'
create_makefile(extension_name)
