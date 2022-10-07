local status_ok, impatient = pcall(require, "impatient")
if status_ok then
  impatient.enable_profile()
end

require "user.core"
require "user.colorscheme"
require "user.highlights"
require "user.plugins"
