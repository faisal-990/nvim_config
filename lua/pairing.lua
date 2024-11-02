-- Function to handle brackets
local function insert_bracket(bracket)
    local pairs = {
        ['{'] = '{}',
        ['['] = '[]',
        ['('] = '()'
    }
    return pairs[bracket] .. '<Left>'
end

-- Function to handle quotes
local function insert_quote(quote)
    -- Get the current line and cursor position
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    
    -- Check if we're already inside a quote
    if col > 0 and line:sub(col, col) == quote then
        return '<Right>'  -- Skip over existing quote
    end
    
    -- Insert pair of quotes and move cursor between them
    if quote == '"' then
        return '""<Left>'
    else
        return "''<Left>"
    end
end

-- Function to handle Enter inside brackets
local function handle_enter()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    
    -- Check if cursor is between matching brackets
    local before = line:sub(col, col)
    local after = line:sub(col + 1, col + 1)
    local pairs = {
        ['{'] = '}',
        ['['] = ']',
        ['('] = ')'
    }
    
    if pairs[before] == after then
        return '<CR><CR><Up><Tab>'
    end
    
    return '<CR>'
end

-- Set up bracket mappings
vim.keymap.set('i', '{', function() return insert_bracket('{') end, { expr = true, noremap = true })
vim.keymap.set('i', '[', function() return insert_bracket('[') end, { expr = true, noremap = true })
vim.keymap.set('i', '(', function() return insert_bracket('(') end, { expr = true, noremap = true })

-- Set up quote mappings
vim.keymap.set('i', '"', function() return insert_quote('"') end, { expr = true, noremap = true })
vim.keymap.set('i', "'", function() return insert_quote("'") end, { expr = true, noremap = true })

-- Set up the Enter key mapping
vim.keymap.set('i', '<CR>', function() return handle_enter() end, { expr = true, noremap = true })
