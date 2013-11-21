# The new [seesparkbox.com](http://seesparkbox.com)

This is the public rebuilding of <http://seesparkbox.com>. For all the juicy details, see <http://building.seesparkbox.com/>. Feel free to explore the repo!

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

# Naming Conventions

We follow [SMACSS](http://smacss.com/) conventions when naming CSS classes.
When you are naming something, **do not** name it based on its content, as this will be difficult to
use the module elsewhere. Try to name modules based on function instead.
 
**Modules** are the building blocks of a website. Multi-word module names should be *hyphen-separated*:
```css
.module {}
/* or */
.even-grid {}
```

**Subcomponents** are bits and pieces of a module that are specific to that module. A module is separated from a subcomponent with *double--hyphens*:
```css
.module--subcomponent {}
/* or */
.even-grid--item {}
```

**Modifiers** change or add styling in certain cases. They should be separated from what they modify with *underscores*:
```css
.module--subcomponent_modifier {}
/* or */
.even-grid--item_has-image {}
```

**Alternate modules** (a.k.a. subclassed modules) are simply modified modules. That means we use the modifier's *underscore* convention on them:
```css
.module_modifier {}
/* or */
.even-grid_constrained {}
```

So if a subcomponent requires special styling inside of an alternate module, do this:
```css
.module_modifier--subcomponent {}
/* or */
.even-grid_constrained--item { /* add me to an element in addition to .even-grid--item */}
```

**Only be as verbose as you need to be.** Don't allude to DOM structure when you don't need to:
```css
/* don't do */
.even-grid--contents--image {}

/* do */
.even-grid--image {}
```

For more information, please reference [documentation on the SMACSS website](http://smacss.com/).

## Data

### Causes for common errors:

* There are a few words that cannot be used in `.yml` files, since Handlebars reserves them. Please add additional words as you discover them. Known reserved words:
    * `icon`
    * `href`
    * `link`
    * `copy`
* Data lists cannot be given the same name as the filename. The grunt task will not throw an error, but the entire partial will mysteriously fail.