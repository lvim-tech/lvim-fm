local config = {
    ui = {
        default = "float",
        float = {
            border = { " ", " ", " ", " ", " ", " ", " ", " " },
            float_hl = "Normal",
            border_hl = "FloatBorder",
            blend = 0,
            height = 1,
            width = 1,
            x = 0,
            y = 1,
        },
        split = "rightbelow new", -- `leftabove new`, `rightbelow new`, `leftabove vnew 24`, `rightbelow vnew 24`
    },
    on_close = {},
    on_open = {},
    mappings = {
        split = "<C-x>",
        vsplit = "<C-v>",
        tabedit = "<C-t>",
        edit = "<C-e>",
        close = "<C-q>",
        qf = "<M-q>",
    },
    env = {
        LVIM_FM_CONFIG_PATH = os.getenv("HOME") .. "/.config/lvim-fm",
        LVIM_FM_BIN_PATH = vim.fn.fnamemodify(debug.getinfo(1, "S").source:gsub("^@", ""), ":h:h"),
        TERM_DEFAULT = vim.fn.getwinvar(0, "&term"),
        REVERSE = "--reverse",
        ICON_MENU = "",
        ICON_EXPLORER = "󰙅",
        ICON_SEARCH_DIRECTORIES_AND_FILES = "󱋣",
        ICON_SEARCH_DIRECTORIES = "󰉋",
        ICON_SEARCH_FILES = "󰈔",
        ICON_SEARCH_IN_FILES = "󰈙",
        ICON_POINTER = "",
        ICON_MARKER = "",
        ICON_PROMPT = "",
        ICON_SEPARATOR = "",
        EXPLORER = "eza --all --group --colour=always --icons=always --group-directories-first --classify --level --oneline",
        SEARCH_DIRECTORIES_AND_FILES_WITN_HIDEN = "fd -H --color always",
        SEARCH_DIRECTORIES_AND_FILES_WITH_OUT_HIDEN = "fd --color always",
        SEARCH_DIRECTORIES_WITN_HIDEN = "fd -H --color always --type d",
        SEARCH_DIRECTORIES_WITH_OUT_HIDEN = "fd --color always --type d",
        SEARCH_FILES_WITN_HIDEN = "fd -H --color always --type f",
        SEARCH_FILES_WITH_OUT_HIDEN = "fd --color always --type f",
        SEARCH_IN_FILES_WITH_HIDDEN = "rg --no-heading -H --smart-case --line-number --column --hidden --follow"
            .. " --color=always",
        SEARCH_IN_FILES_WITH_OUT_HIDDEN = "rg --no-heading -H --smart-case --line-number --column --follow"
            .. " --color=always",
        COLORS = "fg:#448589,bg:#1B2125,hl:#C94233,fg+:#448589,bg+:#1B2125,hl+:#C94233,pointer:#C94233,info:#E58C26,spinner:#E58C26,header:#C94233,prompt:#7F9858,marker:#C94233",
        KEY_QUIT = "ctrl-q",
        KEY_CLEAR_QUERY = "esc",
        KEY_PREVIEW_DOWN = "ctrl-d",
        KEY_PREVIEW_UP = "ctrl-u",
        KEY_PREVIEW_HALF_PAGE_DOWN = "ctrl-f",
        KEY_PREVIEW_HALF_PAGE_UP = "ctrl-b",
        KEY_TOGGLE_PREVIEW = "alt-p",
        KEY_SAVE_CURRENT_PATH = "alt-,",
        KEY_DELETE_CURRENT_PATH = "alt-.",
        KEY_MENU = "alt-m",
        KEY_EXPLORER = "alt-e",
        KEY_EXPLORER_LONG_PATH = "alt-l",
        KEY_SEARCH_DIRECTORIES_AND_FILES = "alt-a",
        KEY_SEARCH_DIRECTORIES = "alt-d",
        KEY_SEARCH_FILES = "alt-f",
        KEY_SEARCH_IN_FILES = "alt-w",
        KEY_TOGGLE_HIDDEN_FILES = "alt-h",
        KEY_TOGGLE_HELP = "alt-/",
        KEY_OPEN_TERMINAL = "alt-t",
        KEY_COPY = "alt-y",
        KEY_CUT = "alt-o",
        KEY_DELETE = "alt-r",
        KEY_PASTE = "alt-p",
        KEY_EXECUTE = "!",
        KEY_APPLY = "alt-i",
    },
}

local M = {}

M.init = function()
    local lvim_shell = require("lvim-shell")
    local exe_file = config.env.LVIM_FM_BIN_PATH .. "/bin/FileManager"
    if config.ui.default == "split" then
        lvim_shell.split(exe_file, "<CR>", config)
    else
        lvim_shell.float(exe_file, "<CR>", config)
    end
end

M.commands = function()
    vim.api.nvim_create_user_command("LvimFileManager", function()
        M.init()
    end, {})
end

M.setup = function(user_config)
    if user_config ~= nil then
        config = vim.tbl_deep_extend("force", config, user_config)
    end
    M.commands()
end

return M
