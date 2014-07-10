# -*- mode: Makefile; fill-column: 80; comment-column: 75; -*-

PROJECT = scripty_cluster
#
ERL = $(shell which erl)

ERLFLAGS= -pa $(CURDIR)/.eunit -pa $(CURDIR)/ebin -pa $(CURDIR)/*/ebin -pa $(CURDIR)/deps/*/deps/ebin

ERLC_OPTS= +debug_info +fail_on_warning +'{parse_transform, lager_transform}'

EDOC_OPTS= '{private, true}' '{hidden, true}' '{todo, true}'

EUNIT_OPTS=

CT_SUITES= foo

CT_OPTS= -cover $(CURDIR)/test/cover.spec

REBAR= $(shell pwd)/rebar

DEPSOLVER_PLT= .depsolver_plt

PATH := $(shell pwd)/build:$(shell pwd):$(PATH)

.PHONY: all release clean-release

all: deps compile 
 
release: clean-release deps compile
	@$(REBAR) generate

release-only: compile
	@$(REBAR) generate 

clean-release: clean
	rm -rf rel/$(PROJECT)

ct:
	@$(REBAR) skip_deps=true ct

compile: 
	@$(REBAR) compile

app:
	@$(REBAR) compile skip_deps=true

deps: 
	@$(REBAR) get-deps

pydeps: deps
	@$(REBAR) get-deps && rsync -ah --progress $(CURDIR)/deps/sqor_algo $(CURDIR)/priv/python

# tests:
# 	@$(REBAR) skip_deps=true eunit ct -vvv
#
# ct:
# 	@$(REBAR) skip_deps=true ct
#
eunit:
	@$(REBAR) skip_deps=true eunit

docs:
	@$(REBAR) skip_deps=true doc

clean:
	@$(REBAR) clean

$(DEPSOLVER_PLT):
	dialyzer --output_plt $(DEPSOLVER_PLT) --build_plt -I ./include \
	--apps erts kernel stdlib crypto ssl public_key compiler syntax_tools inets \
	-r deps/*/ebin

dialyzer: $(DEPSOLVER_PLT)
	dialyzer  --plt $(DEPSOLVER_PLT) -r ./ebin ./deps/*/ebin -I include -o dialyzer.txt
#
# typer: $(DEPSOLVER_PLT)
# 	typer --plt $(DEPSOLVER_PLT) -r ./src -I include
#
