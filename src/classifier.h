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


#ifndef CLASSIFIER_H
#define CLASSIFIER_H

#include <iostream>
#include <vector>
#include <fstream>
#include <limits>
#include <boost/tokenizer.hpp>
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/xml_parser.hpp>
#include <boost/foreach.hpp>
#include <boost/lexical_cast.hpp>

#include "utils.h"

namespace ffd
{
    class Classifier
    {
        public:
            Classifier() {;}
            ~Classifier() {;}
            Classifier &operator=(const Classifier& other);
            void load(const std::string &_filename);
        public:
            inline const ffd::structs::Cls cls() const
            {
                return m_cls;
            }
            inline const ffd::structs::Options opts() const
            {
                return m_opts;
            }
            void print()
            {
                m_opts.print();
                m_cls.print();
            }

        private:
            ffd::structs::Cls m_cls;
            ffd::structs::Options m_opts;
            std::ifstream file;
        private:
            boost::tokenizer< boost::char_separator<char> > parsingLine(const std::string &_line);
    };
}

#endif
