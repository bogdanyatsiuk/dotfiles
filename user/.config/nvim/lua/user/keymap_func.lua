local function keymap(mode, lhs, rhs, opts)
    map_opts = { noremap = true, silent = true }
    if not opts == nil then
        for key, value in pairs(opts) do
            map_opts[key] = value
        end
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, map_opts)
end

function imap(lhs, rhs, opts)
    keymap("i", lhs, rhs, opts)
end

function nmap(lhs, rhs, opts)
    keymap("n", lhs, rhs, opts)
end

function vmap(lhs, rhs, opts)
    keymap("v", lhs, rhs, opts)
end

function xmap(lhs, rhs, opts)
    keymap("x", lhs, rhs, opts)
end

function amap(lhs, rhs, opts)
    keymap("", lhs, rhs, opts)
end
