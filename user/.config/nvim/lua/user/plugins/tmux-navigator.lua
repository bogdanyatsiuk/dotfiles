-- Better navigation with tmux
return {
    "christoomey/vim-tmux-navigator",
    -- event = "VeryLazy",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        -- "TmuxNavigatePrevious",
    },
    keys = {
        { "<c-h>", "<cmd><C-U>tmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>tmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>tmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>tmuxNavigateRight<cr>" },
        -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
}
