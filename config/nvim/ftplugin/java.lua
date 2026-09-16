local jdtls = require('jdtls')

local mason_jdtls = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local launcher = vim.fn.glob(mason_jdtls .. '/plugins/org.eclipse.equinox.launcher_*.jar')

local lombok_path = vim.fn.glob(mason_jdtls .. '/lombok.jar')

-- Find the reactor root: walk up from the current file to the TOPMOST pom.xml
-- so multi-module Maven projects are imported as a whole (inter-module
-- dependency resolution requires the aggregator/parent pom as the root).
local function find_maven_root(source)
    source = source or vim.api.nvim_buf_get_name(0)
    local dir = vim.fn.fnamemodify(source, ':p:h')
    local maven_root = nil
    while dir and dir ~= '/' do
        if vim.uv.fs_stat(dir .. '/pom.xml') then
            maven_root = dir -- keep going: remember the highest pom.xml seen
        end
        local parent = vim.fn.fnamemodify(dir, ':h')
        if parent == dir then
            break
        end
        dir = parent
    end
    return maven_root
end

-- Prefer the Maven reactor root; fall back to the standard jdtls markers
-- (Gradle, git, wrappers) for non-Maven projects.
local root_dir = find_maven_root()
    or jdtls.setup.find_root({ 'gradlew', 'build.gradle', 'mvnw', '.git' })
    or vim.fn.getcwd()

-- Per-project workspace cache keyed off the RESOLVED root so every module in a
-- multi-module build shares one consistent workspace.
local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspaces/' .. project_name

local config = {
    cmd = {
        vim.env.JAVA_HOME .. '/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx2g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. lombok_path,
        '-jar', launcher,
        '-configuration', mason_jdtls .. '/config_mac',
        '-data', workspace_dir,
    },
    root_dir = root_dir,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    { name = 'JavaSE-21', path = vim.env.JAVA_HOME, default = true },
                }
            }
        }
    },
    on_attach = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
}

jdtls.start_or_attach(config)
