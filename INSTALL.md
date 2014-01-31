# Repository

1. The `master` branch always refers to [official JSDuck's `master`](https://github.com/senchalabs/jsduck) branch. It's a development branch.
1. The `stable` branch contains latest stable official JSDuck's release plus CKEditor's modifications. Gem packages should be built from this branch.
1. The 'ckeditor-customizations' branch contains all modifications made by CKEditor and can be used while updating JSDuck to reapply those changes.

# Building gem package

Full guide can be found in [JSDuck's wiki](https://github.com/ckeditor/jsduck/wiki/Hacking).

1. `> sudo gem install rake rspec compass json rdiscount parallel dimensions rkelly-remix`
1. `> git clone git@github.com:ckeditor/jsduck.git`
1. `> cd jsduck`
1. `> git co stable`
1. `> rake configure`
1. `> rake` (should be 100% green)
1. `> rake ext4` (when executed first time gives a lot of warnings - you can repeat it)
1. To generate the gem you first need to have a JSDuck-built documentation app available at `http://localhost/docs/`:

  `> ln -s path/to/jsduck/output docs` (from localhost's root)

1. `> rake bump["0.0.2"]` (update version number if you did any changes)
1. `> rake gem`
1. If you want to commit new version, remove old gem and add new one to the repository.

# Installing gem package

1. `sudo gem install ckeditor-jsduck-<version>.gem`
1. Then use `build.sh` script from [ckeditor-docs](https://github.com/ckeditor/ckeditor-docs) repository to build CKEditor documentation.

# Rebuilding gem package

If you modified JSDuck version (merged upstream's `master`), make sure to run all rake commands from `rake configure` (including it).

If you only modified JSDuck code within previously built version it's enough to build gem package.

After making any change, first commit code changes (may be more than one commit), then bump JSDuck version, build new gem package, remove old from repository and add new one, then commit rebuilt package.

For testing purposes you can use script available in `bin/ckeditor-jsduck` instead of constantly installing rebuilt gem package. You need to temporarily modify `build.sh` script from CKEditor documentation repository to use this file.