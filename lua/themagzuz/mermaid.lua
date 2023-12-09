local job = nil
vim.api.nvim_create_autocmd("FileType", {
  pattern = "mmd",
  callback = function ()
    vim.api.nvim_create_user_command('MarkdownRender', function ()
      if job ~= nil then
        return
      end
      local filename = vim.fn.expand("%:f")
      local out_filename = vim.fn.expand("%:r") .. ".pdf"
      local command = {'entr', 'pandoc', filename, '-F', 'mermaid-filter', '-o', out_filename}
      job = vim.fn.jobstart(command)
      vim.fn.jobstart({'zathura', out_filename})
    end, {})

    vim.api.nvim_create_user_command('MarkdownStop', function ()
      vim.fn.jobstop(job)
      job = nil
    end, {})
  end
})
