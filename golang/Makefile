gim: gim.go
	go build -trimpath -o "$@"

clean:
	rm gim
.PHONY: clean

install:
	sudo cp gim /usr/local/bin/
.PHONY: install

uninstall:
	sudo /bin/rm /usr/local/bin/gim 
.PHONY: uninstall
