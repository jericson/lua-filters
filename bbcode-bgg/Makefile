DIFF ?= diff --strip-trailing-cr -u
PANDOC ?= pandoc

test:
	@$(PANDOC) -t bbcode-bgg.lua sample.md | $(DIFF) expected.txt -

.PHONY: test
