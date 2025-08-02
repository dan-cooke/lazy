return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/notes.org",
      org_todo_keywords = { "TODO(t)", "|", "DONE(d)" },
      org_agenda_custom_commands = {
        -- "c" is the shortcut that will be used in the prompt
        c = {
          description = "Combined view", -- Description shown in the prompt for the shortcut
          types = {
            {
              type = "tags_todo", -- Type can be agenda | tags | tags_todo
              match = '+PRIORITY="A"', --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = "High priority todos",
              org_agenda_todo_ignore_deadlines = "far", -- Ignore all deadlines that are too far in future (over org_deadline_warning_days). Possible values: all | near | far | past | future
            },
            {
              type = "agenda",
              org_agenda_overriding_header = "My daily agenda",
              org_agenda_span = "day", -- can be any value as org_agenda_span
            },
            {
              type = "tags",
              match = "WORK", --Same as providing a "Match:" for tags view <leader>oa + m, See: https://orgmode.org/manual/Matching-tags-and-properties.html
              org_agenda_overriding_header = "My work todos",
              org_agenda_todo_ignore_scheduled = "all", -- Ignore all headlines that are scheduled. Possible values: past | future | all
            },
            {
              type = "agenda",
              org_agenda_overriding_header = "Whole week overview",
              org_agenda_span = "week", -- 'week' is default, so it's not necessary here, just an example
              org_agenda_start_on_weekday = 1, -- Start on Monday
              org_agenda_remove_tags = true, -- Do not show tags only for this view
            },
          },
        },
        p = {
          description = "Personal agenda",
          types = {
            {
              type = "tags_todo",
              org_agenda_overriding_header = "My personal todos",
              org_agenda_category_filter_preset = "todos", -- Show only headlines from `todos` category. Same value providad as when pressing `/` in the Agenda view
              org_agenda_sorting_strategy = { "todo-state-up", "priority-down" }, -- See all options available on org_agenda_sorting_strategy
            },
            {
              type = "agenda",
              org_agenda_overriding_header = "Personal projects agenda",
              org_agenda_files = { "~/my-projects/**/*" }, -- Can define files outside of the default org_agenda_files
            },
            {
              type = "tags",
              org_agenda_overriding_header = "Personal projects notes",
              org_agenda_files = { "~/my-projects/**/*" },
              org_agenda_tag_filter_preset = "NOTES-REFACTOR", -- Show only headlines with NOTES tag that does not have a REFACTOR tag. Same value providad as when pressing `/` in the Agenda view
            },
          },
        },
      },
    })

    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",
      ignore_install = { "org" },
    })
  end,
}
