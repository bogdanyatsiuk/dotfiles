local M = {}

function M.dismiss_notice_and_higlights()
    local status_ok, noice = pcall(require, "noice")
    if status_ok then
        noice.cmd("dismiss")
    end

    vim.cmd("noh")
end

function M.open_github_url()
    local str = vim.fn.expand("<cWORD>")
    local url = str:match("^[%(%{%[<'\"`|.,]*(.-)[%)%}%]>'\"`|.,]*$")

    if url == nil or url == '' then
        return
    end

    local protocol = "https://"
    local github_url = "github.com/"

    if url:find(protocol) ~= nil then
        vim.ui.open(url)
    elseif url:find(github_url) ~= nil then
        vim.ui.open(protocol .. url)
    else
        vim.ui.open(protocol .. github_url .. url)
    end
end

return M
