## ライブラリのインストール
install.packages("rvest")

## ライブラリの読み込み
library(rvest)
library(dplyr)


# URLの指定
# url <- 'https://news.yahoo.co.jp/hl?c=socc'
# url <- 'https://www.soccer-king.jp/'
url <- 'https://profile.yahoo.co.jp/new_list/new_list1.html'
# read_htmlで指定したURLのページ構成を抽出
url_html <- read_html(url, encoding = 'UTF-8')


url_html %>% 
  # bodyを抽出
  html_nodes('body') %>% 
  # 文字列のみ抽出
  html_text()

url_html %>% 
  html_nodes('title') %>% 
  html_text()

# リンクのURLの抽出
url_html %>% 
  html_nodes('a') %>% 
  html_attr('href')

a <-url_html %>% 
  html_nodes('title') %>% 
  html_text()

# RMeCabC関数で形態素解析
RMeCabC(a)


# リストとして保存し各要素にアクセス
list_a <- RMeCabC(a)
list_a[1]
list_a[2]

# リストをベクトルに変換
vector_a <- unlist(list_a)
vector_a
