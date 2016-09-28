# Fast Face Detector (FFD)
The fast face detector is based on the work "Aggregate channel features for multi-view face detection"[here](https://arxiv.org/abs/1407.4023) presented by Bin Yang, Junjie Yan, Zhen Lei and Stan Z. Li. My version extends the aforementioned one by adding a new channel: the integral image. This innovation makes the detector very robust with respect to the Viola Jones detector. During the next days, I will publish the comparison between the two detectors.

## REQUIREMENTS
* OpenCV
* OpenMP
* SSE
* Boost

## How to build

FPD works under Linux and Mac Os environments. I recommend a so-called out of source build which can be achieved by the following command sequence:

* mkdir build
* cd build
* cmake ../
* make -j<number-of-cores+1>

## How to use

###MATLAB - Training

1) Compile the cpp files by launching:
```matlab
compile_mex_files.m;
```

2) Launch the training file:
```matlab
train;
```

3) Create a folder _train_ and three subfolders, namely:
* posGt: containing 1 file for each positive image. Each file contains the coordinates of each face in the image in the following format: #x #y #w #h
* pos_jpg: containing the positive samples
* neg_jpg: containing the negative 

### C++

###C++ - Detection
Go to the bin diretory and launch the program with the following command:
```bash
./ffd ../detector/detector.xml /path/to/the/image.jpg
```

The detector is already trained with the complete AFW dataset[here](https://www.ics.uci.edu/~xzhu/face/). So, you can directly use the xml file inside the _detector_ folder.
