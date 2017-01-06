---
layout: project
title: Iterative Hybrid Algorithm
subtitle: Semi-supervided Machine Learning
---
In the typical supervised learning scenario we are given a set of labeled examples and we aim to induce a model that captures the regularity between the input and the class. However, most of the classification algorithms require hundreds or even thousands of labeled examples to achieve satisfactory performance. Data labels come at high costs as they require expert knowledge, while unlabeled data is usually cheap and easy to obtain. The aim of semi-supervised learning is to build models using both labeled and unlabeled data. In this study, we propose an Iterative Hybrid Algorithm which blends a generative and discriminative model with the goal to benefit from the advantages of both and to make most use of the unlabeled data. We conduct experiments on a synthetic data set, which allows us to easily observe the behavior of the method and compare its performance with two other methods, the Hybrid Model proposed and Entropy Minimization. We observe that when there are only few labeled examples, the Iterative Hybrid Algorithm achieves better performance than the Entropy Minimization method, but is outperformed by the Hybrid Model. However, as the number of labeled examples increases the difference between the two methods diminishes. The performance of the Entropy Minimization method is still behind the other two methods.

**More details:**
**[project report]({{ "/assets/publications/2014_joint_semi_supervised_learning/project-report.pdf" | prepend: site.baseurl }}),**
**[presentation]({{ "/assets/publications/2014_joint_semi_supervised_learning/project-presentation.pdf" | prepend: site.baseurl }}),**
**[journal paper]({{ "/assets/publications/2014_joint_semi_supervised_learning/paper.pdf" | prepend: site.baseurl }}).**

##### Summary
We propose an iterative algorithm for blending generative and discriminative models for semi-supervised learning. The main idea is to use the generative model to incorporate the additional information brought by the unlabeled data (*U*), and to use the discriminative model to achieve better classification accuracy. We also want to make sure that the two models are not far apart from one another by making constrains on their parameters.

Initially, we train a generative model only on the labeled data (*L*), and then we use this optimal solution as a starting position for training a generative model both on *L* and *U*. In the main loop of the algorithm, we train a discriminative model on *L*, constraining its values to be close to the ones of the generative model. Then, we label part of *U* and together with L, and we use it to train a generative model. We repeat this procedure a number of iterations or until convergence.

{% 
	include image_with_caption.html 
	url="/assets/projects/2013_iterative-hybrid-algorithm/chart.png" 
	description="The intuition behind the interative hybrid algorithm"
	width="100%" 
%}
