# POC-workspace-tools
Do a POC to patch lower versions of workspace-tools

## Background information
https://nvd.nist.gov/vuln/detail/CVE-2022-25865

CVSS: 9.8 Critical

Vulnerable Environment:

OS: Ubuntu 18.04.6 LTS

npm: 8.11.0

node.js: v16.14.2

workspace-tools@0.16.2

Patch Recommendation: Upgrade to v0.18.4

## The Dilemma and POC !!!
Developers using workspace-tools@0.16.2 might not want to upgrade to workspace-tools@0.18.4 as it might break their code.

https://github.com/microsoft/workspace-tools/commit/9bc7e65ce497f87e1f363fd47b8f802f3d3cd978 shows the code fix to v.0.18.4

Use docker to create the vulnerable environment and use it for both POC and testing.

POC: To patch lower versions of workspace-tools without upgrading to v0.18.4

## Yet to be done
If patch is successful, build the Javascript and upload to code artifact. Developers can download and install the patched version of workspace-tools instead.







