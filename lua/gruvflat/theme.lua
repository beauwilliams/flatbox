local M = {}

-- local _debug = function(content)
--   local f = io.open("/home/acc/.nvim.debug.log", "a")
--   f:write(vim.inspect(content) .. "\n")
--   f.close()
-- end

function M.setup(config)
  config = config or require("flatbox.config")
  local colors = require("flatbox.colors")
  local c = colors.config(config)

  local theme = {}
  theme.defer = {}
  theme.base = {
    NormalFloat = { fg = c.foreground, bg = c.background_dark },
    Normal = { fg = c.foreground, bg = c.background },
    Comment = { fg = c.comment, style = config.comment_style },
    Constant = { fg = c.soft_yellow },
    String = { fg = c.green },
    Character = { fg = c.soft_yellow },
    Number = { fg = c.bright_yellow },
    Boolean = { fg = c.orange },
    Float = { fg = c.bright_yellow },
    Identifier = { fg = c.soft_yellow, style = config.variable_style },
    Function = { fg = c.soft_yellow },
    Statement = { fg = c.red },
    Conditional = { fg = c.foreground },
    Repeat = { fg = c.magenta },
    Label = { fg = c.medium_gray },
    Operator = { fg = c.foreground },
    Keyword = { fg = c.red, style = config.keyword_style },
    Exception = { fg = c.magenta },
    PreProc = { fg = c.soft_yellow },
    Include = { fg = c.red },
    Define = { fg = c.magenta },
    Title = { fg = c.foreground },
    Macro = { fg = c.magenta },
    PreCondit = { fg = c.magenta },
    Type = { fg = c.soft_yellow },
    StorageClass = { fg = c.blue_gray },
    Structure = { fg = c.soft_yellow },
    Typedef = { fg = c.soft_yellow },
    Special = { fg = c.medium_gray, style = "italic" },
    SpecialComment = { fg = c.comment },
    MoreMsg = { fg = c.foreground },
    Error = { fg = c.red, style = "bold" },
    Todo = { fg = c.magenta, style = "bold" },
    debugPc = { bg = c.error_red },
    Conceal = { fg = c.comment },
    Directory = { fg = c.light_gray },

    TabLine = { bg = c.dark, fg = c.foreground }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.background }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.dark, bg = c.foreground }, -- tab pages line, active tab page label

    DiffAdd = { bg = c.diff.add },
    DiffChange = { bg = c.diff.change },
    DiffDelete = { bg = c.diff.delete },
    DiffText = { bg = c.diff.text },

    ErrorMsg = { fg = c.red },
    VertSplit = { fg = c.soft_gray },
    Folded = { fg = c.comment },
    -- IncSearch = { fg = c.soft_yellow, bg = c.soft_yellow },
    CursorLineNr = { fg = c.soft_yellow },
    LineNr = { fg = c.darker_gray },
    -- LineNrAbove = { fg = c.gray },
    -- LineNrBelow = { fg = c.gray },
    MatchParen = { bg = c.blue_gray, style = "underline" },
    NonText = { fg = c.comment },
    Pmenu = { fg = c.foreground, bg = c.background_light },
    PmenuSel = { fg = c.background, bg = c.blue_gray },
    Question = { fg = c.magenta },
    QuickFixLine = { fg = c.background, bg = c.soft_yellow },
    Search = { fg = c.background, bg = c.soft_yellow },
    SpecialKey = { fg = c.comment },
    SpellBad = { fg = c.red, style = "underline" },
    SpellCap = { fg = c.bright_yellow },
    SpellLocal = { fg = c.bright_yellow },
    SpellRare = { fg = c.bright_yellow },
    StatusLine = { fg = c.foreground, bg = c.medium_gray },
    StatusLineNC = { fg = c.comment },
    StatusLineTerm = { fg = c.foreground, bg = c.medium_gray },
    StatusLineTermNC = { fg = c.medium_gray },
    Terminal = { fg = c.foreground, bg = c.background },
    VisualNOS = { fg = c.medium_gray },
    WarningMsg = { fg = c.soft_yellow },
    WildMenu = { fg = c.background, bg = c.blue_gray },
    EndOfBuffer = { fg = c.background },

    -- Tree Sitter
    TSBoolean = { fg = c.orange },
    TSDefine = { fg = c.red },
    TSComment = { fg = c.comment, style = "italic" },
    TSError = { fg = c.red },
    TSPunctDelimiter = { fg = c.orange },
    TSPunctBracket = { fg = c.foreground },
    TSPunctSpecial = { fg = c.foreground },
    TSConstant = { fg = c.pink, style = "bold" },
    TSConstBuiltin = { fg = c.pink },
    TSString = { fg = c.green, style = "nocombine" },
    TSCharacter = { fg = c.green },
    TSNumber = { fg = c.magenta },
    TSNamespace = { fg = c.light_blue },
    TSFuncBuiltin = { fg = c.soft_yellow },
    TSFunction = { fg = c.green, style = config.function_style },
    TSFuncMacro = { fg = c.soft_yellow },
    TSParameter = { fg = c.blue_gray, style = "nocombine" },
    TSParameterReference = { fg = c.medium_gray },
    TSMethod = { fg = c.green, style = config.function_style },
    TSField = { fg = c.light_blue },
    TSProperty = { fg = c.light_blue },
    TSConstructor = { fg = c.aqua, style = "nocombine" },
    TSConditional = { fg = c.red },
    TSRepeat = { fg = c.red },
    TSLabel = { fg = c.blue_gray },
    TSKeyword = { fg = c.red, style = config.keyword_style },
    -- TSKeywordReturn = { fg = c.red, style = config.keyword_style },
    -- tes
    TSKeywordFunction = { fg = c.red, style = config.keyword_style },
    TSKeywordOperator = { fg = c.red },
    TSOperator = { fg = c.orange },
    luaTSOperator = { fg = c.orange },
    TSException = { fg = c.red },
    TSType = { fg = c.bright_yellow },
    TSTypeBuiltin = { fg = c.bright_yellow },
    TSStructure = { fg = c.light_blue },
    TSVariable = { fg = c.light_blue, style = config.variable_style },
    TSVariableBuiltin = { fg = c.light_blue },
    TSText = { fg = c.soft_yellow },
    TSStrong = { fg = c.soft_yellow },
    TSEmphasis = { fg = c.soft_yellow },
    TSUnderline = { fg = c.soft_yellow },
    TSTitle = { fg = c.soft_yellow },
    TSLiteral = { fg = c.soft_yellow },
    TSURI = { fg = c.soft_yellow },
    TSTag = { fg = c.aqua },
    TSTagDelimiter = { fg = c.comment },

    -- per language TreeSitter
    pythonTSVariable = { fg = c.foreground, bg = c.NONE, style = "NONE" },
    pythonDecorator = { fg = c.orange, style = "bold" },
    rustTSVariable = { fg = c.foreground, bg = c.NONE, style = "NONE" },
    -- javascriptTSConditional = { fg = c.red },
    -- javascriptTSVariable = { fg = c.light_blue },

    htmlArg = { fg = c.soft_yellow },
    htmlBold = { fg = c.bright_yellow, style = "bold" },
    htmlEndTag = { fg = c.foreground },
    htmlH1 = { fg = c.foreground },
    htmlH2 = { fg = c.foreground },
    htmlH3 = { fg = c.foreground },
    htmlH4 = { fg = c.foreground },
    htmlH5 = { fg = c.foreground },
    htmlH6 = { fg = c.foreground },
    htmlItalic = { fg = c.magenta, style = "italic" },
    htmlLink = { fg = c.foreground, style = "underline" },
    htmlSpecialChar = { fg = c.soft_yellow },
    htmlSpecialTagName = { fg = c.blue_gray },
    htmlTag = { fg = c.medium_gray },
    htmlTagN = { fg = c.orange },
    htmlTagName = { fg = c.orange },
    htmlTitle = { fg = c.foreground },

    markdownBlockquote = { fg = c.comment },
    markdownBold = { fg = c.bright_yellow, style = "bold" },
    markdownCode = { fg = c.soft_yellow },
    markdownCodeBlock = { fg = c.comment },
    markdownCodeDelimiter = { fg = c.comment },
    markdownH1 = { fg = c.foreground },
    markdownH2 = { fg = c.foreground },
    markdownH3 = { fg = c.foreground },
    markdownH4 = { fg = c.foreground },
    markdownH5 = { fg = c.foreground },
    markdownH6 = { fg = c.foreground },
    markdownHeadingDelimiter = { fg = c.orange },
    markdownHeadingRule = { fg = c.comment },
    markdownId = { fg = c.magenta },
    markdownIdDeclaration = { fg = c.blue_gray },
    markdownIdDelimiter = { fg = c.magenta },
    markdownItalic = { fg = c.magenta, style = "italic" },
    markdownLinkDelimiter = { fg = c.magenta },
    markdownLinkText = { fg = c.blue_gray },
    markdownListMarker = { fg = c.orange },
    markdownOrderedListMarker = { fg = c.orange },
    markdownRule = { fg = c.comment },
    markdownUrl = { fg = c.green, style = "underline" },

    phpInclude = { fg = c.magenta },
    phpClass = { fg = c.soft_yellow },
    phpClasses = { fg = c.soft_yellow },
    phpFunction = { fg = c.blue_gray },
    phpType = { fg = c.magenta },
    phpKeyword = { fg = c.magenta },
    phpVarSelector = { fg = c.foreground },
    phpIdentifier = { fg = c.foreground },
    phpMethod = { fg = c.blue_gray },
    phpBoolean = { fg = c.blue_gray },
    phpParent = { fg = c.foreground },
    phpOperator = { fg = c.magenta },
    phpRegion = { fg = c.magenta },
    phpUseNamespaceSeparator = { fg = c.foreground },
    phpClassNamespaceSeparator = { fg = c.foreground },
    phpDocTags = { fg = c.magenta },
    phpDocParam = { fg = c.magenta },

    CocExplorerIndentLine = { fg = c.comment },
    CocExplorerBufferRoot = { fg = c.orange },
    CocExplorerFileRoot = { fg = c.orange },
    CocExplorerBufferFullPath = { fg = c.comment },
    CocExplorerFileFullPath = { fg = c.comment },
    CocExplorerBufferReadonly = { fg = c.magenta },
    CocExplorerBufferModified = { fg = c.magenta },
    CocExplorerBufferNameVisible = { fg = c.orange },
    CocExplorerFileReadonly = { fg = c.magenta },
    CocExplorerFileModified = { fg = c.magenta },
    CocExplorerFileHidden = { fg = c.comment },
    CocExplorerHelpLine = { fg = c.magenta },
    CocHighlightText = { bg = c.dark },

    EasyMotionTarget = { fg = c.red, style = "bold" },
    EasyMotionTarget2First = { fg = c.red, style = "bold" },
    EasyMotionTarget2Second = { fg = c.red, style = "bold" },

    StartifyNumber = { fg = c.light_blue },
    StartifySelect = { fg = c.blue_gray },
    StartifyBracket = { fg = c.gray },
    StartifySpecial = { fg = c.orange },
    StartifyVar = { fg = c.blue_gray },
    StartifyPath = { fg = c.gray },
    StartifyFile = { fg = c.foreground },
    StartifySlash = { fg = c.gray },
    StartifyHeader = { fg = c.orange },
    StartifySection = { fg = c.soft_yellow },
    StartifyFooter = { fg = c.soft_yellow },

    WhichKey = { fg = c.magenta },
    WhichKeySeperator = { fg = c.soft_yellow },
    WhichKeyGroup = { fg = c.orange },
    WhichKeyDesc = { fg = c.aqua },

    diffAdded = { fg = c.aqua },
    diffRemoved = { fg = c.red },
    diffFileId = { fg = c.magenta },
    diffFile = { fg = c.comment },
    diffNewFile = { fg = c.soft_yellow },
    diffOldFile = { fg = c.orange },


    SignifySignAdd = { fg = c.green },
    SignifySignChange = { fg = c.aqua },
    SignifySignDelete = { fg = c.red },
    GitGutterAdd = { fg = c.aqua },
    GitGutterChange = { fg = c.soft_yellow },
    GitGutterDelete = { fg = c.error_red },
    debugBreakpoint = { fg = c.error_red, style = "reverse" },

    VimwikiHeader1 = { fg = c.orange, style = "bold" },
    VimwikiHeader2 = { fg = c.green, style = "bold" },
    VimwikiHeader3 = { fg = c.medium_gray, style = "bold" },
    VimwikiHeader4 = { fg = c.aqua, style = "bold" },
    VimwikiHeader5 = { fg = c.red, style = "bold" },
    VimwikiHeader6 = { fg = c.pink, style = "bold" },
    VimwikiLink = { fg = c.aqua },
    VimwikiHeaderChar = { fg = c.medium_gray },
    VimwikiHR = { fg = c.soft_yellow },
    VimwikiList = { fg = c.orange },
    VimwikiTag = { fg = c.orange },
    VimwikiMarkers = { fg = c.medium_gray },

    ColorColumn = { bg = c.background_dark },
    SignColumn = { bg = c.background },
    CursorColumn = { bg = c.dark_gray },
    CursorLine = { bg = c.dark_gray },
    FoldColumn = { fg = c.NONE },
    PmenuSbar = { bg = c.comment },
    PmenuThumb = { bg = c.foreground },
    EasyMotionShade = { fg = c.NONE },
    Visual = { bg = c.orange, fg = c.background_dark },
    MultiCursor = { bg = c.background_light },
    Cursor = { bg = c.background_light, fg = c.NONE },

    -- mix
    GitSignsCurrentLineBlame = { fg = c.medium_gray },
    Underlined = { fg = c.error_red, style = "underline" },
    cppTSVariable = { fg = c.milk },

    -- Nvim Tree
    NvimTreeNormal = { fg = c.milk, bg = c.background_dark },
    NvimTreeNormalNC = { fg = c.milk, bg = c.background_dark },
    NvimTreeFolderIcon = { fg = c.soft_yellow },
    NvimTreeRootFolder = { fg = c.magenta },
    NvimTreeExecFile = { fg = c.light_blue, style = "NONE" },

    NvimTreeGitDirty = { fg = c.red },
    NvimTreeGitStaged = { fg = c.milk },
    NvimTreeGitMerge = { fg = c.soft_yellow },
    NvimTreeGitRenamed = { fg = c.soft_yellow },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },

    -- Hop
    HopNextKey = { fg = c.soft_yellow, bg = c.dark, style = "bold" },
    HopNextKey1 = { fg = c.soft_yellow, bg = c.dark, style = "bold" },
    HopNextKey2 = { fg = c.milk, bg = c.dark },

    --Scollview
    ScrollView = { fg = c.medium_gray, bg = c.medium_gray },

    -- indent blankline
    IndentBlanklineChar = { fg = c.medium_gray },
    IndentBlanklineSpaceChar = { fg = c.medium_gray },
    IndentBlanklineContextChar = { fg = c.medium_gray },

    FloatBorder = { fg = c.gray, bg = c.background },
    -- Cmp
    CmpDocumentation = { fg = c.foreground, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.medium_gray, bg = c.bg_float },

    CmpItemAbbr = { fg = c.foreground, bg = c.none },
    CmpItemAbbrDeprecated = { fg = c.milk, bg = c.none, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.light_blue, bg = c.none },
    CmpItemAbbrMatchFuzzy = { fg = c.light_blue, bg = c.none },

    CmpItemKindDefault = { fg = c.medium_gray, bg = c.none },
    CmpItemMenu = { fg = c.comment, bg = c.none },

    CmpItemKindKeyword = { fg = c.blue_gray, bg = c.none },

    CmpItemKindVariable = { fg = c.magenta, bg = c.none },
    CmpItemKindConstant = { fg = c.magenta, bg = c.none },
    CmpItemKindReference = { fg = c.magenta, bg = c.none },
    CmpItemKindValue = { fg = c.magenta, bg = c.none },

    CmpItemKindFunction = { fg = c.orange, bg = c.none },
    CmpItemKindMethod = { fg = c.orange, bg = c.none },
    CmpItemKindConstructor = { fg = c.orange, bg = c.none },

    CmpItemKindClass = { fg = c.pink, bg = c.none },
    CmpItemKindInterface = { fg = c.pink, bg = c.none },
    CmpItemKindStruct = { fg = c.pink, bg = c.none },
    CmpItemKindEvent = { fg = c.pink, bg = c.none },
    CmpItemKindEnum = { fg = c.pink, bg = c.none },
    CmpItemKindUnit = { fg = c.pink, bg = c.none },

    CmpItemKindModule = { fg = c.soft_yellow, bg = c.none },

    CmpItemKindProperty = { fg = c.aqua, bg = c.none },
    CmpItemKindField = { fg = c.aqua, bg = c.none },
    CmpItemKindTypeParameter = { fg = c.aqua, bg = c.none },
    CmpItemKindEnumMember = { fg = c.aqua, bg = c.none },
    CmpItemKindOperator = { fg = c.aqua, bg = c.none },
    CmpItemKindSnippet = { fg = c.gray, bg = c.none },

    -- Mutt-Mail:
    mailHeader = { fg = c.red },
    mailHeaderKey = { fg = c.red },
    mailHeaderEmail = { fg = c.magenta },
    mailSubject = { fg = c.aqua, style = "italic" },

    mailQuoted1 = { fg = c.aqua },
    mailQuoted2 = { fg = c.light_blue },
    mailQuoted3 = { fg = c.blue_gray },
    mailQuoted4 = { fg = c.pink },
    mailQuoted5 = { fg = c.green },
    mailQuoted6 = { fg = c.orange },

    mailQuotedExp1 = { fg = c.milk },
    mailQuotedExp2 = { fg = c.light_blue },
    mailQuotedExp3 = { fg = c.blue_gray },
    mailQuotedExp4 = { fg = c.pink },
    mailQuotedExp5 = { fg = c.green },
    mailQuotedExp6 = { fg = c.orange },

    mailSignature = { fg = c.comment },
    mailURL = { fg = c.orange, style = "underline" },
    mailEmail = { fg = c.soft_yellow },
  }

  if config.telescope_theme then
    theme.base = vim.tbl_extend("force", theme.base, {
      -- Telescope
      TelescopeBorder = { fg = c.gray, bg = c.background_dark },
      TelescopePromptCounter = { fg = c.milk, bg = c.background_dark },
      TelescopePromptBorder = { fg = c.gray, bg = c.background_dark },
      TelescopePromptNormal = { fg = c.milk, bg = c.background_dark },
      TelescopePromptPrefix = { fg = c.soft_yellow, bg = c.background_dark },

      TelescopeNormal = { fg = c.milk, bg = c.background_dark },
      TelescopeMatching = { fg = c.orange, c.background },

      TelescopePreviewTitle = { fg = c.background, bg = c.aqua },
      TelescopePromptTitle = { fg = c.background, bg = c.soft_yellow },
      TelescopeResultsTitle = { fg = c.background_dark, bg = c.milk },

      TelescopeSelection = { fg = c.orange, bg = c.background },
      TelescopeSelectionCaret = { fg = c.red, bg = c.background}
      -- TelescopeSelectionPrefix = { bg = c.dark_gray },
    })
  end

  theme.base = vim.tbl_extend("force", theme.base, config.highlights or {})
  return theme
end

return M
