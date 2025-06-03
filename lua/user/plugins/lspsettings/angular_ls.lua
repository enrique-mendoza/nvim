-- Configuration for Angular Language Server
return {
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern("angular.json", "project.json")(fname)
  end,
}
