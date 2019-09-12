# gcc-jman

GCC(1)のmanpageを和訳する。

## ビルド方法
```sh
$ cd gcc
$ ./make.sh
$ man doc/gcc.1
```

## メモ
- manpageの生成元は invoke.texi。これはGCCのマニュアルの第三章にあたる
- 改行すると半角スペースが入る
  - TODO: 和文文字の後の改行を削除する処理を入れる

  
## 要検討の箇所
- source language: ソース言語
- "Numeric arguments must typically be small unsigned decimal or hexadecimal integers."
  - small ってどういう意味だろう。仮に「小さな数字」という意味だと解釈して訳す。
