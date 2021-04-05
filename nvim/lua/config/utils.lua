local cmd = vim.cmd
local o_s = vim.o
local map_key = vim.api.nvim_set_keymap
local M = {}

function M.opt(o, v, scopes)
    scopes = scopes or {o_s}
    for _, s in ipairs(scopes) do
        s[o] = v
    end
end

function M.map(modes, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    if type(modes) == "string" then
        modes = {modes}
    end
    for _, mode in ipairs(modes) do
        map_key(mode, lhs, rhs, opts)
    end
end

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

return M
