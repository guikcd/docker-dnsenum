$(shell git clone https://github.com/fwaeytens/dnsenum)
VERSION=$(shell curl --silent https://api.github.com/repos/fwaeytens/dnsenum/releases/latest | jq --raw-output '.["tag_name"]')
IMAGENAME=guidelacour/dnsenum

build:
	@echo Building dnsenum $(VERSION) image...
	docker build --tag $(IMAGENAME):$(VERSION) .
	docker tag $(IMAGENAME):$(VERSION) $(IMAGENAME):latest

test:
	docker run --tty --interactive --volume $(shell pwd)/Dockerfile:/Dockerfile replicated/dockerfilelint /Dockerfile
	docker run --rm $(IMAGENAME):$(VERSION) | grep "VERSION:$(VERSION)"
	echo "www" > dnslight.txt && docker run --rm --volume $(shell pwd)/dnslight.txt:/tmp/dnslight.txt $(IMAGENAME):$(VERSION) ./dnsenum.pl example.org --enum --file /tmp/dnslight.txt --noreverse

push:
	docker push $(IMAGENAME):$(VERSION)
	docker push $(IMAGENAME):latest

clean:
	rm --recursive --force dnsenum
	rm --force dnslight.txt
