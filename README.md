# Multispectral mosaic design using a sphere packing filter array

This repository contains the code to reproduce the results presented in the paper following paper:

*N. Diaz, A. Alvarado, P. Meza, F. Guzman and E. Vera, "Multispectral Filter Array Design by Optimal Sphere Packing," in Transaction on Image Processing, 2023.

This repository aims to design the multispectral filter array using sphere packing approach. The reconstruction is performed using the captured compressive projection using interpolation method, demosaicking methods and methods based deep learning.

## Usage

This code was written using Matlab R2022a. It should be downloaded the DemosaickingMultispectral repository
1. Download this repository via git 
```
git clone https://github.com/nelson10/DemosaickingMultispectral.git
```
2. To run the code use the function main.m that performs the sensing, and the reconstruction using interpolation
3. Or generateCodedAperture.m that computes the coded aperture using sphere packing approach.


## Datasets

The datasets could be download from the following [link](https://www1.cs.columbia.edu/CAVE/databases/multispectral/)

The files should be placed in the Dataset folder of this repository.



## Abstract

Multispectral imaging collects a datacube of spatio-spectral information of a scene. Many acquisition methods for spectral imaging use scanning, preventing its widespread usage for dynamic scenes. On the other hand, the conventional color filter array (CFA) method often used to sample color images has also been extended to snapshot MSI using a Multispectral Filter Array (MSFA), which is a mosaic of selective spectral filters placed over the Focal Plane Array (FPA). However, even state-of-the-art MSFAs coding patterns produce artifacts and distortions in the reconstructed spectral images, which might be due to the non-optimal distribution of the spectral filters. To reduce the appearance of artifacts and provide tools for the optimal design of MSFAs, this paper proposes a novel mathematical framework to design MSFAs using a Sphere Packing (SP) approach. By assuming that each sampled filter can be represented by a sphere within the discrete datacube, SP organizes the position of the equal-size and disjoint spheres’s centers in a cubic container. Our method is denoted Multispectral Filter Array by Optimal Sphere Packing (MSFA-OSP), which seeks filter positions that maximize the minimum distance between the spheres’s centers. Simulation results show an image quality improvement of up to 2 dB and a remarkable boost in spectral similarity when using our proposed
MSFA design approach for a variety of reconstruction algorithms. Moreover, MSFA-OSP notably reduces the appearance of false colors and zipper effect artifacts, often seen when using state-of-the-art demosaicking algorithms. Experiments using synthetic and real data prove that the proposed MSFA-OSP outperforms state-of-the-art MSFAs in terms of spatial and spectral fidelity.
