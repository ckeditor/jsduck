# Repository

1. The `master` branch always refers to the [official JSDuck `master`](https://github.com/senchalabs/jsduck) branch. It's a development branch.
1. The `stable` branch contains the latest stable official JSDuck release plus CKEditor's modifications. Gem packages should be built from this branch.
1. The `ckeditor-customizations` branch contains all modifications made by the CKEditor team and can be used while updating JSDuck to reapply those changes.

# Building the CKEditor JSDuck Gem

Full guide can be found in the [JSDuck wiki](https://github.com/ckeditor/jsduck/wiki/Hacking).

1. `> sudo gem install rake rspec compass json rdiscount parallel dimensions rkelly-remix`
1. `> git clone git@github.com:ckeditor/jsduck.git`
1. `> cd jsduck`
1. `> git co stable`
1. `> rake configure`
1. `> rake` (should be 100% green)
1. `> rake ext4` (when executed for the first time gives a lot of warnings &mdash; you can repeat it)
1. To generate the gem you first need to have a JSDuck-built documentation application available at `http://localhost/docs/`:

  `> ln -s path/to/jsduck/output docs` (from localhost's root)

1. `> rake bump["0.0.2"]` (update version number if you made any changes)
1. `> rake gem`
1. If you want to commit a new version, remove the old gem and add a new one to the repository.

# Building the CKEditor Documentation

Read the instructions in the [`ckeditor-docs`](https://github.com/ckeditor/ckeditor-docs) repository.

# Modifying JSDuck

1. Rebuilding the gem package:
  1. If you modified JSDuck version (merged upstream's `master`), make sure to run all `rake` commands starting from `rake configure` in step 5 above.
  1. If you only modified JSDuck code within a previously built version, it's enough to build the gem package.
1. Commiting changes:
  1. All code modifications should be done in the `ckeditor-customizations` branch, so that they would be easily reapplicable in the future.
  1. After making any changes, first commit code changes (this may be more than one commit), then bump the JSDuck version, build a new gem package, remove the old one from the repository and add the new one, then commit the rebuilt package.
1. Testing:
  
  For testing purposes you can use the script available in `bin/ckeditor-jsduck` instead of constantly installing the rebuilt gem package. You need to temporarily modify the [`build.sh`](https://github.com/ckeditor/ckeditor-docs/blob/master/build.sh) script from the CKEditor documentation repository to use this file.

# Customizations

List of applied customizations:

1. Gem name changed to `ckeditor-jsduck` to avoid conflicts.
2. Event arguments are automatically wrapped with the `eventInfo` object.
3. Developer's Guide table of contents tree is kept collapsed by default.
4. Improved SEO by including meta tags in the Developer's Guide. They are configurable through the `guides.json` file.
5. Added these instructions.