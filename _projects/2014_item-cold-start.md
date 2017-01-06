---
layout: project
title: Item Cold-start Recommendations
subtitle: Learning Local Collective Embeddings
---
Recommender systems suggest to users items that they might like (e.g., news articles, songs, movies) and, in doing so, they help users deal with information overload and enjoy a personalized experience. One of the main problems of these systems is the item cold-start, i.e., when a new item is introduced in the system and no past information is available, then no effective recommendations can be produced. The item cold-start is a very common problem in practice: modern online platforms have hundreds of new items published every day. To address this problem, we propose to learn *Local Collective Embeddings*: a matrix factorization that exploits items' properties and past user preferences while enforcing the manifold structure exhibited by the collective embeddings. We present a learning algorithm based on multiplicative update rules that are efficient and easy to implement. The experimental results on two item cold-start use cases: news recommendation and email recipient recommendation, demonstrate the effectiveness of this approach and show that it significantly outperforms six state-of-the-art methods for item cold-start.

**More details: [paper]({{ "/assets/publications/2014_item_cold_start/paper.pdf" | prepend: site.baseurl }}), [slides]({{"/assets/publications/2014_item_cold_start/slides.pdf" | prepend: site.baseurl}}).**

{% 
	include image_with_caption.html 
	url="/assets/projects/2014_item-cold-start/main.jpg" 
	description="The intuition behind learning collective embeddings using matrix factorization"
	width="100%" 
%}