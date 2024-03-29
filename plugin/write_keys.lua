vim.api.nvim_create_user_command('PrintJsonKeys', function()
  require'write_keys'.print_json_keys()
end, {desc = 'Fetch JSON and print its keys'})
