# Multispectral filter array by optimal sphere packing

This repository contains the code to reproduce the results presented in the paper following paper:

*Nelson Diaz, Alejandro Alvarado, Pablo Meza, Felipe Guzman and Esteban Vera, "Multispectral Filter Array Design by Optimal Sphere Packing," in IEEE Transactions on Image Processing, 2023. [link](https://ieeexplore.ieee.org/document/10163979)

This repository aims to design the multispectral filter array (MSFA) using sphere packing approach. The reconstruction is performed using the captured compressive projection and exploiting the MSFA using interpolation method, demosaicking methods and deep learning methods.

## Usage

This code was written using Matlab R2022a. It should be downloaded the DemosaickingMultispectral3DSpherePacking repository
1. Download this repository via git 
```
git clone https://github.com/nelson10/DemosaickingMultispectral3DSpherePacking.git
```
2. To run the code use the function MainFigures.m that performs the sensing, and the reconstruction using interpolation, demosaicking algorithms and deep learning.
3. Or MainFigures.m that computes the coded aperture using sphere packing approach.


## Datasets and run file

1. The datasets could be download from the following [link](https://www1.cs.columbia.edu/CAVE/databases/multispectral/)

2. The files should be placed in the [Dataset](https://www.dropbox.com/scl/fo/py43gsxzw3en6lx7wsu49/h?dl=0&rlkey=y3mzo8shvh456cjarxkqyzvrn), [Test](https://www.dropbox.com/scl/fo/kzwc41r53vmqa1fptbo3u/h?dl=0&rlkey=t9jtfllaor5lge6154oarrl82), and [Test1](https://www.dropbox.com/scl/fo/ko38byee2w2ng1tw314vy/h?dl=0&rlkey=b10ywu3or7scc8pmmpg6jtpnc) folder of this repository.

3. Run the MainFigures.m files, it computes the figures of the paper from figures 2 to 9. Moreover, 

## Abstract

Multispectral imaging collects a datacube of spatio-spectral information of a scene. Many acquisition methods for spectral imaging use scanning, preventing its widespread usage for dynamic scenes. On the other hand, the conventional color filter array (CFA) method often used to sample color images has also been extended to snapshot MSI using a Multispectral Filter Array (MSFA), which is a mosaic of selective spectral filters placed over the Focal Plane Array (FPA). However, even state-of-the-art MSFAs coding patterns produce artifacts and distortions in the reconstructed spectral images, which might be due to the non-optimal distribution of the spectral filters. To reduce the appearance of artifacts and provide tools for the optimal design of MSFAs, this paper proposes a novel mathematical framework to design MSFAs using a Sphere Packing (SP) approach. By assuming that each sampled filter can be represented by a sphere within the discrete datacube, SP organizes the position of the equal-size and disjoint spheres’s centers in a cubic container. Our method is denoted Multispectral Filter Array by Optimal Sphere Packing (MSFA-OSP), which seeks filter positions that maximize the minimum distance between the spheres’s centers. Simulation results show an image quality improvement of up to 2 dB and a remarkable boost in spectral similarity when using our proposed
MSFA design approach for a variety of reconstruction algorithms. Moreover, MSFA-OSP notably reduces the appearance of false colors and zipper effect artifacts, often seen when using state-of-the-art demosaicking algorithms. Experiments using synthetic and real data prove that the proposed MSFA-OSP outperforms state-of-the-art MSFAs in terms of spatial and spectral fidelity.


This repository reproduces figures 2-9.

<br/><img src='/figures/figure2.png'>

<br/><img src='/figures/figure3.png'>

<br/><img src='/figures/figure4.png'>

<br/><img src='/figures/figure5.png'>

<br/><img src='/figures/figure6.png'>

<br/><img src='/figures/figure7.png'>

<br/><img src='/figures/figure8.png'>

<br/><img src='/figures/figure9.png'>


