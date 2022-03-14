# Demosaicking Multispectral Images Based on Sphere Packing Filter Design

This repository contains the code to reproduce the results presented in the paper following paper:

*A. Alvarado, N. Diaz, P. Meza and E. Vera, "Demosaicking Multispectral Images Based on Sphere Packing Filter Design," in Optics Express, 2022.

This repository aims to design the coded apertures for multispectral demosaicking. The reconstruction is performed using the captured compressive projection using interpolation method.

## Usage

This code was written using Matlab R2020b. It should be downloaded the RollingShutterCodedAperture repository
1. Download this repository via git 
```
git clone https://github.com/nelson10/RollingShutterCodedAperture.git
```
2. To run the code use the function main.m that performs the sensing, and the reconstruction using interpolation
3. Or generateCodedAperture.m that computes the coded aperture using sphere packing approach.


## Datasets

The datasets could be download from the following [link](https://www1.cs.columbia.edu/CAVE/databases/multispectral/)

The files should be placed in the Dataset folder of this repository.



## Abstract

We propose an optimal distribution of spectral filter in a multispectral filter array (MSFA) according packing congruent spheres in a 3D-euclidean space that promotes uniformity in the sensing of the 3D-datacube.
