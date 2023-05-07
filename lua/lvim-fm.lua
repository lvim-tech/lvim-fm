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
            x = 0.5,
            y = 0.5,
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
        close = "<Esc>",
        qf = "<C-q>",
    },
    env = {
        LVIM_FM_PATH = os.getenv("HOME") .. "/.config/lvim-fm",
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
        EXPLORER = "exa --group --icons --classify --colour=always --level 1",
        SEARCH_DIRECTORIES_AND_FILES_WITN_HIDEN = "fd -H --color always",
        SEARCH_DIRECTORIES_AND_FILES_WITH_OUT_HIDEN = "fd --color always",
        SEARCH_DIRECTORIES_WITN_HIDEN = "fd -H --color always --type d",
        SEARCH_DIRECTORIES_WITH_OUT_HIDEN = "fd --color always --type d",
        SEARCH_FILES_WITN_HIDEN = "fd -H --color always --type f",
        SEARCH_FILES_WITH_OUT_HIDEN = "fd --color always --type f",
        SEARCH_IN_FILES_WITH_HIDDEN = "rg --no-heading -H --line-number --column --hidden --follow --color=always",
        SEARCH_IN_FILES_WITH_OUT_HIDDEN = "rg --no-heading -H --line-number --column --follow --color=always",
        KEY_QUIT = "esc",
        KEY_CLEAR_QUERY = "ctrl-c",
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
    },
}

local M = {}

M.init = function()
    local lvim_shell = require("lvim-shell")
    local exe_file = vim.fn.fnamemodify(debug.getinfo(1, "S").source:gsub("^@", ""), ":h:h") .. "/bin/FileManager"
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
