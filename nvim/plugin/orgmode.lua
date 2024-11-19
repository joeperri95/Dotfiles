-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Records/Org/*'},
  org_startup_folded = 'overview',
  org_default_notes_file = '~/Records/Org/Refile.org',
  org_adapt_indentation = false,
  org_startup_indented = false,
  org_capture_templates = {
    n = {
        description = "note",
        template = "*** %T %? \n",
        target = "~/Records/Org/Notes.org",
        headline = "General"
    }
  }
})
