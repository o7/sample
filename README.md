SAMPLE: Elixir N2O App
======================

TL;DR Simple sample how to use N2O from Elixir.

Features
--------

* Usage Example of N2O, KVX, NITRO
* RocksDB support out of the box
* As minimal as possible

Prerequisits
---

* cmake

Run
---

Before running, [fullchain.pem](./priv/ssl/fullchain.pem) certificate have to be added into a system.

```
$ mix deps.get
$ mix compile
$ iex -S mix
```

Then open `https://localhost:8001/app/index.htm`

Notes
-----

* [2019-06-10 N2O MIX](https://tonpa.guru/stream/2019/2019-06-10%20N2O%20MIX.htm)

Credits
-------

* Aleksei Matiushkin [am-kantox](https://github.com/am-kantox)
* Dmitry Bushmelev [b0oh](https://github.com/b0oh)
* Yevhenii Kurtov [lessless](https://github.com/lessless)
* Maxim Sokhatsky [5HT](https://github.com/5HT)

OM A HUM
