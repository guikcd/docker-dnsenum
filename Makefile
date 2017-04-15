$(shell git clone https://github.com/fwaeytens/dnsenum)
VERSION= $(shell grep "dnsenum.pl VERSION" dnsenum/dnsenum.pl | awk '{print $$NF}')
IMAGENAME=guidelacour/dnsenum

build:
	@echo Building dnsenum $(VERSION) image...
	docker build --tag $(IMAGENAME):$(VERSION) .

test:
	docker run --tty --interactive --volume $(shell pwd)/Dockerfile:/Dockerfile replicated/dockerfilelint /Dockerfile
	docker run --rm $(IMAGENAME):$(VERSION) | grep "VERSION:$(VERSION)"

clean:
	rm --recursive --force dnsenum
