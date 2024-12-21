local M = {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
}

function M.config()
    local autocmd = vim.api.nvim_create_autocmd

    -- vim.g.vimtex_view_method = "skim"
    vim.g.tex_flavor = "latex"
    vim.g.tex_conceal = "abdmgs"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_compiler_latexmk_engines = { ["_"] = "-lualatex" }
    vim.g.vimtex_view_enabled = 0
    vim.g.vimtex_view_automatic = 0
    vim.g.vimtex_indent_on_ampersands = 0

    vim.api.nvim_create_augroup("CustomTex", {})

    -- vimtex flags
    vim.g.tex_compiles_successfully = false
    vim.g.term_pdf_vierer_open = false

    autocmd("User", {
        group = "CustomTex",
        pattern = "VimtexEventCompileSuccess",
        callback = function()
            vim.g.tex_compiles_successfully = true

            -- a hacky way to reload the pdf in the terminal
            -- when it has changed
            if vim.g.term_pdf_vierer_open and vim.g.tex_compiles_successfully then
                local command = "termpdf.py " .. vim.api.nvim_call_function("expand", { "%:r" }) .. ".pdf" .. "'\r'"
                local kitty = "kitty @ send-text --match title:termpdf "
                vim.fn.system(kitty .. command)
            end
        end,
    })

    autocmd("User", {
        group = "CustomTex",
        pattern = "VimtexEventCompileFailed",
        callback = function()
            vim.g.tex_compiles_successfully = false
        end,
    })

    autocmd("User", {
        group = "CustomTex",
        pattern = "VimtexEventQuit",
        callback = function()
            vim.fn.system "kitty @ close-window --match title:termpdf"
        end,
    })

    function VimtexPDFToggle()
        if vim.g.term_pdf_vierer_open then
            vim.fn.system "kitty @ close-window --match title:termpdf"
            vim.g.term_pdf_vierer_open = false
        elseif vim.g.tex_compiles_successfully then
            vim.fn.system "kitty @ launch --location=vsplit --cwd=current --title=termpdf"

            local command = "termpdf.py " .. vim.api.nvim_call_function("expand", { "%:r" }) .. ".pdf" .. "'\r'"
            local kitty = "kitty @ send-text --match title:termpdf "
            vim.fn.system(kitty .. command)
            vim.g.term_pdf_vierer_open = true
        end
    end
    local keyset = vim.keymap.set
    keyset("n", "<leader>g", ":lua VimtexPDFToggle()<cr>")
end

return M
