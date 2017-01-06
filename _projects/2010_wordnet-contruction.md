---
layout: project
title: Automatic Wordnet Construction
---
Wordnet is one of the most valuable lexical resources in the Natural Language Processing community. Unfortunately, the benefits of building a Wordnet for the Macedonian language have never been recognized. Due to the time and labor intensive process of manual building of such a lexical resource, we were inspired to develop a method for its automated construction. In this paper, we present a new method for construction of non-English Wordnets by using the Princeton implementation of Wordnet as a backbone for their construction along with Google’s translation tool and search engine. We applied the new method for construction of the Macedonian Wordnet and developed a Wordnet containing 17,553 words grouped into 33,276 synsets. However, the method in consideration is general and can also be applied for other languages. Finally, we report the results of an experiment using the Macedonian WordNet as a means to improve the performance of the text classification algorithms.

**More details: [paper]({{ "/assets/publications/2010_wordnet_construction/paper.pdf" | prepend: site.baseurl }}), [presentation]({{ "/assets/publications/2010_wordnet_construction/slides.pdf" | prepend: site.baseurl }}).**

(This is a work done as part of my B.Sc. thesis and later published at the Language Technologies conference in Ljubljana, Slovenia.)

{% 
	include image_with_caption.html 
	url="/assets/projects/2010_wordnet-construction/chart.jpg" 
	description="Using Google’s translation tool and search engine for building Wordnets" 
	width="100%" 
%}
