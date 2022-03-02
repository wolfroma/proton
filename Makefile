CLIENT_BINARY_NAME=proton-client.out
SERVER_BINARY_NAME=proton-server.out

all: build test

proto:
	@echo ">> Generate protos for Proton"
	 protoc \
			-I ./pkg/proton/protos proton.proto \
			--go-grpc_out=./pkg/proton/protos

build: proto
	go build -o ${CLIENT_BINARY_NAME} client/main.go

test:
	go test -v client/main.go

run:
	go build -o ${CLIENT_BINARY_NAME} client/main.go
	./${CLIENT_BINARY_NAME}

clean:
	go clean
	rm ${CLIENT_BINARY_NAME}



#test:
#	cd test && go test -v