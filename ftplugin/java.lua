-- JDTLS (Java LSP) configuration
local home = vim.env.HOME -- Get the home directory

local jdtls = require "jdtls"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/jdtls-workspace/" .. project_name

local system_os = ""

-- Determine OS
if vim.fn.has "mac" == 1 then
  system_os = "mac"
elseif vim.fn.has "unix" == 1 then
  system_os = "linux"
elseif vim.fn.has "win32" == 1 or vim.fn.has "win64" == 1 then
  system_os = "win"
else
  print "OS not found, defaulting to 'linux'"
  system_os = "linux"
end

-- Needed for debugging
local bundles = {
  vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

-- Needed for running/debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- Eclipse jdtls location
    "-jar",
    home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
    "-data",
    workspace_dir,
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "pom.xml", "build.gradle" },

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
      -- TODO Replace this with the absolute path to your main java version (JDK 17 or higher)
      home = "/usr/lib/jvm/java-21-amazon-corretto/",
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        -- TODO Update this by adding any runtimes that you need to support your Java projects and removing any that you don't have installed
        -- The runtime name parameters need to match specific Java execution environments.  See https://github.com/tamago324/nlsp-settings.nvim/blob/2a52e793d4f293c0e1d61ee5794e3ff62bfbbb5d/schemas/_generated/jdtls.json#L317-L334
        runtimes = {
          -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
          -- And search for `interface RuntimeOption`
          -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
          {
            name = "JavaSE-1.8",
            path = "/usr/lib/jvm/java-8-amazon-corretto/",
          },
          {
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-amazon-corretto/",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-amazon-corretto/",
          },
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-amazon-corretto/",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      signatureHelp = { enabled = true },
      format = {
        enabled = true,
        -- Formatting works by default, but you can refer to a specific file/URL if you choose
        -- settings = {
        --   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
        --   profile = "GoogleStyle",
        -- },
      },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        useBlocks = true,
      },
    },
  },
  -- Needed for auto-completion with method signatures and placeholders
  capabilities = require("blink.cmp").get_lsp_capabilities(nil, true),
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    -- References the bundles defined above to support Debugging and Unit Testing
    bundles = bundles,
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
}

-- Needed for debugging
config["on_attach"] = function(client, bufnr)
  jdtls.setup_dap { hotcodereplace = "auto" }
  require("jdtls.dap").setup_dap_main_class_configs()

  -- Allow yourself to run JdtCompile as a Vim command
  vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
  -- Allow yourself/register to run JdtUpdateConfig as a Vim command
  vim.cmd "command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()"
  -- Allow yourself/register to run JdtBytecode as a Vim command
  vim.cmd "command! -buffer JdtBytecode lua require('jdtls').javap()"
  -- Allow yourself/register to run JdtShell as a Vim command
  vim.cmd "command! -buffer JdtJshell lua require('jdtls').jshell()"

  local icon = require "utils.icons"

  require("which-key").add {
    {
      "<leader>j",
      group = "Java",
      icon = {
        icon = icon.lang.Java,
        color = "red",
      },
    },
    {
      "<leader>jC",
      function()
        jdtls.extract_constant()
      end,
      desc = "Extract Constant",
      mode = "n",
    },
    {
      "<leader>jC",
      function()
        jdtls.extract_constant(true)
      end,
      desc = "Extract Constant",
      mode = "v",
    },
    {
      "<leader>jn",
      function()
        jdtls.test_nearest_method()
      end,
      desc = "Test Nearest Class",
      mode = "n",
    },
    {
      "<leader>jn",
      function()
        jdtls.test_nearest_method(true)
      end,
      desc = "Test Nearest Class",
      mode = "v",
    },
    {
      "<leader>jo",
      function()
        jdtls.organize_imports()
      end,
      desc = "Organize Imports",
    },
    {
      "<leader>jt",
      function()
        jdtls.test_class()
      end,
      desc = "Test Class",
    },
    {
      "<leader>ju",
      "<cmd>JdtUpdateConfig<cr>",
      desc = "Update Config",
    },
    {
      "<leader>jU",
      "<cmd>JdtUpdateDebugConfig<cr>",
      desc = "Update Debug Config",
    },
    {
      "<leader>jv",
      function()
        jdtls.extract_variable()
      end,
      desc = "Extract Variable",
      mode = "n",
    },
    {
      "<leader>jv",
      function()
        jdtls.extract_variable(true)
      end,
      desc = "Extract Variable",
      mode = "v",
    },
  }
end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)
