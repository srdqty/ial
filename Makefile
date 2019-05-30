ROOTS=  bool bool-test bool-thms bool-thms2 bool-kleene bool-to-string \
	braun-tree braun-tree-test \
	bst \
	combinators \
	char \
	datatypes \
	error \
	everything \
	functions \
	eq \
	grammar \
	int \
	integer \
	io io-test io-test2 \
	kripke-semantics \
	level \
	lib \
	lib-safe \
	list list-test list-thms list-thms2 list-merge-sort list-merge-sort2 list-merge-sort-test list-simplifier list-zipWith \
	logic \
	maybe maybe-thms \
	nat nat-thms nat-division nat-division-wf nat-division-basic nat-to-string nat-tests nat-nonzero nat-log nat-log-test nat-mod \
	neg-datatype-nonterm \
	neq \
	negation \
	product product-thms \
	runtime-only \
	string string-format string-thms \
	sum sum-thms \
	termination \
	thms \
	tree tree-io-example tree-test \
	trie trie-thms \
	vector vector-test vector-sort vector-test-ctors \

SOURCES=$(ROOTS:=.agda)
DEPS=$(ROOTS:%=deps/%.deps)
TARGETS=$(ROOTS:=.agdai)

test-all: Makefile.deps $(TARGETS)

%.agdai : %.agda
	agda  -v 0 $<

Makefile.deps: $(DEPS)
	@cat $(DEPS) > Makefile.deps

deps/%.deps : %.agda
	@mkdir -p deps
	@./find-deps.sh $< > $@

include Makefile.deps

clean:
	rm -f Makefile.deps $(TARGETS) $(DEPS)
