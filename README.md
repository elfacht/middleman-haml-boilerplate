[![Build Status](https://travis-ci.org/elfacht/middleman-haml-boilerplate.svg)](https://travis-ci.org/elfacht/middleman-haml-boilerplate)

# Middleman Boilerplate

Project boilerplate for Middleman including blogging, RSS feed, sitemap, imageoptim and Haml.

## Installation

Install [Middleman](https://middlemanapp.com/) if you haven't done yet:

```console
$ gem install middleman
```

### Create middleman blog project

```console
$ middleman init my_project --template=elfacht/middleman-haml-boilerplate
```

### Install gems

```console
$ cd my_project
$ bundle install
```

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

* [Bootstrap v4](http://v4-alpha.getbootstrap.com/)
* [Foundation](http://foundation.zurb.com/docs/) (deactivated)
* [Haml](http://haml.info/)
* [grunt-grunticon](http://www.grunticon.com/)
* [grunt-bump](https://github.com/vojtajina/grunt-bump)
* [grunt-contrib-jshint](https://github.com/gruntjs/grunt-contrib-jshint)
* [grunt-contrib-watch](https://github.com/gruntjs/grunt-contrib-watch)
* [grunt-newer](https://www.npmjs.com/package/grunt-newer)
* [matchdep](https://www.npmjs.com/package/matchdep)
* [imagesloaded.js](https://github.com/desandro/imagesloaded)
* VanillaJS
* SCSS

## License
MIT Licensed, see [LICENSE](LICENSE.md) for details.