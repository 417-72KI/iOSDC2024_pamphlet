---
title: VSCodeで手軽にSwiftスクリプトを書こう
author: '417.72KI (Twitter @417_72ki / GitHub: 417-72KI)'
papersize: a4
geometry: margin=20mm
header-includes: |
  <style>
    div.sourceCode { background-color: #ffffff; }
    pre.sourceCode:before { border: 1px solid #2a211c; content: " "; position: absolute; z-index: -1; }
    pre.sourceCode { border: 1px solid #2a211c; }
    pre code.sourceCode { white-space: pre-wrap; position: relative; }

    div.sourceCode code.swift { color: #000000; }
    code.swift span.at { color: #9b2393; font-weight: bold; } /* Attribute */
    code.swift span.kw { color: #9b2393; font-weight: bold; } /* Keyword */
    code.swift span.fu { color: #9b2393; font-weight: bold; } /* Function */
    code.swift span.cf { color: #9b2393; font-weight: bold; } /* ControlFlow */

    code.swift span.dv { color: #1c00cf; } /* DecVal */
    code.swift span.st { color: #c41a16; } /* String */

    div.sourceCode pre.sh { background-color: #000000; }
    div.sourceCode code.bash { color: #28fe14; }
    code.bash span.kw { color: #28fe14; font-weight: bold; }
    code.bash span.er { color: #28fe14; font-weight: bold; }

    # ul { margin: -5px 0; }
    ul li { margin: 10px 0; }
  </style>
---

## はじめに
単純作業を自動化しようとするとまず選択肢に上がるのがシェルスクリプトですが、macで主要なbashやzshはどちらも癖が強く、文法を覚えるのも大変です。  

実は我々iOSエンジニアにとって主流なSwiftでもスクリプトを書くことができます。  
しかし標準の開発環境であるXcodeではSwiftスクリプトのサポートがほとんどされておらず、標準APIのコード補完すらできないのが現状です[^1]。

[^1]: 本稿執筆時点ではXcode 16が出ておらず、iOSDC 2024開催時点でもおそらくまだPublic Betaです。9月頃の正式版リリースで改善される可能性はあります。

一方、2023年1月にMicrosoft製のエディタであるVSCode向けにSwiftの拡張機能がリリースされています。
これにより、XcodeがなくてもSwiftを使った開発が容易になりました。  
また、VSCode上であればSwiftスクリプトでもコード補完が実現できるようになりました。

本稿では、VSCodeにSwift拡張機能を導入し、実際にSwiftスクリプトを書くための手順を紹介します。


## 前提条件

執筆時点での環境は以下の通りです。

- Swift: 5.10
- VSCode: 1.90.0
- Swift for Visual Studio Code: v1.10.1

また、VSCodeのインストールについては省略します。
インストール方法は公式サイト等を参照してください。

## VSCodeにSwift拡張機能を導入する
まず、サイドバーの拡張機能タブを開きます。( `⌘+⇧+x` コマンドでも可 )。
次に、上部の検索窓に`Swift`と入力し、Returnキーを押すと一番上に`Swift`が表示されます。
検索結果から`Swift`を選択[^2]すると拡張機能の詳細が表示されます(図参照)。

詳細画面上部の「インストール」ボタンをクリックすると、Swift拡張機能がインストールされます。

[^2]: 検索結果の右側にある`インストール`ボタンをクリックすればそのままインストールが始まります

インストールが完了したらもうやることはありません。後は実際にSwiftでスクリプトを書くだけです。

### ちなみに

本稿では詳しくは触れませんが、Swift拡張機能をインストールするとVSCode上でSwift Packageの機能も使うことができるようになります。
スクリプトを扱う上では恩恵を受けることはあまりありませんが、Package開発をしている人であればターミナルを開くことなくPackageのビルドやテスト実行ができるのは嬉しい機能でしょう。

![図: Swift for Visual Studio Code](./images/01_vscode.png)


## 実際にVSCodeでSwiftスクリプトを書いてみよう

ここではSwiftでスクリプトを書くにあたって最低限気をつけるべきポイントを紹介します。

### Shebang
スクリプトファイルの1行目に書く`#!`から始まる行をShebang(シバン)といいます。
実行時のインタプリタを指定するためのもので、シェルスクリプトだと `#!/bin/sh` や `#!/bin/bash` 、 `#!/bin/zsh` がよく使われます。

Swiftスクリプトの場合は `#!/usr/bin/swift` ではなく `#!/usr/bin/env swift` と書くのが良いです。
`#!/usr/bin/swift` だと、`/usr/bin/swift` が存在しない環境(Linux等)でスクリプトを実行するとエラーになりますが、`/usr/bin/env` を使うことで `PATH` から `swift` コマンドを探してくれます。

### import
スクリプトでは`Foundation`以外のimportは原則使えないと考えましょう。

厳密にはビルトインFrameworkであればimportはできますがコード補完が効きづらいですし、そこまで複雑なことをやるようであれば大人しくExecutableなSwift Packageを作成するのが良いです。

ただし、ネットワーク通信が必要な場合はLinuxでの動作を考慮して`FoundationNetworking`を別途importする必要があります。

```swift
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
```

また、Linux用の `URLSession` は `async/await` に対応していない[^3]ため、`withCheckedThrowingContinuation` 等を使う必要があります。

[^3]: Swift 5.10現在

SwiftフォーラムではスクリプトでもPackageを扱えるような提案[^4]が出ていますが、2023年3月から更新されていないのが現状です。

[^4]: https://forums.swift.org/t/46717

## 終わりに
今までシェルスクリプトを使っていた人も、Swiftスクリプトに乗り換えてみてはいかがでしょうか？