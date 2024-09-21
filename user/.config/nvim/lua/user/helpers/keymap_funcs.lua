local M = {}

local function keymap(mode, lhs, rhs, opts)
    local map_opts = { silent = true }
    if opts then
        for key, value in pairs(opts) do
            map_opts[key] = value
        end
    end

    vim.keymap.set(mode, lhs, rhs, map_opts)
end

function M.imap(lhs, rhs, opts)
    keymap("i", lhs, rhs, opts)
end

function M.nmap(lhs, rhs, opts)
    keymap("n", lhs, rhs, opts)
end

function M.vmap(lhs, rhs, opts)
    keymap("v", lhs, rhs, opts)
end

function M.xmap(lhs, rhs, opts)
    keymap("x", lhs, rhs, opts)
end

function M.amap(lhs, rhs, opts)
    keymap("", lhs, rhs, opts)
end

function M.mmap(mode, lhs, rhs, opts)
    keymap(mode, lhs, rhs, opts)
end

return M
