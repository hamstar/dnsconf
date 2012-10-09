# Ruby Command line DNS manipulator

Modify your DNS from the command line.

Currently supports bind.

Gems to employ the use of:
* http://rubygems.org/gems/bind-zone-parser
* http://rubygems.org/gems/bind9mgr


## Usage

This is how the command line should work.

New zones:

```
$ dns new example.com
dns> add cname sub example2.com
dns> add a @ 20.34.54.2
dns> add a www 20.34.54.2
dns> add a blog 20.34.54.45
dns> add mx 10 202.54.6.32
dns> add ns ns1 202.30.30.4
dns> save
saved config
dns> exit
```

Editing zones:

```
$ dns edit example.com
dns> list
1: @  IN	A	20.34.54.2
2: www	IN	A	20.34.54.2
3: sub	IN	CNAME	example2.com
4: blog	IN	A	20.34.54.45
5:	MX	10	202.54.6.32
6: ns1	IN	NS	202.30.30.4
dns> del 5
dns> list
1: @	IN	A	20.34.54.2
2: www	IN	A	20.34.54.2
3: sub	IN	CNAME	example2.com
4: blog	IN	A	20.34.54.45
5: ns1	IN	NS	202.30.30.4
dns> save
saved config
dns> flush
flushed all entries
dns> list
no entries
dns> exit
```