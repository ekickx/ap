vim.cmd[[packadd pears.nvim]]

require('pears').setup(function(conf)
  conf.preset('tag_matching')

  -- Don't create new line when enter completion
  conf.on_enter(function(pears_handle)
    if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~= -1 then
      return vim.fn["compe#confirm"]("<CR>")
    else
      pears_handle()
    end
  end)
end)