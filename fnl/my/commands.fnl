(local {: cmd!
        : z} (require "my.utils"))

(cmd! :Z #(z $.args) {:nargs :*})

(cmd! :Config #(vim.cmd.edit
                 (.. (vim.fn.stdpath "config") "/" $.args))
      {:nargs :*})
