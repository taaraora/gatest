FROM golang:1.19.3 as builder
# Set environment veriables for Go module and x64 architecture
ARG ARCH=amd64
# Set current working directory inside the container
WORKDIR /app

# Copy and build the code
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=${ARCH} go build \
	-o /app/bin/srv \
	-a ./main.go

# Run the container
FROM alpine

COPY --from=builder /app/bin/srv /bin/srv

ENTRYPOINT ["/bin/srv"]