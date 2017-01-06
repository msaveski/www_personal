---
layout: project
title: Fingerprint Verification System
---

<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>

This is system I developed as a class project for an introductory Image Processing course during the last year of my undergraduate studies.

The text below summarizes the main processing steps required for verifying if the fingerprint image belongs to a given person. All details are provided in the [project report]({{ "/assets/projects/2010_fingerprint-verification/report.pdf"  | prepend: site.baseurl }} ). Also, the slides I have prepared for [presentation]({{ "/assets/projects/2010_fingerprint-verification/slides.pdf" | prepend: site.baseurl }}) in class provide a good summary (slightly more detailed than what is given below).

#### Summary
The process consistis of the following steps:

- Fingerprint Segmentation
- Image Enhancement
	- Normalization
	- Orientation Estimation
	- Frequency Estimation
	- Filtering
- Binarization
- Skeletonization
- Feature Extraction (Minutiae)
- Fingerprint Matching

#### Fingerprint Segmentation
- Separates foreground from background regions
- Fingerprint regions have higher gray scale variance

{% 
	include image_with_caption.html 
	url="/assets/projects/2010_fingerprint-verification/segmentation.png" 
	description="Image Segmentation based on local variance thresholding" 
	width="100%" 
%}


#### Fingerprint Image Enhancement
The quality of ridge structure of the FP image is essential for successful feature extraction. In this project, we adopt the Gabor filter as it is both frequency and orientation selective. The filtering includes the following steps: (1) Normalization, (2) Orientation Estimation, (3) Ridge Frequency Estimation.

{% 
	include image_with_caption.html 
	url="/assets/projects/2010_fingerprint-verification/gabor.png" 
	description="Fingerprint Image Enhancement with Gabor Filter" 
	width="100%" 
%}


#### Binarization
Refers to the process of conversion from grayscale to binary images.  It is useful step as it improves the contrast between the ridges and valleys.

{% 
	include image_with_caption.html 
	url="/assets/projects/2010_fingerprint-verification/binarization.png" 
	description="Binarization based on global threshold" 
	width="100%" 
%}


#### Skeletonization
Thinning the foreground regions until one pixel wide.

{% 
	include image_with_caption.html 
	url="/assets/projects/2010_fingerprint-verification/skeletonization.png" 
	description="Skeletonization of a binariazed image" 
	width="100%" 
%}


#### Minutiae Extraction
Performed by using the concept of Crossing Number, CN:

$$CN(p) = \frac{1}{2} \sum_{i = 1 ... 8} |val(p_{i~mod~8}) - val(p_{i-1})|$$

All minutiae extracted by a simple image scan of the skeletonized image:
- CN = 1, correspond to ridge ending
- CN = 3, corresponds to bifurcation

This is illustrated in the following figure.

{% 
	include image_with_caption.html 
	url="/assets/projects/2010_fingerprint-verification/menitua-extraction.png" 
	description="Intuition behind the CN number (Maltoni et al., 2009)"
	width="100%" 
%}

All minutiae stored as ($$x$$, $$y$$, $$\theta$$ , $$CN$$) quadruples where — $$x$$, $$y$$: the spatial coordinates; $$\theta$$: orientation; $$CN$$: the Crossing Number.

{% 
	include image_with_caption.html 
	url="/assets/projects/2010_fingerprint-verification/men-extraction.png" 
	description="Minutiae detected on a skeletonized image"
	width="100%" 
%}


#### Fingerprint Matching
Determines the degree of similarity between two fingerprint images. Attempts to find the alignment of the images which will result in maximum number of minutiae pairings. Must cope with: displacement, rotation, non-linear distortion, noise.

The matching algorithm adopted consists of 3 steps:

1. Registration: finding the best transformation which when applied to the one of the images will result in maximum overlapping minutiae.
2. Minutiae Pairing: minutiae are paired if their difference in $$x$$, $$y$$, $$\theta$$ is within the range of the tolerance box.
3. Matching Score:

$$ MS(p, q) = \frac{m^2}{(n_p * n_q)} $$

$$m$$ – paired minutiae,
$$n$$ – minutiae within the bounding box.

