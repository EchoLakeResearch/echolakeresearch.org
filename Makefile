# Find all markdown files
MARKDOWN=$(shell find ./content -iname "*.md")
# Form all 'html' counterparts
HTML=$(MARKDOWN:.md=.html)

.PHONY = all tar clean
all: $(HTML)

%.html: %.md

		pandoc -s -S --template=template.txt --include-in-header=style.css --from markdown --to html  $< -o build/$@

tar: $(MARKDOWN)
		tar --exclude=notes.tar.gz --exclude=.git/ -czvf notes.tar.gz ./

clean:
		$(shell rm -r build)
		$(shell mkdir build/)
		$(shell cp -r content build/content)