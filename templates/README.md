seesparkbox.com 2.0 responsive templates
=========================================

Prerequisites:

1. [Ruby](http://www.ruby-lang.org/en/downloads/)
2. [Node](http://nodejs.org/download/)
3. [grunt-cli](https://github.com/gruntjs/grunt-cli) ```npm install -g grunt-cli```

Project Setup:

1. Type ```npm install``` and ```bundle``` in the root of the project directory.
2. Change the Project Name in ```package.json```
3. Run ```grunt watch```

**Your project will compile to ```dist/```**

## Font Notice

Due to copyright issues and the public nature of this repo, some vendor font files are intentionally missing. Steps for Sparkboxers to run these fonts locally:

* In the seesparkbox 2.0 shared assets folder, navigate to `Design/fonts/sparkbox_site-07112013/Fonts/`
* Copy all fonts within this directory
* Create a new directory in the project repo called `vendor` in templates/public/css/fonts, and copy fonts into this new directory
* After running `grunt`, the vendor fonts will be ready to go