FROM alpine

RUN apk --no-cache add jq aws-cli \
    &&  wget "https://dl.k8s.io/release/$(wget https://dl.k8s.io/release/stable.txt && cat stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin
