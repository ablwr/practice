def word_substituter(tweet)
  subs = {
  "hello" => 'hi',
  "Hello" => 'hi',
  "to" => '2',
  "two" => '2',
  "too" => '2',
  "four" =>'4',
  "for" => '4',
  "For" => '4',
  'be' => 'b',
  'you' => 'u',
  "at" => "@",
  "and" => "&"
  }

  subs.each do |key, value|
    tweet = tweet.gsub(/\b#{key}\b/, value)
  end
  tweet
end

def bulk_tweet_shortener(tweets)
  tweets.each do |x|
    puts word_substituter(x)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  selective_tweet_shortener(tweet)
  if tweet.length <= 140
    tweet
  else
    short = "#{tweet[0..136]}..."
    short
end
end


