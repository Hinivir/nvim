let
  javaTestPath = "/nix/store/j3nvmhvj2pmnykw5pbm51dn0bz4cv6j3-vscode-extension-vscjava-vscode-java-test-0.38.2023032402/share/vscode/extensions/vscjava.vscode-java-test/server/com.microsoft.java.test.plugin-0.38.2.jar
 ";
in
{
  plugins.nvim-jdtls = {
    enable = true;
    cmd = [
      "/nix/store/20h2hjjm94gbskqhbwikbgxbblv1xpf2-jdt-language-server-1.31.0/bin/jdtls"
    ];
    # configuration = "/path/to/configuration";
    settings = {
      java = {
        signatureHelp = true;
        completion = true;
      };
    };
    initOptions = {
      bundles = [
        "/nix/store/b9ib40q36wxjl4xs5lng263lflz1fsi7-vscode-extension-vscjava-vscode-java-debug-0.49.2023032407/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-0.44.0.jar"
        "${javaTestPath}"
      ];
    };
  };
}
