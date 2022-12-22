# Running on Windows
#
# Set GOPATH in terminal. Example (make for windows needs forwardslashes):
#   set GOPATH=T:/repos/reporter

TARGET:=$(GOPATH)/bin/grafana-reporter
ifeq ($(OS),Windows_NT)
	TARGET:=$(GOPATH)/bin/grafana-reporter.exe
endif
SRC:=$(GOPATH)/src/github.com/yimiaoxiehou/grafana-reporter

.PHONY: build
build: 	
	go install -v github.com/yimiaoxiehou/grafana-reporter/cmd/grafana-reporter@main

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

