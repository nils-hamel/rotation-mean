## Overview

This small _octave_ code implements a simple way of computing a pseudo-mean of a rotation matrix set. The definition of the mean of matrix being difficult, one can get around the problem by considering a rotation matrix as a rotation around a vector of a given angle. Doing so allows to give one definition of rotation mean : the mean is simply the rotation resulting of the mean of all vectors and angles of the set of matrix.

This solution is defined in the context of _structure from motion_ models merging. Usually, _point-based_ 3D models are merged using minimization techniques that try to reduce the distance between the points of the two models. In the case of _structure from motion_, the position and orientation of the cameras is known, which allows to have a common set of cameras that appear in both models. This allows to identify the relative orientation of the respective cameras to deduce the overall rotation that links the two separate models. As the set of common cameras usually contain more than one camera, the question of rotation averaging appears.

Note : this code is designed for _octave_ and could need adaptations to run on _MATLAB_.

## Usage

The following code shows an example of usage of the _octave_ code on a small set of similar rotation matrix :

```Matlab
% Be sure you have the linear-algebra package loaded
pkg load linear-algebra

% Add the path where rotation_mean.m file is located using the addpath function
% addpath('/some/path');

% Create list of rotation matrix
R_set{1} = [ 0.999624 -0.025387 -0.010381;
             0.025235  0.999576 -0.014530;
             0.010745  0.014263  0.999841 ];
R_set{2} = [ 0.999627 -0.025227 -0.010521;
             0.025070  0.999576 -0.014776;
             0.010889  0.014506  0.999835 ];
R_set{3} = [ 0.999635 -0.024961 -0.010352;
             0.024808  0.999583 -0.014740;
             0.010715  0.014478  0.999838 ];
R_set{4} = [ 0.999631 -0.025076 -0.010439;
             0.024921  0.999581 -0.014793;
             0.010806  0.014527  0.999836 ];

% Compute rotation mean
R_mean = rotation_mean( R_set )
```

The obtain output is :

```
R_mean =

   0.999629  -0.025160  -0.010422
   0.025005   0.999579  -0.014708
   0.010788   0.014442   0.999838
```

giving one possible average rotation of the rotation matrix set.

## Copyright and License

**rotation-mean** - Nils Hamel <br >
Copyright (c) 2020 DHLAB, EPFL

This program is licensed under the terms of the GNU GPLv3. Documentation and illustrations are licensed under the terms of the CC BY 4.0.

## Dependencies

The _rotation-mean_ comes with the following package dependencies (Ubuntu 16.04 LTS) :

* octave
* octave-linear-algebra
