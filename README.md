# PunchedQuest! backend

Also check out the [frontend](https://github.com/loleg/punchedquest).

## Setup

You need Ruby 2.2.2. If you have some other version of Ruby installed, modify the second line of `Gemfile` to match your version, e.g. (`ruby '2.1.0'` instead of `ruby '2.2.2'`)

Install the dependencies:

```
$ bin/setup
```

Also install ImageMagick if you need it, e.g.:

```
sudo apt-get install imagemagick
```

Then start the application:

```
$ bin/start
```

Go to <http://localhost:4567>.


## Card generation and analysis

You can generate a new card with

```
$ bin/generate_card punchcard.pdf
```

Once you fill in the card (that can be in PDF, JPG or PNG formats), you can submit it for analysis with:

```
$ bin/highlight_marks filled-punchcard.pdf highlights.jpg
```

highlights.jpg will contain your card with the highlights of the check marks. You can use that to test whether the marks are recognized when card is photographed from different perspectives.

If the card is not recognized, [mork](https://github.com/giuseb/mork) will print an error, for instance:

```
---=={ Unregistered image. Reason: '{:tl=>:ok, :tr=>:no_contrast, :br=>:no_contrast, :bl=>:ok, :write=>nil}' }==---
```

The abbreviations `tl`, `tr`, `br`, `bl` stand for top left, top right, bottom right, bottom left. The error indicates whether the four markers on the edges of the card were recognized.

You can find more information in the [mork readme](https://github.com/giuseb/mork). I have modified the source slightly and included it in this repository directly to allow for custom symbols on the generated documents.
