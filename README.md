# CKEditor JSDuck Gem

This repository is used for storing CKEditor modifications for [JSDuck](https://github.com/senchalabs/jsduck), API documentation framework that is used for the [CKEditor 4 developer documentation](http://docs.ckeditor.com/).

## Repository

1. The `master` branch always refers to the [official JSDuck `master`](https://github.com/senchalabs/jsduck) branch. It's a development branch.
1. The `stable` branch contains the latest stable official JSDuck release plus CKEditor's modifications. Gem packages should be built from this branch.
1. The `ckeditor-customizations` branch contains all modifications made by the CKEditor team and can be used while updating JSDuck to reapply those changes.

## Building the CKEditor JSDuck Gem

More detailed guide can be found in the [JSDuck wiki](https://github.com/senchalabs/jsduck/wiki/Hacking).

The most suitable version is `ruby 1.9.3`. You may use [RVM](https://rvm.io/) for your convenience. 

1. Install [Sencha SDK Tools](https://github.com/Shereef/Sencha-Touch-2) for your OS.
1. `> sudo gem install rake rspec json rdiscount parallel dimensions rkelly-remix`
1. Install `sass` gem:
    * `> sudo gem install sass -v 3.1.18` (for ruby version >= 2)
    * `> sudo gem install sass -v 3.1.1` (for ruby version < 2)
1. `> sudo gem install compass -v 0.12.2`
1. `> git clone git@github.com:ckeditor/jsduck.git`
1. `> cd jsduck`
1. `> git co stable`
1. `> rake configure`
1. `> rake ext4` (it gives a lot of warnings when executed for the first time &mdash; you can repeat it)
1. To generate the gem you first need to have a JSDuck-built documentation application available at `http://localhost/docs/`.
The `jsduck/output` directory should be available under `http://localhost/docs/` so the easiest way is to run from localhost's root:

  `> ln -s path/to/jsduck/output docs`

11. `> rake bump["0.0.2"]` (update version number if you made any changes)
1. `> rake gem`
1. If you want to commit a new version, remove the old gem and add a new one to the repository.

## Building the CKEditor Documentation

Read the instructions in the [`ckeditor-docs`](https://github.com/ckeditor/ckeditor-docs) repository.

## Modifying JSDuck

1. Rebuilding the gem package:
  1. If you modified JSDuck version (merged upstream's `master`), make sure to run all `rake` tasks starting from `rake configure` in step 8 above.
  1. If you only modified JSDuck code within a previously built version, it's enough to build the gem package, unless templates have been modified.
1. Committing changes:
  1. All code modifications should be done in the `ckeditor-customizations` branch, so that they would be easily reapplicable in the future.
  1. After making any changes, first commit code changes (this may be more than one commit), then bump the JSDuck version, build a new gem package, remove the old one from the repository and add the new one, then commit the rebuilt package.
1. Testing:

  For testing purposes you can use the script available in `bin/ckeditor-jsduck` instead of constantly installing the rebuilt gem package. You need to temporarily modify the [`gruntfile.js`](https://github.com/ckeditor/ckeditor-docs/blob/master/gruntfile.js#L51) script from the CKEditor documentation repository to use this file. The `cmd` should point to full path with `bin/ckeditor-jsduck` instead of `ckeditor-jsduck`.

  If you modified JSDuck templates, then you need to run rake tasks up to `rake gem` (excluding bumping up the version of course), otherwise `bin/ckeditor-jsduck` will still be using old minified templates.

## Customizations

List of applied customizations:

### 0.0.9

1. Fix possible XSS in template `index.php` file. Reported by Bruno da Silva aka ipsbruno.

### 0.0.8

1. Updated `parallel` gem dependency to `1.12.0` version.

### 0.0.7

1. HTTPS support.

### 0.0.6

1. Fixed ToC injection when `<h1>` is not the first element of a guide (it may be preceded by a license comment).

### 0.0.5

1. Added support for the `expanded` property of guides menu items.
2. Implemented multi-level TOC in guides.

### 0.0.4

1. Made sidebar wider.

### 0.0.3

1. Fixed canonical URL for documentation loaded from CDN.

### 0.0.2

1. Introduced `--head-html-common` config option which makes it possible to extend the `<head>` of **all** templates.

### 0.0.1

1. Gem name changed to `ckeditor-jsduck` to avoid conflicts.
2. Event arguments are automatically wrapped with the `eventInfo` object.
3. Developer's Guide table of contents tree is kept collapsed by default.
4. Improved SEO by including meta tags in the Developer's Guide. They are configurable through the `guides.json` file.
5. Added these instructions.

===================================================================================
CKEditor documentation uses [JSDuck](https://github.com/senchalabs/jsduck), API documentation generator for Sencha JavaScript frameworks.

![JSDuck](https://raw.github.com/senchalabs/jsduck/master/opt/jsduck-logo-dark.png)

## Copying

JSDuck is distributed under the terms of the GNU General Public
License version 3.

JSDuck was developed by [Rene Saarsoo](http://triin.net),
with contributions from
[Nick Poulden](https://github.com/nick),
[Ondřej Jirman](https://github.com/megous),
[Thomas Aylott](https://github.com/subtleGradient),
[Dave Thompson](https://github.com/limscoder),
[Ed Spencer](https://github.com/edspencer),
[Rob Dougan](https://github.com/rdougan),
[Scott Whittaker](https://github.com/scottrobertwhittaker),
[Timo Tijhof](https://github.com/Krinkle),
[Brian Moeskau](https://github.com/bmoeskau),
[Garry Yao](https://github.com/garryyao),
[Yasin Okumus](https://github.com/lacivert),
[Nicholas Boll](https://github.com/NicholasBoll) and
Katherine Chu.

Many thanks goes also to those who have most eagerly reported bugs:
[Ryan Nauman](https://github.com/ryan-nauman),
[Raphael Franchet](https://github.com/raphdulaf),
[atian25](https://github.com/atian25),
[burnnat](https://github.com/burnnat),
[Raphael Pigulla](https://github.com/pigulla),
[Dmitry Bakaleinik](https://github.com/demongloom),
[Alan Lindsay](https://github.com/alindsay55661),
[Corey Butler](https://github.com/coreybutler),
[Nickolay Platonov](https://github.com/SamuraiJack),
[Matt Greer](https://github.com/city41),
[Richard](https://github.com/ritcoder) and
[Dmitry Pashkevich](https://github.com/dpashkevich).

There are lots of others I haven't named here, who have provided their
input.

## JSDuck Changelog

See [the Releases page](https://github.com/senchalabs/jsduck/releases).