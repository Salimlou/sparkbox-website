# [seesparkbox.com](http://seesparkbox.com) 2.0 responsive templates

## Building the project:

Prerequisites:

1. [Ruby](http://www.ruby-lang.org/en/downloads/)
2. [Node](http://nodejs.org/download/)
3. [grunt-cli](https://github.com/gruntjs/grunt-cli) ```npm install -g grunt-cli```

Project Setup:

1. Type ```npm install``` and ```bundle``` in the root of the project directory.
2. Change the Project Name in ```package.json```
3. Run ```grunt watch```

**Your project will compile to ```dist/```**

## Fonts

Due to copyright issues and the public nature of this repo, some vendor font files are intentionally missing. Steps for Sparkboxers to run these fonts locally:

* In the seesparkbox 2.0 shared assets folder, navigate to `Design/fonts/sparkbox_site-12112013/Fonts/`
* Copy all fonts within this directory, and place them in the project repo here: `templates/public/css/fonts`
* After running `grunt`, the vendor fonts will be ready to go

## Conventions

### Commits
Please style commit messages using the following guidelines:

Format of the commit message

```git
<type> (scope): <subject>
<additional details>
```

First line cannot be longer than 70 characters. To add more details to a commit message,
write them on another line.

Allowed types:

- feat (new feature)
- fix (bug fix)
- docs (changes to documentation)
- style (formatting, missing semi colons, etc; no code change)
- refactor (refactoring production code)
- test (adding missing tests, refactoring tests; no production code change)
- chore (updating grunt tasks etc; no production code change)

### Adding modules to the Styleguide

Each new site feature should be split into partials to the smallest responsible degree, and documented in the styleguide. The styleguide lists each modules in their different states.

This guide is generated dynamically using a simple file name convention. In order to add a module named "some-module" to the styleguide please follow these steps:

1. Create a SCSS file (`scss/_some-module.scss`) and include the appropriate KSS comment block at the top. See [the following section](#style-documentation) for a how-to on writing this syntax.
2. Create an HBS file (`partials/_some-module.hbs`) with the appropriate markup
3. If the template uses Handlebars tags, create the appropriate yml file (`data/styleguide/some-module.yml`)

That's it. You're done. When the site is built using `grunt` from the command line, the styleguide will be dynamicaly built with your new content.

### Style Documentation

Please use KSS to document SASS files.

The basic format for KSS documentation can be best explained in an example:

    // A button suitable for giving stars to someone.
    //
    // :hover             - Subtle hover highlight.
    // .stars-given       - A highlight indicating you've already given a star.
    // .stars-given:hover - Subtle hover highlight on top of stars-given styling.
    // .disabled          - Dims the button to indicate it cannot be used.
    //
    // Styleguide 2.1.3.
    a.button.star{
      ...
      &.star-given{
        ...
      }
      &.disabled{
        ...
      }
    }

For more information, please reference [documentation on the KSS repo](https://github.com/kneath/kss/blob/master/SPEC.md).

### Naming HTML/CSS Classes

Please use SMACSS conventions while naming items for styling.
Use separate classes for base rules, layout rules, module rules, and state rules.
To create submodules, extend a base classes and apply the extended class to your element.

For example, to create a button module and button-default and button-danger submodules:

    %button {
      font-size: 0.8em;
      border-radius: 0.5em;
    }

    .button-default {
      @extend %button;
      background: gray;
    }

    .button-default-extraText {
      color: orange;
    }

    .button-danger {
      @extend %button;
      background: red;
    }

For more information, please reference [documentation on the SMACSS website](http://smacss.com/).

## Data

### Causes for common errors:

* There are a few words that cannot be used in `.yml` files, since Handlebars reserves them. Please add additional words as you discover them. Known reserved words:
    * `icon`
    * `href`
    * `link`
    * `copy`
* Data lists cannot be given the same name as the filename. The grunt task will not throw an error, but the entire partial will mysteriously fail.