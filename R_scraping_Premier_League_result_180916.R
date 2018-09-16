library(rvest)

# 対象URLの文字列が長いので変数に格納
url_P <- 'https://soccer.yahoo.co.jp/ws/schedule/52'

Premier_result <- read_html(url_P) %>% 
  html_nodes(xpath = '//*[@id="main"]/div[3]/table') %>% 
  html_table()

head(Premier_result)

# 取得データをcsvとして出力
write.csv(Premier_result, 'Premier_result.csv')

# index番号を抜く
write.csv(Premier_result, 'Premier_result.csv',row.names=FALSE)
