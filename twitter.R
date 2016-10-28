## Packaging for getting Tweets
library(twitteR)
library(httr)
library(ROAuth)

##Packages for woking with Tweet data
library(plyr)
library(stringr)

## packages for graphing data
library(ggplot2)

#This set up the OAuth credentials for a twitter Session
#Here is the code 
lock.key <- 'FaeIFTf4bKCwoSvU2FpsUdOR3'
my.lock <- 'bFgW9U7AGwPUxfi5UcH90aLhl9pg0EtRgVIrFtzEtGU7bfndtC'
myaccess.token <-'2963957545-IAVBYqlXEMTh1KdQXaHDJzAQk0TXYwKB6A0B4Dp'
myaccess.token.secret <-'8BzOD3Vrw6xSd0M2aPNjUkU7RNplGAwsFH4gZpOUZFRjw'

#Create Twitter Connection
#The OAuth authentication Handshake
setup_twitter_oauth(lock.key,my.lock,myaccess.token,myaccess.token.secret)

#Search for @BatmanVSuperman Tweets
tweets <- searchTwitter('BatmanVSuperman' , n= 100, lang = 'en')


#see how many tweets we found
length(tweets)

#it shows the first five tweets
head(tweets,5)

#Strip out retweets
tweets <-(strip_retweets(tweets, strip_manual = TRUE, strip_mt = TRUE))

# see the origninal tweets
length(tweets)

#loopover Tweets and extract text
tweets.text <- laply(tweets , function (x)  x$getText())

head(tweets.text,5)

# To Write Data to the Files
write.table(tweets.text,file='Saurabh_Twitter')

