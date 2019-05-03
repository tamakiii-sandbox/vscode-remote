VSCODE := /Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code

init: install .devcontainer open

open:
	type $(VSCODE) > /dev/null
	$(VSCODE) .

install: \
	install-extensions

install-extensions: \
	install-extension/ms-vscode-remote.remote-containers \
	install-extension/peterjausovec.vscode-docker

install-extension/%:
	$(VSCODE) --install-extension $(@F)

.devcontainer:
	cp -r development/.devcontainer $@

clean:
	rm -rf .devcontainer

