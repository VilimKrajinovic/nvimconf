local lsp_zero = require('lsp-zero')

require'lspconfig'.clojure_lsp.setup{}

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    -- LS
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
end)

local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
vim.api.nvim_create_autocmd('BufWritePost', {
    group = lsp_fmt_group,
    callback = function(ev)
        local efm = vim.lsp.get_active_clients({ name = 'efm', bufnr = ev.buf })

        if vim.tbl_isempty(efm) then
            return
        end

        vim.lsp.buf.format({ name = 'efm' })
    end,
})


require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'clojure_lsp', 'gopls', 'rust_analyzer'},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
        clojure_lsp = function ()
            require'lspconfig'.clojure_lsp.setup({
                cmd = {"clojure-lsp"},
                filetypes = {"clojure", "edn"},
                root_dir = require'lspconfig/util'.root_pattern("deps.edn", "project.clj", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"),
                settings =  {

                }
            })
        end,
        gopls = function()
            require'lspconfig'.gopls.setup({
                cmd = {"gopls"},
                filetypes = {"go", "gomod", "gowork", "gotmpl"},
                root_dir = require'lspconfig/util'.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {unusedparams = true}
                    }
                }
            })
        end
    }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.emmet_ls.setup(
{
    capabilities = capabilities,
    -- on_attach = on_attach,
    filetypes = {"heex", "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
        html = {
            options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
            },
        },
    }
}
)

require('efmls-configs.defaults').languages()
require('efmls-configs.formatters.gofmt')
require'lspconfig'.efm.setup({
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/", "go.mod"},
        languages = {
            lua = {
                {formatCommand = "stylua", formatStdin = true}
            },
            go = {
                {formatCommand = "gofmt"}
            }
        }
    },
    filetypes = {'go', 'lua', 'clojure', 'clj', 'edn'}
})

--require'lspconfig'.gdscript.setup{ flags = {debounce_text_changes = 150,}}


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 1},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<S-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<S-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<S-y>'] = cmp.mapping.confirm({ select = true }),
        ['<S-Space>'] = cmp.mapping.complete(),
    }),
})

