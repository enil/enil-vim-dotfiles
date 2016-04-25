LN             = ln -sfFn
GIT            = git
FILES          = .vimrc .vim
GIT_SUBMODULES = $(shell sed -nE 's/path = +(.+)/\1\/.git/ p' .gitmodules | paste -s -)
DEST           = $(HOME)

.PHONY: all
all: $(GIT_SUBMODULES)

.PHONY: install
install: $(FILES) | $(GIT_SUBMODULES)
	$(LN) $(shell realpath --relative-to=$(DEST) $^) $(DEST)

$(GIT_SUBMODULES): %/.git: .gitmodules
	$(GIT) submodule init
	$(GIT) submodule update $*
	@touch $@

