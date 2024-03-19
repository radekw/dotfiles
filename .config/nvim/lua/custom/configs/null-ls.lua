local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {

   b.formatting.prettier.with { filetypes = { "yaml", "json" } },

   -- Lua
   b.formatting.stylua,

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- python
   b.formatting.black,

   -- terraform
   b.formatting.terraform_fmt,
   b.diagnostics.terraform_validate,
}

null_ls.setup {
   debug = true,
   sources = sources,
}