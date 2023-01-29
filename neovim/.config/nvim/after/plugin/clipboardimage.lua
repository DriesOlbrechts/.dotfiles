require('clipboard-image').setup( {
  default = {
    img_name = function ()
      vim.fn.inputsave()
      local name = vim.fn.input('Name: ')
      vim.fn.inputrestore()
      return name
    end,
  }
})
