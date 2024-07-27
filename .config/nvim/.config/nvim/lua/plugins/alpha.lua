return {
  "goolord/alpha-nvim",
  lazy = vim.fn.argc() ~= 0, -- only load when no file specified
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
                     ; ; ;                                 
                   ;        ;  ;     ;;    ;               
                ;                 ;         ;  ;           
                               ;               ;;         
               ;            ';,        ;               ;   
               ;             'b      *                   
                ;              '$    ;;                ;;  
               ;    ;           $:   ;:              ;    
                         ;     :@,@):   ,;**:'   ;        
              ;      ;,         :@@*: ;;**'      ;   ;     
                       ';o;    ;:(@';@*"'  ;               
                          ,p$q8,:@)'  ;p*'      ;          
                   ;       ' ; '@@Pp@@*'    ;  ;           
                    ;  ; ;;      Y7'.'     ;  ;            
                                 :@):.                     
                              .::(@:.                      
        _'-.--*_-'-_*'.'-*_---'-----*_'-.*_--'-'-'_*:.'*-  
    ]]

    local function button(key, icon, name, command)
      local b = dashboard.button(key, " " .. icon .. "  " .. name, "<cmd>" .. command .. "<CR>")
      b.opts.hl = "AlphaButtons"
      b.opts.hl_shortcut = "AlphaShortcut"
      b.opts.position = "center"
      b.opts.width = 25
      return b
    end

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      button("f", "", "Find File", "Telescope find_files"),
      button("e", "", "File Explorer", "Neotree"),
      button("q", "", "Quit", "qa!"),
    }
    dashboard.section.footer.val = "♥"
    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.config)
  end,
}
