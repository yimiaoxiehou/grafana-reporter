# Running on Windows
#
# Set GOPATH in terminal. Example (make for windows needs forwardslashes):
#   set GOPATH=T:/repos/reporter

TARGET:=$(GOPATH)/bin/grafana-reporter
ifeq ($(OS),Windows_NT)
	TARGET:=$(GOPATH)/bin/grafana-reporter.exe
endif
SRC:=$(GOPATH)/src/github.com/IzakMarais/reporter

.PHONY: build
build: 	
	go env GO111MODULE=off
	go install -v github.com/IzakMarais/reporter/cmd/grafana-reporter@latest

.PHONY: clean
clean: 	
	rm -rf $(GOPATH)/bin

.PHONY: test
test: $(TARGET)
	@go test -v ./...

.PHONY test2:
	@echo hello $(TARGET)

$(GOPATH)/bin/dep:
	@go get -u github.com/golang/dep/cmd/dep

update-deps: $(GOPATH)/bin/dep
	@cd $(SRC) && dep ensure
	@cd $(SRC)/cmd/grafana-reporter && 
	
$(TARGET):
	@cd $(SRC)/cmd/grafana-reporter && go install

