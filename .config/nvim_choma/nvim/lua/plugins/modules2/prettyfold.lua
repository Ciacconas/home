return {
    'anuvyklack/pretty-fold.nvim',
    lazy=false,
    config = function()
      require('pretty-fold').setup{
          fill_char = '-',
          sections = {
            left = {
              'content',
           },
                right = {
                  ' ', 'number_of_folded_lines',
                  function(config) return config.fill_char:rep(3) end
                }
        }

      }

    end
}