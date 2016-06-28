.PHONY : install run all train
	
install:
	docker build --rm --tag=ryanmcdermott/trumpgen .

run:
	docker run -d -P -v $PWD/src:/opt/trumpgen ryanmcdermott/trumpgen

all:
	install run
