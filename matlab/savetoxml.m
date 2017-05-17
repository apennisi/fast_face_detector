function varargout = savetoxml( detector, filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


fid = fopen(filename,'w');
%fprintf(fid, '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n');
fprintf(fid, '<classifier>\n');

opts = detector.opts;
pyramid = opts.pPyramid;

%**********************OPTS*************************%

fprintf(fid, '\t<opts>\n');

%%%%%%%%%%%%%%%%PYRAMID%%%%%%%%%%%%%%%%%%%%
fprintf(fid, '\t\t<pyramid>\n');
chns = pyramid.pChns;
%%%%%%%%%%%%%%%%CHNS%%%%%%%%%%%%%%%%%%%%
fprintf(fid, '\t\t\t<chns>\n');

fprintf(fid, '\t\t\t\t<shrink>%d</shrink>\n', chns.shrink);

fprintf(fid, '\t\t\t\t<color>\n');
fprintf(fid, '\t\t\t\t\t<enabled>%d</enabled>\n', chns.pColor.enabled);
fprintf(fid, '\t\t\t\t\t<smooth>%d</smooth>\n', chns.pColor.smooth);
fprintf(fid, '\t\t\t\t\t<colorspace>1</colorspace>\n');
fprintf(fid, '\t\t\t\t</color>\n');

fprintf(fid, '\t\t\t\t<gradmag>\n');
fprintf(fid, '\t\t\t\t\t<enabled>%d</enabled>\n', chns.pGradMag.enabled);
fprintf(fid, '\t\t\t\t\t<colorchn>%d</colorchn>\n', chns.pGradMag.colorChn);
fprintf(fid, '\t\t\t\t\t<normrad>%d</normrad>\n', chns.pGradMag.normRad);
fprintf(fid, '\t\t\t\t\t<normconst>%f</normconst>\n', chns.pGradMag.normConst);
fprintf(fid, '\t\t\t\t\t<full>%d</full>\n', chns.pGradMag.full);
fprintf(fid, '\t\t\t\t</gradmag>\n');

fprintf(fid, '\t\t\t\t<gradhist>\n');
fprintf(fid, '\t\t\t\t\t<enabled>%d</enabled>\n', chns.pGradHist.enabled);
fprintf(fid, '\t\t\t\t\t<binSize>\n');
for i=1:length(chns.pGradHist.binSize)
    fprintf(fid, '\t\t\t\t\t\t<value>%d</value>\n', chns.pGradHist.binSize(i));
end
fprintf(fid, '\t\t\t\t\t</binSize>\n');
fprintf(fid, '\t\t\t\t\t<orients>%d</orients>\n', chns.pGradHist.nOrients);
fprintf(fid, '\t\t\t\t\t<softbin>%d</softbin>\n', chns.pGradHist.softBin);
fprintf(fid, '\t\t\t\t\t<usehog>%d</usehog>\n', chns.pGradHist.useHog);
fprintf(fid, '\t\t\t\t\t<cliphog>%f</cliphog>\n', chns.pGradHist.clipHog);
fprintf(fid, '\t\t\t\t</gradhist>\n');

fprintf(fid, '\t\t\t\t<custom>\n');
for i=1:length(chns.pCustom)
    fprintf(fid, '\t\t\t\t\t<value>%d</value>\n', chns.pCustom(i));
end
fprintf(fid, '\t\t\t\t</custom>\n');

fprintf(fid, '\t\t\t\t<complete>%d</complete>\n', chns.complete);

fprintf(fid, '\t\t\t</chns>\n');
%%%%%%%%%%%%%%%%CHNS%%%%%%%%%%%%%%%%%%%%

fprintf(fid, '\t\t\t<peroct>%d</peroct>\n', pyramid.nPerOct);
fprintf(fid, '\t\t\t<octup>%d</octup>\n', pyramid.nOctUp);
fprintf(fid, '\t\t\t<approx>%d</approx>\n', pyramid.nApprox);

fprintf(fid, '\t\t\t<lambdas>\n');
for i=1:length(pyramid.lambdas)
    fprintf(fid, '\t\t\t\t<value>%f</value>\n', pyramid.lambdas(i));
end
fprintf(fid, '\t\t\t</lambdas>\n');

fprintf(fid, '\t\t\t<pad>\n');
for i=1:length(pyramid.pad)
    fprintf(fid, '\t\t\t\t<value>%d</value>\n', pyramid.pad(i));
end
fprintf(fid, '\t\t\t</pad>\n');

fprintf(fid, '\t\t\t<minds>\n');
fprintf(fid, '\t\t\t\t<height>%d</height>\n', pyramid.minDs(1));
fprintf(fid, '\t\t\t\t<width>%d</width>\n', pyramid.minDs(2));
fprintf(fid, '\t\t\t</minds>\n');

fprintf(fid, '\t\t\t<smooth>%d</smooth>\n', pyramid.smooth);
fprintf(fid, '\t\t\t<concat>%d</concat>\n', pyramid.concat);
fprintf(fid, '\t\t\t<complete>%d</complete>\n', pyramid.complete);

fprintf(fid, '\t\t</pyramid>\n');

%%%%%%%%%%%%%%%%PYRAMID%%%%%%%%%%%%%%%%%%%%

fprintf(fid, '\t\t<filters>\n');
for i=1:length(opts.filters)
    fprintf(fid, '\t\t\t<value>%f</value>\n', opts.filters(i));
end
fprintf(fid, '\t\t</filters>\n');

fprintf(fid, '\t\t<modelds>\n');
for i=1:length(opts.modelDs)
    fprintf(fid, '\t\t\t<value>%d</value>\n', opts.modelDs(i));
end
fprintf(fid, '\t\t</modelds>\n');

fprintf(fid, '\t\t<modeldspad>\n');
for i=1:length(opts.modelDsPad)
    fprintf(fid, '\t\t\t<value>%d</value>\n', opts.modelDsPad(i));
end
fprintf(fid, '\t\t</modeldspad>\n');

nms = opts.pNms;
fprintf(fid, '\t\t<nms>\n');
fprintf(fid, '\t\t\t<type>1</type>\n');
fprintf(fid, '\t\t\t<overlap>%f</overlap>\n', nms.overlap);
fprintf(fid, '\t\t\t<ovrdnm>1</ovrdnm>\n');
fprintf(fid, '\t\t</nms>\n');

fprintf(fid, '\t\t<stride>%d</stride>\n', opts.stride);
fprintf(fid, '\t\t<cascthr>%d</cascthr>\n', opts.cascThr);
fprintf(fid, '\t\t<casccal>%f</casccal>\n', opts.cascCal);

fprintf(fid, '\t\t<weak>\n');
for i=1:length(opts.nWeak)
    fprintf(fid, '\t\t\t<value>%d</value>\n', opts.nWeak(i));
end
fprintf(fid, '\t\t</weak>\n');

boost = opts.pBoost;
fprintf(fid, '\t\t<boost>\n');
fprintf(fid, '\t\t\t<tree>\n');
fprintf(fid, '\t\t\t\t<bins>%d</bins>\n', boost.pTree.nBins);
fprintf(fid, '\t\t\t\t<maxdepth>%d</maxdepth>\n', boost.pTree.maxDepth);
fprintf(fid, '\t\t\t\t<minweight>%f</minweight>\n', boost.pTree.minWeight);
fprintf(fid, '\t\t\t\t<fracftrs>%f</fracftrs>\n', boost.pTree.fracFtrs);
fprintf(fid, '\t\t\t\t<threads>%d</threads>\n', boost.pTree.nThreads);
fprintf(fid, '\t\t\t</tree>\n');
fprintf(fid, '\t\t\t<weak>%d</weak>\n', boost.nWeak);
fprintf(fid, '\t\t\t<discrete>%d</discrete>\n', boost.discrete);
fprintf(fid, '\t\t\t<verbose>%d</verbose>\n', boost.verbose);
fprintf(fid, '\t\t</boost>\n');

fprintf(fid, '\t\t<seed>%d</seed>\n', opts.seed);

fprintf(fid, '\t\t<squarify>\n');
fprintf(fid, '\t\t\t<height>%d</height>\n', opts.pLoad.squarify{1});
fprintf(fid, '\t\t\t<width>%d</width>\n', opts.pLoad.squarify{2});
fprintf(fid, '\t\t</squarify>\n');

fprintf(fid, '\t\t<pos>Inf</pos>\n');
fprintf(fid, '\t\t<neg>%d</neg>\n', opts.nNeg);
fprintf(fid, '\t\t<perneg>%d</perneg>\n', opts.nPerNeg);
fprintf(fid, '\t\t<accneg>%d</accneg>\n', opts.nAccNeg);

fprintf(fid, '\t\t<flip>%d</flip>\n', opts.pJitter.flip);

fprintf(fid, '\t\t<winssave>%d</winssave>\n', opts.winsSave);

fprintf(fid, '\t</opts>\n');

%**********************OPTS*************************%

%**********************CLF*************************%
fprintf(fid, '\t<clf>\n');
clf = detector.clf;
fprintf(fid, '\t\t<fids>\n');

fids = clf.fids;

for i = 1:size(fids, 1)
    fprintf(fid, '\t\t\t<values>');
    for j = 1:size(fids, 2)
        fprintf(fid, '%d', fids(i,j));
        if(j ~= size(fids, 2) )
            fprintf(fid, ' ');
        end
    end
    fprintf(fid, '</values>\n');
end
fprintf(fid, '\t\t</fids>\n');


fprintf(fid, '\t\t<thrs>\n');

thrs = clf.thrs;

for i = 1:size(thrs, 1)
    fprintf(fid, '\t\t\t<values>');
    for j = 1:size(thrs, 2)
        fprintf(fid, '%f', thrs(i,j));
        if(j ~= size(thrs, 2) )
            fprintf(fid, ' ');
        end
    end
    fprintf(fid, '</values>\n');
end
fprintf(fid, '\t\t</thrs>\n');



fprintf(fid, '\t\t<child>\n');

child = clf.child;

for i = 1:size(child, 1)
    fprintf(fid, '\t\t\t<values>');
    for j = 1:size(child, 2)
        fprintf(fid, '%d', child(i,j));
        if(j ~= size(child, 2) )
            fprintf(fid, ' ');
        end
    end
    fprintf(fid, '</values>\n');
end
fprintf(fid, '\t\t</child>\n');


fprintf(fid, '\t\t<hs>\n');

hs = clf.hs;

for i = 1:size(hs, 1)
    fprintf(fid, '\t\t\t<values>');
    for j = 1:size(hs, 2)
        fprintf(fid, '%f', hs(i,j));
        if(j ~= size(hs, 2) )
            fprintf(fid, ' ');
        end
    end
    fprintf(fid, '</values>\n');
end
fprintf(fid, '\t\t</hs>\n');


fprintf(fid, '\t\t<weights>\n');

weights = clf.weights;

for i = 1:size(weights, 1)
    fprintf(fid, '\t\t\t<values>');
    for j = 1:size(weights, 2)
        fprintf(fid, '%f', weights(i,j));
        if(j ~= size(weights, 2) )
            fprintf(fid, ' ');
        end
    end
    fprintf(fid, '</values>\n');
end
fprintf(fid, '\t\t</weights>\n');


fprintf(fid, '\t\t<depth>\n');

depth = clf.depth;

for i = 1:size(depth, 1)
    fprintf(fid, '\t\t\t<values>');
    for j = 1:size(depth, 2)
        fprintf(fid, '%d', depth(i,j));
        if(j ~= size(depth, 2) )
            fprintf(fid, ' ');
        end
    end
    fprintf(fid, '</values>\n');
end
fprintf(fid, '\t\t</depth>\n');


fprintf(fid, '\t\t<errs>\n');

errs = clf.errs;

for i = 1:size(errs, 1)
    fprintf(fid, '\t\t\t<values>');
    for j = 1:size(errs, 2)
        fprintf(fid, '%f', errs(i,j));
        if(j ~= size(errs, 2) )
            fprintf(fid, ' ');
        end
    end
    fprintf(fid, '</values>\n');
end
fprintf(fid, '\t\t</errs>\n');


fprintf(fid, '\t\t<losses>\n');

losses = clf.losses;

for i = 1:size(losses, 1)
    fprintf(fid, '\t\t\t<values>');
    for j = 1:size(losses, 2)
        fprintf(fid, '%f', losses(i,j));
        if(j ~= size(losses, 2) )
            fprintf(fid, ' ');
        end
    end
    fprintf(fid, '</values>\n');
end
fprintf(fid, '\t\t</losses>\n');

fprintf(fid, '\t\t<treedepth>%d</treedepth>\n', clf.treeDepth);


fprintf(fid, '\t</clf>\n');

%**********************CLF*************************%

fprintf(fid, '</classifier>\n');
fclose(fid);
end
