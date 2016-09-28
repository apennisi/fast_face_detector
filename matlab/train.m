% Face Detector based on the Piotr's Computer Vision Matlab Toolbox 
% 
% Created by Andrea Pennisi Copyright 2016
%
% Piotr's Computer Vision Matlab Toolbox      Version 3.40
% Copyright 2014 Piotr Dollar.  [pdollar-at-gmail.com]
% Licensed under the Simplified BSD License [see external/bsd.txt]

addpath('.');
addpath('ccp_files');

dataDir='data/aflw/';

if( ~exist(dataDir,'dir') )
    fprintf('Directory %s does not exist.\n', dataDir);
    return;
end

%% set up opts for training detector (see acfTrain)
opts=acfTrainIntegral(); 
opts.modelDs=[80 80]; 
opts.modelDsPad=[100, 100];
opts.posGtDir=[dataDir 'train/posGt']; 
opts.nWeak=[32 128 512 2048];
opts.posImgDir=[dataDir 'train/pos_jpg']; 
opts.pJitter=struct('flip',1);
opts.negImgDir=[dataDir 'train/neg_jpg']; 
opts.pBoost.pTree.fracFtrs=1/16;
opts.pLoad={'squarify',{3,.41}}; 
opts.name='models/big_data/AcfFaceDetector';

detector = acfTrainIntegral( opts );
filename = 'models/detector.xml';
isTrained = exist(filename,'file');
if( ~isTrained )
    savetoxml(detector, 'models/detector.xml');
end
