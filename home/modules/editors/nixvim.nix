{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs = {
    nixvim = {
      enable = true;
      enableMan = true;
      colorschemes.base16.enable = true;
      opts = {
        hlsearch = true;
        mouse = "a";
        breakindent = true;
        undofile = true;
        timeoutlen = 300;
        completeopt = "menu,menuone,noselect";
        conceallevel = 2; # Hide * markup for bold and italic, but not markers with substitutions
        confirm = true; # Confirm to save changes before exiting modified buffer
        cursorline = true; # Enable highlighting of the current line
        expandtab = true; # Use spaces instead of tabs
        formatoptions = "jcroqlnt"; # tcqj
        grepformat = "%f:%l:%c:%m";
        grepprg = "rg --vimgrep";
        ignorecase = true;
        inccommand = "nosplit"; # preview incremental substitute
        laststatus = 3; # global statusline
        list = true; # Show some invisible characters (tabs...
        number = true; # Print line number
        pumblend = 10; # Popup blend
        pumheight = 10; # Maximum number of entries in a popup
        relativenumber = true; # Relative line numbers
        scrolloff = 4; # Lines of context
        sessionoptions = ["buffers" "curdir" "tabpages" "winsize" "help" "globals" "skiprtp" "folds"];
        shiftround = true; # Round indent
        shiftwidth = 2; # indent size
        showmode = false; # Dont show mode since we have a statusline
        sidescrolloff = 8; # Columns of context
        signcolumn = "yes"; # Always show the signcolumn, otherwise it would shift the text each time
        smartcase = true; # Don't ignore case with capitals
        smartindent = true; # Insert indents automatically
        spelllang = ["en"];
        splitbelow = true; # Put new windows below current
        splitkeep = "screen";
        splitright = true; # Put new windows right of current
        tabstop = 2; #
        termguicolors = true;
        undolevels = 10000;
        updatetime = 200; # Save swap file and trigger CursorHold
        virtualedit = "block"; # Allow cursor to move where there is no text in visual block mode
        wrap = false; # Disable line wrap
      };
      globals = {
        mapleader = " ";
      };
      extraPackages = with pkgs; [vimPlugins.nvim-web-devicons];
      clipboard = {
        register = "unnamedplus";
        providers = {
          wl-copy.enable = true;
          xclip.enable = true;
        };
      };
      keymaps = [
        {
          action = "<cmd>Telescope fd<CR>";
          key = "<leader><space>";
          options = {
            silent = true;
          };
        }
        {
          action = "<cmd>Telescope live_grep<CR>";
          key = "<leader>/";
          options = {
            silent = true;
          };
        }
        {
          action = "<cmd>Telescope oldfiles<CR>";
          key = "<leader>fr";
          options = {
            silent = true;
          };
        }
        {
          action = "<cmd>Oil<CR>";
          key = "<leader>e";
          options = {
            silent = true;
          };
        }
        {
          action = "<cmd>bnext<CR>";
          key = "<leader>bh";
          options = {
            silent = true;
          };
        }
        {
          action = "<cmd>bprevious<CR>";
          key = "<leader>bl";
          options = {
            silent = true;
          };
        }
        {
          action = "<cmd>e #<CR>";
          key = "<leader>bb";
          options = {
            silent = true;
          };
        }
        {
          action = "<cmd>BufferDelete<CR>";
          key = "<leader>bd";
          options = {
            silent = true;
          };
        }
      ];
      plugins = {
        # coding
        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            mapping = {
              "<Down>" = "cmp.mapping.select_next_item()";
              "<Up>" = "cmp.mapping.select_prev_item()";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-Space>" = " cmp.mapping.complete {}";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            };
            sources = [
              {name = "nvim_lsp";}
              {name = "path";}
              {name = "buffer";}
              {name = "luasnip";}
            ];
            snippet.expand = ''
              function(args)
                require "luasnip".lsp_expand(args.body)
              end
            '';
          };
        };
        luasnip.enable = true;
        cmp_luasnip.enable = true;

        # editors
        # neo-tree.enable = true;
        oil.enable = true;
        telescope = {
          enable = true;
          extensions = {
            fzf-native.enable = true;
          };
        };
        flash.enable = true;
        gitsigns.enable = true;
        conform-nvim.enable = true;
        lint.enable = true;
        # nvim-autopairs.enable = true;
        # comment = {
        #   enable = true;
        # };

        # lsp
        lsp = {
          enable = true;
          servers = {
            tsserver.enable = true;
            rust-analyzer = {
              enable = true;
              installCargo = false;
              installRustc = false;
            };
            lua-ls.enable = true;
            pyright.enable = true;
            dockerls.enable = true;
            nil_ls.enable = true;
          };
        };
        lspkind.enable = true;
        cmp-nvim-lsp.enable = true;

        # treesitter
        treesitter = {
          enable = true;
          ensureInstalled = "all";
          incrementalSelection = {
            enable = true;
            keymaps = {
              initSelection = "+";
              nodeIncremental = "+";
              nodeDecremental = "-";
            };
          };
          nixvimInjections = true;
        };
        cmp-treesitter.enable = true;

        # ui
        barbar = {
          enable = true;
          autoHide = true;
          clickable = true;
        };
        lualine = {
          enable = true;
          iconsEnabled = true;
          # theme = "onedark";
          componentSeparators = {
            left = " ";
            right = " ";
          };
          sectionSeparators = {
            left = " ";
            right = " ";
          };
        };
        dashboard = {
          enable = true;
        };
        indent-blankline = {
          enable = true;
          settings = {
            indent = {
              char = "│";
              tab_char = "│";
            };
          };
        };
        which-key.enable = true;
        # noice = {
        #   enable = true;
        #   lsp = {
        #     override = {
        #       "vim.lsp.util.convert_input_to_markdown_lines" = true;
        #       "vim.lsp.util.stylize_markdown" = true;
        #       "cmp.entry.get_documentation" = true;
        #     };
        #   };
        #   cmdline = {
        #     view = "cmdline";
        #   };
        #   presets = {
        #     bottom_search = true; # use a classic bottom cmdline for search
        #     command_palette = true; # position the cmdline and popupmenu together
        #     long_message_to_split = true; # long messages will be sent to a split
        #     inc_rename = false; # enables an input dialog for inc-rename.nvim
        #     lsp_doc_border = false; # add a border to hover docs and signature help
        #   };
        #   # routes = [
        #   #   {
        #   #     view = "notify";
        #   #     # filter = [
        #   #     #   {
        #   #     #     event = "msg_showmode";
        #   #     #   }
        #   #     # ];
        #   #   }
        #   # ];
        # };

        # etc
        mini = {
          enable = true;
          modules = {
            pairs = {};
            surround = {};
            comment = {};
            ai = {};
            indentscope = {
              symbol = "│";
              options.try_as_border = true;
            };
          };
        };
        direnv.enable = true;
        nix.enable = true;
        persistence.enable = true;
        # neocord.enable = true;
        toggleterm.enable = true;
      };
    };
  };

  home.sessionVariables.EDITOR = "nvim";
}
