# Flaun

TODO 英語で書きなおす。

リモートのサーバからブラウザでアクセスすることを再現できます。
もっと詳しく言うとは ssh でポートフォワード して ブラウザでひらきます。
アクセス制御したいるが、固定IPがない時に便利かもしれません。

## Installation

Add this line to your application's Gemfile:

    gem 'flaun'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flaun

## Usage

もし eiel.info というマシンから http://localhost/foo にアクセスしたいとする。
この情報を `sample` とすると、以下のコマンドでブラウザでひらけるようにします。

```bash
$ flaun sample
```

これをできるようにするには `~/.flaun` を作成します。

```ruby
port 8010

target :sample do
  host 'eiel.info'
  path 'foo'
end
```

### 具体的には

以下のコマンドを実行した状態で、

```
ssh eiel.info -L 8010:eiel.info:80
```

`http://localhost:8010/foo` へブラウザで表示します。


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
