# portfolio-swiftui-sample

## XcodeGenでプロジェクトファイルを生成

```bash
brew install swiftlint
brew install xcodegen
xcodegen
```

## API

### 取引一覧 エンドポイント(GET)

http://localhost:8080/api/transactions

```json
{
    "transactions": [
        {
            "id": 1,
            "accounts": "雑収入",
            "date": "2022/07/03",
            "price": 4606,
            "hex": "#ffffff",
            "supplier": "ファミリーマート",
            "description": "だして答えました。。"
        },
        {
            "id": 2,
            "accounts": "売上ほか",
            "date": "2022/07/03",
            "price": 855,
            "hex": "#3cb371",
            "supplier": "ダイソー",
            "description": "なく、みんなほんと。"
        },
        {
            "id": 3,
            "accounts": "通信費",
            "date": "2022/07/03",
            "price": 457,
            "hex": "#ff0000",
            "supplier": "ローソン",
            "description": "つの緑みどりいろい。"
        }
    ]
}

```

### 摘要 エンドポイント(GET)

http://localhost:8080/api/descriptions

```json

{
    "descriptions": [
        {
            "id": 1,
            "name": "いて行くんだんそれ。"
        },
        {
            "id": 2,
            "name": "すすんでないてある。"
        }
    ]
}

```

### 取引先 エンドポイント(GET)

http://localhost:8080/api/suppliers

```json

{
    "suppliers": [
        {
            "id": 1,
            "name": "ファミリーマート"
        },
        {
            "id": 2,
            "name": "セブンイレブン"
        }
    ]
}

```

## 画面

<img width="272" alt="iPhone_13_mini_と_ワイヤレス診断" src="https://user-images.githubusercontent.com/1781289/177058669-f4d35d49-695f-40fd-ae9f-08130a33780c.png"> <img width="268" alt="iPhone_13_mini_と_Editing_portfolio-swiftui-sample_README_md_at_develop_·_araiyusuke_portfolio-swiftui-sample" src="https://user-images.githubusercontent.com/1781289/177058688-e5296506-c4c1-43d5-8bb8-ab28b261fcc9.png"><img width="271" alt="iPhone_13_mini" src="https://user-images.githubusercontent.com/1781289/177058661-239354e2-dcff-4a51-a881-9d52ef69d3e5.png"><img width="270" alt="iPhone_13_mini" src="https://user-images.githubusercontent.com/1781289/177059856-b0c7d4f3-f1bc-4907-ac19-76c2ccc24cc5.png"><img width="278" alt="Cursor_と_iPhone_13_mini" src="https://user-images.githubusercontent.com/1781289/177070715-09941328-447e-4cc7-ad98-375b0390b94f.png"><img width="277" alt="Cursor_と_iPhone_13_mini" src="https://user-images.githubusercontent.com/1781289/177289253-6dd525eb-41e0-424a-8108-ce29857199f0.png"><img width="281" alt="Cursor_と_iPhone_13_mini" src="https://user-images.githubusercontent.com/1781289/178165373-da09a07f-cd77-4a47-acc5-af204b15f828.png">


