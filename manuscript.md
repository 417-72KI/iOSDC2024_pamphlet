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
  </style>
---

## はじめに
単純作業を自動化しようとするとまず選択肢に上がるのがシェルスクリプトです。
しかし、macで主要なbashやzshはどちらも癖が強く、文法を覚えるのも大変です。

我々iOSエンジニアにとって主流なSwiftでもスクリプトを書くことができます。
しかし、標準の開発環境であるXcodeではSwiftスクリプトのサポートがほとんどされておらず、標準APIのコード補完すらできないのが現状です。

一方、2023年1月にMicrosoft製のエディタであるVSCode向けにSwiftの拡張機能がリリースされています。
これにより、XcodeがなくてもSwiftを使った開発が容易になりました。
また、VSCode上であればSwiftスクリプトでもコード補完が実現できるようになりました。



## VSCodeにSwiftプラグインを導入する
## VSCodeでSwiftスクリプトを書こう

## 終わりに
