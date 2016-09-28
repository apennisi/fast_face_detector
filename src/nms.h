/*
 *  The FAST FACE DETECTOR (FFD)
 *  Copyright 2016 Andrea Pennisi
 *
 *  This file is part of AT and it is distributed under the terms of the
 *  GNU Lesser General Public License (Lesser GPL)
 *
 *
 *
 *  FFD is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  FFD is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with FFD.  If not, see <http://www.gnu.org/licenses/>.
 *
 *
 *  FFD has been written by Andrea Pennisi
 *
 *  Please, report suggestions/comments/bugs to
 *  andrea.pennisi@gmail.com
 *
 */


#ifndef _NMS_H_
#define _NMS_H_

#include "structs.h"
#include <omp.h>

namespace ffd
{
    class Nms
    {
        public:
            Nms() {;}
            Nms(const structs::Nms &_nms);
            void process(std::vector<cv::Rect> &bboxes, std::vector<float> &_confidences, const cv::Mat &_bbs);
        private:
            structs::Type m_type;
            int m_maxn;
            float m_thr;
            std::vector<float> m_radii;
            float m_overlap;
            int m_ovrDnm;
            int m_separate;
            cv::Mat m_bbs;
        private:
            void maxg(std::vector<cv::Rect> &_bboxes, std::vector<float> &_confidences);
    };
}

#endif
