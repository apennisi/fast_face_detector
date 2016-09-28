% Face Detector based on the Piotr's Computer Vision Matlab Toolbox 
% 
% Created by Andrea Pennisi Copyright 2016
%
% Piotr's Computer Vision Matlab Toolbox      Version 3.40
% Copyright 2014 Piotr Dollar.  [pdollar-at-gmail.com]
% Licensed under the Simplified BSD License [see external/bsd.txt]

%addpath('.');
addpath('ccp_files/');

load('models/big_data/AcfFaceDetector20x20Detector.mat');
opts = detector.opts;

pModify=struct('cascThr',-1,'cascCal',.01);
detector=acfModifyIntegral(detector,pModify);

%% run detector on a sample image (see acfDetect)
I = imread('/home/morpheus/Documents/MATLAB/data/afw/new-french-faces.jpg');
tic,
bbs=acfDetectIntegral(I,detector);
toc
figure(1);
im(I);
bbApply('draw',bbs);

