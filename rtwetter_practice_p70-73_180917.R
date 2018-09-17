install.packages('rtweet')
library(rtweet)


consumerKey <- '5Csdd2iaISW1bg2oeZxpoTMvh'
consumerSecret <- 'LAH3U4SqXPF2V8iP41IzjE6wLDkkxhXng0pqWSWt8Ih2XpEDwn'
appname <- 'abe_test_abe'
accesstokenkey <- '959308856-exfnSMqXHpHCJABpuRAn8goNwvfljDzErwNVtt3V'
accesstokensecret <- 'KKtX4BwuPCtB3nxQBVJpMoK0quSjLcsbCUtq6mWjnRbmE'

twitter_token <- create_token(
  app <- appname,
  consumer_key = consumerKey,
  consumer_secret = consumerSecret,
  access_token = accesstokenkey,
  access_secret = accesstokensecret
)
# ここでエラー
# Error in twitter_init_oauth1.0(self$endpoint, self$app, permission = self$params$permission,  : Unauthorized (HTTP 401).
# Callback URLs　を入力したら再度エラー
# Error in twitter_init_oauth1.0(self$endpoint, self$app, permission = self$params$permission,  : Forbidden (HTTP 403).
# twitter_tokenに　access_tokenとaccess_secretを加えることでエラー解消
# 参考:https://github.com/mkearney/rtweet/issues/265

rt <- search_tweets(
  'データサイエンティスト', n =100, include_rts = FALSE
)
# これでrtに「データサイエンティスト」検索結果のデータが格納される

######################180917追加作業######################################
#### エラー対処
# csvに出力
# write.csv(rt, 'DS_word_180917.csv',row.names=FALSE)
# データフレーム内カラムの一部がリスト型であるためunimplemented type 'list' in 'EncodeElement'というエラーが発生
class(rt)
# rtはデータフレーム型
class(rt$hashtags)
# list型
dim(rt)
# 88カラムあるのでその中から必要なカラムのみを抽出
#### ここまでエラー確認

# list型ではないカラムまでを抽出してみる
get_rt <- rt[,1:14]
# csvファイルに出力
write.csv(get_rt, 'DS_word_180917.csv',row.names=FALSE)

