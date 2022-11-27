local status_ok, impatient = pcall(require, "impatient")
if status_ok then
  impatient.enable_profile()
end

require('leap').set_default_keymaps()
require "user.core"
require "user.highlights"
require "user.colorscheme"
require "user.plugins"
