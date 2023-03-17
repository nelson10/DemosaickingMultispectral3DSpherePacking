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

We propose an optimal distribution of spectral filter in a multispectral filter array (MSFA) according packing congruent spheres in a 3D-euclidean space that promotes uniformity in the sensing of the 3D-datacube.
