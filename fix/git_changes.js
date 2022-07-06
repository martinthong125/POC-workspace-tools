function fetchRemote(remote, cwd) {
    const results = git(["fetch", "--", remote], { cwd }); // change in this line, line 107 in git.js
    if (!results.success) {
        throw gitError(`Cannot fetch remote: ${remote}`);
    }
}
exports.fetchRemote = fetchRemote;
function fetchRemoteBranch(remote, remoteBranch, cwd) {
    const results = git(["fetch", "--", remote, remoteBranch], { cwd });
    if (!results.success) {
        throw gitError(`Cannot fetch remote: ${remote} ${remoteBranch}`);
    }
}
exports.fetchRemoteBranch = fetchRemoteBranch;