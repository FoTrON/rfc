all:

build:
	mkdocs build

deploy:
	mkdocs gh-deploy


pandocmd: build
	mkdocs2pandoc -o ammor.pd

serve:
	mkdocs serve

clean:
	rm -rf site
