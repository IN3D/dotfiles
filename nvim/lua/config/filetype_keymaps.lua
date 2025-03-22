local create_language_augroup = function(name)
  return vim.api.nvim_create_augroup('LanguageKeymap_' .. name, { clear = true })
end

-- Ruby
local ruby_group = create_language_augroup('ruby')
vim.api.nvim_create_autocmd('FileType', {
  group = ruby_group,
  pattern = { 'ruby', 'eruby' },
  callback = function(opts)
    local buffer = opts.buf
    local keymap_opts = { buffer = buffer, silent = true, noremap = true }

    ------------
    -- Basics --
    ------------
    vim.keymap.set('n', '<localleader>c', ':Dispatch ruby -c %<CR>', keymap_opts)
    vim.keymap.set('n', '<localleader>r', ':Dispatch ruby %<CR>', keymap_opts)
    vim.keymap.set('n', '<localleader>b', function()
      -- add a 'binding.pry' line for debugging
      local line = vim.api.nvim_get_current_line()
      local indent = string.match(line, '^%s*')
      vim.api.nvim_put({indent .. 'binding.pry'}, 'l', true, true)
    end, keymap_opts)

    -------------
    -- Testing --
    -------------
    local cmd = 'Dispatch -compiler=rspec bundle exec rspec --format progress'
    -- Run rspec on project
    vim.keymap.set('n', '<localleader>tp', ':' .. cmd .. '<CR>', keymap_opts)

    -- Run rspec on file
    vim.keymap.set('n', '<localleader>tf', ':' .. cmd .. ' %<CR>', keymap_opts)

    -- Run Rspec on the current line
    vim.keymap.set('n', '<localleader>tl', function()
      local line_num = vim.fn.line('.')
      vim.cmd(cmd .. ' %:' .. line_num)
    end, keymap_opts)
  end
})

