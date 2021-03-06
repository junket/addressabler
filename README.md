# Addressabler

**Addressabler** extends the
[Addressable::URI](https://github.com/sporkmonger/addressable) class by adding
TLD parsing, domain and subdomain parsing, query modification, and restoring
setting of nested hashes to query strings.

## Install

Add Addressabler to your `Gemfile`:

```ruby
gem "addressabler", ">= 0.1"
```

Addressabler will automatically require `addressable/uri`.

## Usage

### Domain, TLD, and subdomain parsing

Use `Addressable::URI` like you normally would:

```ruby
@uri = Addressable::URI.parse("http://www.google.com/")
@uri.host #=> "www.google.com"
```

Addressabler will add the following properties:

```ruby
@uri.tld #=> "com"
@uri.domain #=> "google"
@uri.subdomain #=> "www"
```

You can set these values, as well:

```ruby
@uri.tld = "org"
@uri.host #=> "www.google.org"
@uri.domain = "amazon"
@uri.host #=> "www.amazon.org"
@uri.subdomain = "developers"
@uri.host #=> "developers.amazon.org"
```

#### Complex TLD support (thanks to Paul Dix!)
Addressabler copies some of Paul Dix's
[Domaintrix](https://github.com/pauldix/domainatrix) TLD code to support fancy
TLDs, as well:

```ruby
@uri.host = "www.google.co.uk"
@uri.tld #=> "co.uk"
```

#### Private / Public TLDs

By default, Addressabler knows about ICANN public TLDs. There are, however, lots and lots of private TLDs that companies have registered. For example, as Dom Hodgson [points out](https://github.com/flipsasser/addressabler/issues/3), "blogspot.com" is a TLD by private, non-ICANN standards which are applied by the Mozilla foundation to the TLD list.

As such, Addressabler defaults to parsing the ICANN public TLDS (`Addressabler.public_tlds`) but can easily be instructed to look at private TLDs like so:

```ruby
Addressabler.use_private_tlds = true
```

#### Custom TLDs
You can specify custom TLDs - which aren't actually working TLD's on the
internet - for internal usage. One example would be a custom development TLD:

```ruby
Addressabler.custom_tlds = {
  'dev' => {},              # mydomain.dev
  'bar' => { 'foo' => {} }  # mydomain.foo.bar
}
```

### Query interface

Addressabler adds a `query_hash` method to `Addressable::URI`s. This makes
editing query strings a lot simpler, using a familiar Hash syntax:

```ruby
@uri.query_hash[:foo] = :bar
@uri.to_s #=> "http://www.google.co.uk/?foo=bar"
```

#### Nested hashes in query strings

The current maintainer of Addressable, [Bob
Aman](https://github.com/sporkmonger), feels rather strongly that [Rails got it
wrong](https://github.com/sporkmonger/addressable/issues/77) in supporting
nested hashes in query strings.

Frankly, I don't disagree with anything he has to say on the issue, but it is a
problem many people have experienced.

*As such,* since Rack already supports building nested hashes "the Rails Way"
(shudder), I added support for assigning nested hashes to `Addressable::URI`s **only if Rack
is available.** Addressabler will attempt to load `Rack::Utils` and, if it finds
it, you can assign a nested hash in the `query_hash=` method like so:

```ruby
@uri.query_hash = {:foo => {:bar => :baz}}
@uri.to_s #=> "http://www.google.co.uk/?foo[bar]=baz"
```

**HANDLE WITH CARE!** As [Bob explains in the discussion](https://github.com/sporkmonger/addressable/issues/77#issuecomment-8534480),
there's a better alternative to nested hashes in query strings, so try that
before you install this library.

That's it. Enjoy.

## Contributors THANKS GUYS

Super special thankses to

* [Jean Mertz](https://github.com/jeanmertz) for the custom [TLD implementation](https://github.com/flipsasser/addressabler/pull/2)
* [Paul Dix](https://github.com/pauldix) for the [Domainatrix](https://github.com/pauldix/domainatrix) parsing code
* [Bob Aman](https://github.com/sporkmonger) for maintaining [Addressable](https://github.com/sporkmonger/addressable)

#### Copyright &copy; 2013 Flip Sasser