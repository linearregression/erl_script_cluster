erl_script_cluster
==================

Use Erlang OTP framework  to manage execution of external scripts. 

Description
------------



Installation
-------------
erl_script_cluster is a erlang OTP application release, you just need to unzip the package. 
The erlang runtime and the associated dependencies library (not including external libraries) 
are included in the release package.

Then you need to tell erl_script_cluster where to find your script to execute.

TODO more details

Development
-----------
Dependencies
* Development environment is Ubuntu 13+
* Erlang OTP 17 or above (http://www.erlang.org/download.html)
* Rebar (https://github.com/basho/rebar) 
* make tool (should be part of ubuntu build-essentials package)

There are several main branches.
dev, qa, staging, master
Deveopment should be in dev branch. Any stable release should be merged back to masterand tagged.

Contribution
------------
If you are going to submitt pull request, please make sure that:
- it compiles clean from scratch 
- include tests
- tests pass
Please feel free to fork and/or submitt pull request.


Contributor List
----------------
TBD

A Simple Example
-----------------
TBD
