rel:
	/bin/ls -1 *.gemspec | xargs gem build
relpush:
	gem push *.gem
uninstall:
	/bin/ls -1 *.gemspec | sed 's/\.gemspec//g' | xargs gem uninstall
install:
	/bin/ls -1 *.gem | xargs gem install
clean:
	rm -rf *.gem
