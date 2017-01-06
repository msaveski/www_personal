---
layout: project
title: Sentiment Analysis of Financial Tweets
---


This is a work done during my stay at the Jozef Stefan Institute in Ljubljana (Slovenia) in the context of the European project FIRST: large-scale information extraction and integration infrastructure for supporting financial decision-making ([http://project-first.eu](http://project-first.eu)). The results were published in a workshop paper at ECML'11. More details can be found [here]({{ "/assets/publications/2011_active_learning/paper.pdf" | prepend: site.baseurl }}).

The objective was to develop a system for real-time monitoring of the stock market discussions on Twitter and analyzing their sentiment. Users have seen Twitter as a platform suitable for expressing opinions about stocks. Proof for this is the informal convention to use "$"" as a prefix to the stock symbol when referring to a stock. For instance, the "$GOOG" tag indicates that the tweet discusses the Google stocks or the "$AAPL" tag refers to the Apple stocks. This makes it easy to retrieve financial tweets for stocks of interest.

The system is composed of the following modules: Tweet Extractor, Language Detector, Near Duplicate Detector, Sentiment Classifier, and Active Learner.

{% 
	include image_with_caption.html 
	url="/assets/projects/2011_twitter-sentiment-analysis/chart.png" 
	description="Twitter Sentiment Analysis Pipeline"
	width="100%" 
%}

**Tweet Extractor.** Uses the Twitter Search API to extract tweets for stocks of interest.

**Language Detector.** Implements a custom *n-grams-based language detection model*. N-grams are n characters long sequences created by slicing up the text tokens. Using text corpora in several languages, we developed a profile – histogram of n-gram frequencies – for each language. To detect the language of a tweet, we count the n-gram occurrences and we find the profile that matches best. Tweets that do not match the English language profile are filtered-out.

**Near Duplicate Detector.** Implements a near-duplicate detection algorithm based on *shingling*. We represent each tweet as a set of 5-shingles, i.e., set of all 5-character sequences contained in the tweet, and compute the Jaccard similarity of the shingle sets. If this similarity is above a given threshold we consider the tweets as near-duplicates. By default, this method would require that each new tweet in the stream is compared to all the exiting tweets, which is unrealistic for the fast stream we have in this use case. To minimize the number of comparisons, we constantly keep an inverted index, which as keys has bi-grams (two word sequences) and as values has a set of tweets where the bi-gram is contained. Thus, when a new tweet arrives, we use the inverted index to retrieve a set of candidate near-duplicates and we only compare those to the tweet currently being processed.

**Sentiment Classifier.** We model the problem of sentiment analysis as a machine learning classification problem. We train an SVM classifier – initially using batch training and later we make online updates. Periodically, we retrain the model in batch mode to unsure the best performance.

**Active Learning.** The main challenge of developing an accurate sentiment classifier is the lack of annotated tweets. To address this issue we employ active learning: we allow the learning algorithm to choose the data from which it learns – out of a sample of unlabeled tweets – and thus to achieve better performance with less labeled instances. We use a combination of two techniques: active learning with SVMs and hierarchical sampling for active learning. Initially, to explore the clustering structure of the data, we perform KNN clustering and we select the medoids of each cluster for annotation. Next, we train a SVM classifier and we classify the unlabeled instances – tweets closest to the boundary are elected for annotation. The model is retrained after each annotation. We show empirically that using this strategy we need less annotations to train a more accurate classifier.

Users can interact with the system via a web interface – analyze the correlation between the sentiment and the stock prices over time, and examine representative tweets for a stock of interest, and annotate tweets. The video below show a demonstration of the system.

<iframe width="560" height="315" src="https://www.youtube.com/embed/U3suxjDmHQA" frameborder="0" allowfullscreen></iframe>

