erl_script_cluster
==================

Use Erlang OTP framework  to manage execution of external scripts. 

Description
------------
Erlang  OTP framework takes care of a lots of high availability and some level of self healing through process supervision tree. the Framework has been battle-hardened over years. Read more here (http://learnyousomeerlang.com/what-is-otp). 
Erlang also can interface with non Erlang program through nif, port etc. For scripts like python/ruby there is erlPort (http://erlport.org/) that eases most of the work. For more information also checks out http://www.erlang.org/doc/reference_manual/ports.html

All this implies we can have python/ruby script as dump worker scripts, receive commands from erl_script_cluster and let erlang OTP to handle recovery automatically (Restart-Based High Availability). It works best when your script is stateless. If it is stateful, you script need to make sure what consistute a good state on each execution.

Note that this approach assumes that there are lots of bugs can be solved under Restart-Based High Availability and a good portion of the bugs are Heisenbugs. (http://roc.cs.berkeley.edu/papers/HA_measurability.pdf). If there are real bugs in your script, this probably will not help; but it does let user to configure when it is time to just bail out retrying and let it crash for futher investigation

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
* Rebar (https://github.com/rebar/rebar) Note that different version of Rebar may breaks rebar.config. I have checked in the one used in the project.
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
