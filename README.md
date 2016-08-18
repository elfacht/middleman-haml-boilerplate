[![Build Status](https://travis-ci.org/elfacht/middleman-haml-boilerplate.svg)](https://travis-ci.org/elfacht/middleman-haml-boilerplate)

# Middleman Boilerplate

Project boilerplate for Middleman including blogging, RSS feed, sitemap, imageoptim and Haml.

## Installation

Install [Middleman](https://middlemanapp.com/) if you haven't done yet:

```console
$ gem install middleman
```

### Create middleman blog project directly from GitHub repo

```console
$ middleman init my_project -T elfacht/middleman-haml-boilerplate
```

### … or from local template 

```console
$ middleman init my_project --template=middleman-haml-boilerplate
```

### Install gems

```console
$ cd my_project
$ bundle install
```

### Install bower components
The CSS has already Foundation mixins included. To avoid errors install Foundation via bower:

```console
bower install
```
If you don't want to use Foundation, remove the breakpoint mixin in `base/_base.scss`.

### Start Middleman server

```console
$ bundle exec middleman
```

Open `http://localhost:4567` in a web browser.

## Gems
This boilerplate is using following gems:

* [middleman-autoprefixer](https://github.com/middleman/middleman-autoprefixer)
* [middleman-blog](https://github.com/middleman/middleman-blog)
* [middleman-imageoptim](https://github.com/plasticine/middleman-imageoptim)
* [middleman-inliner](https://github.com/kaiinui/middleman-inliner)
* [middleman-meta-tags](https://github.com/tiste/middleman-meta-tags)
* [middleman-minify-html](https://github.com/middleman/middleman-minify-html)
* [middleman-search_engine_sitemap](https://github.com/Aupajo/middleman-search_engine_sitemap)
* [middleman-title](https://github.com/jcypret/middleman-title)

## Tools

* [Foundation 6](http://foundation.zurb.com/docs/) (deactivated)
* [Haml](http://haml.info/)
* VanillaJS
* SCSS

## License
MIT Licensed, see [LICENSE](LICENSE.md) for details.
