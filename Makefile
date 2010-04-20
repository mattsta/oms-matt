.phony: all

all:
	./rebar compile
	./rebar generate

clean:
	./rebar clean
