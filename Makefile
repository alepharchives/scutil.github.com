REBAR=`which rebar || ./rebar`
all: deps compile
deps:
	@$(REBAR) get-deps
compile:
	@$(REBAR) compile
test:
	@$(REBAR) skip_deps=true eunit
docs:
	@$(REBAR) skip_deps=true doc
clean:
	@$(REBAR) clean
