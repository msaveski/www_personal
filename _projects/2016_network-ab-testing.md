---
layout: project
title: Network A/B Testing
subtitle: "Testing for Network Effects"
---
Before rolling out new LinkedIn features—for example, a new way of ranking posts in the LinkedIn feed—it’s a common practice to compare the proposed changes against the current system. This is done through A/B testing: A is the current system and B is the new system we want to test. When members come on the website most of them will get the usual experience (A), but some will be exposed to the new feature (B). This allows us to measure and understand how the new feature influences the behavior of the members. At the core of this statistical comparison is the so-called independence assumption: the behavior of one member is not influenced by the behavior of others. In a platform such as LinkedIn this assumption is broken by design: members are linked through their connections and informed about each other’s behavior. This presents new challenges when applying the classical A/B testing practices. The goals of this project are: (i) to propose a new framework for A/B testing in networks, and (ii) apply it to test new LinkedIn features.

{% 
	include image_with_caption.html 
	url="/assets/projects/2016_network-ab/main.jpg" 
	description="The intuition behind using hierechical designs for testing network effects"
	width="75%" 
%}