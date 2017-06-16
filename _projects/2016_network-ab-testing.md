---
layout: project
title: Detecting Network Effects
subtitle: "Randomizing Over Randomized Experiments"
---
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

**Abstract.**
Randomized experiments, or A/B tests, are the standard approach for evaluating the causal effects of new product features, i.e., treatments.
The validity of these tests rests on the "stable unit treatment value assumption" (SUTVA), which implies that the treatment only affects the behavior of treated users, and does not affect the behavior of their connections.
Violations of SUTVA, common in features that exhibit network effects, result in inaccurate estimates of the causal effect of treatment.
<br/> &nbsp;&nbsp;&nbsp;&nbsp;
In this work, we propose a new experimental design for testing whether SUTVA holds, without making any assumptions on how treatment effects may spill over between the treatment and the control group.
To achieve this, we simultaneously run both a completely randomized and a cluster-based randomized experiment, and then we compare the difference of the resulting estimates. We present a statistical test for measuring the significance of this difference and offer theoretical bounds on the Type I error rate.
<br/> &nbsp;&nbsp;&nbsp;&nbsp;
We provide practical guidelines for implementing our methodology on large-scale experimentation platforms.
Importantly, the proposed methodology can be applied to settings in which a network is not necessarily observed but, if available, can be used in the analysis.
Finally, we deploy this design to LinkedIn's experimentation platform and apply it to two online experiments, highlighting the presence of network effects and bias in standard A/B testing approaches in a real-world setting.

This work is part of a two-paper series.
In the <a href="https://arxiv.org/abs/1704.01190" target="_blank">first paper</a> we introduce the methodology and main theoretical results and
in the <a href="{{ '/assets/publications/2017_detecting_network_effects/paper.pdf' | prepend: site.baseurl }}" target="_blank">second paper</a> we present implementation guidelines for using the methodology on large-scale experimentation platforms.

**Illustration of the proposed experimental design for detecting network effects.** <br/>
{%
	include image_with_caption.html
	url="/assets/projects/2016_network-ab/main.png"
	width="100%"
%}
**(A)** Graph of all units and the connections between them; the dashed circles represent (equally-sized) clusters. <br/>
**(B)** Assigning clusters to treatment arms: completely randomized (CR) and cluster-based randomized assignment (CBR). <br/>
**(C)** Assigning units to treatment buckets---treatment and control---using the corresponding strategy. <br/>
**(D)** Computing the treatment effect within each treatment arm: $$\hat \mu_{cr}$$ and $$\hat \mu_{cbr}$$, and variance: $$\hat \sigma^2_{cr}$$ and $$\hat \sigma^2_{cbr}$$. <br/>
**(E)** Computing the difference of the estimates from each treatment arm: $$\Delta = \hat \mu_{cr} - \hat \mu_{cbr}$$, and the total variance: $$\hat \sigma^2 = \hat \sigma^2_{cr} + \hat \sigma^2_{cbr}$$. <br/>

**Short video describing the work. Recorded for KDD'17.** <br/>
<iframe width="560" height="315" src="https://www.youtube.com/embed/E3yiKJCgLE4" frameborder="0" allowfullscreen></iframe>
