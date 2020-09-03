# goldy

[![Build Status][gh-actions-badge]][gh-actions]
[![LFE Versions][lfe-badge]][lfe]
[![Erlang Versions][erlang-badge]][versions]
[![Tags][github-tags-badge]][github-tags]

[![Project Logo][logo]][logo-large]

*A gopher client, shell, and server implementation in LFE*

##### Table of Contents

* [About](#about-)
* [Build](#build-)
* [Start the Project REPL](#start-the-repl-)
* [Tests](#tests-)
* [Usage](#usage-)
* [Gopher Resources](#gopher-resources-)
* [License](#license-)

## About [&#x219F;](#table-of-contents)

TBD

## Build [&#x219F;](#table-of-contents)

```shell
$ rebar3 lfe compile
```

# Start the Project REPL [&#x219F;](#table-of-contents)

```shell
$ rebar3 lfe repl
```

# Tests [&#x219F;](#table-of-contents)

```shell
$ rebar3 lfe test
```

## Usage [&#x219F;](#table-of-contents)

TBD

## Gopher Resources [&#x219F;](#table-of-contents)

* [Common Lisp library](https://github.com/knusbaum/cl-gopher)
* [RFC 1436 - The Internet Gopher Protocol](https://tools.ietf.org/rfc/rfc1436.txt)
* [RFC 4266 - The Gopher URI Scheme](https://tools.ietf.org/rfc/rfc4266.txt)
* [Gopher-II - The Next Generation Gopher WWIS](https://tools.ietf.org/html/draft-matavka-gopher-ii-02)
* [Overbite Firefox Extension - Reenable Gopher Support](https://addons.mozilla.org/en-US/firefox/addon/overbitewx/)
* [Generating static Gopher content](https://jfm.carcosa.net/blog/computing/hugo-gopher/)
* `curl` - built-in support for `gopher://`
* Gopher servers
  * [gopher://gopher.floodgap.com:70/](gopher://gopher.floodgap.com:70/)
  * [gopher://freeshell.org:70/](gopher://freeshell.org:70/)
  * [gopher://gopher.quux.org:70/](gopher://gopher.quux.org:70/)
  * [gopher://gopherpedia.com:70/1](gopher://gopherpedia.com:70/1)

## License [&#x219F;](#table-of-contents)

MIT License

Copyright © 2020, Duncan McGreggor <oubiwann@gmail.com>.

<!-- Named page links below: /-->

[logo]: https://avatars1.githubusercontent.com/u/3434967?s=250
[logo-large]: https://avatars1.githubusercontent.com/u/3434967
[github]: https://github.com/oubiwann/goldy
[gh-actions-badge]: https://github.com/oubiwann/goldy/workflows/ci%2Fcd/badge.svg
[gh-actions]: https://github.com/oubiwann/goldy/actions
[lfe]: https://github.com/rvirding/lfe
[lfe-badge]: https://img.shields.io/badge/lfe-1.3.0-blue.svg
[erlang-badge]: https://img.shields.io/badge/erlang-19%20to%2023-blue.svg
[versions]: https://github.com/oubiwann/goldy/blob/master/.github/workflows/cicd.yml#L17
[github-tags]: https://github.com/oubiwann/goldy/tags
[github-tags-badge]: https://img.shields.io/github/tag/oubiwann/goldy.svg
[github-downloads]: https://img.shields.io/github/downloads/oubiwann/goldy/total.svg
