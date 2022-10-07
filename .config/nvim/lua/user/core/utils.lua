local command = vim.api.nvim_create_user_command

function _G.reload_config()
  for name, _ in pairs(package.loaded) do
    if name:match "^user" and name ~= "user.plugins.lsp.mason" and name ~= "user.plugins.autopairs" then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

function _G.format_code()
  return vim.lsp.buf.format({ async = true })
end

function _G.set_highlights(highlight)
  for name, colors in pairs(highlight) do
    if not vim.tbl_isempty(colors) then
      vim.api.nvim_set_hl(0, name, colors)
    end
  end
end

function _G.update_config()
  local args = "git -C " .. vim.fn.stdpath "config" .. " pull --ff-only"
  vim.fn.system(args)
end

command("Format", function()
  format_code()
end, { nargs = "*" })

command("Reload", function()
  reload_config()
  vim.notify("Reload Done", vim.log.levels.INFO)
end, { nargs = "*" })

command("Update", function()
  update_config()
  vim.notify("Update Done", vim.log.levels.INFO)
end, { nargs = "*" })
