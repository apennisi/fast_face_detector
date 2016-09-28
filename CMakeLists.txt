project( fed )

cmake_minimum_required(VERSION 2.8)

set(CMAKE_CXX_FLAGS "-std=c++11")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse -msse2 -msse3")

find_package(OpenCV REQUIRED)

message(STATUS "OpenCV library status:")
message(STATUS "    version: ${OpenCV_VERSION}")
message(STATUS "    libraries: ${OpenCV_LIBS}")
message(STATUS "    include path: ${OpenCV_INCLUDE_DIRS}")

find_package(OpenMP)
if (OPENMP_FOUND)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()

find_package(Boost COMPONENTS filesystem regex)

set(EXECUTABLE_OUTPUT_PATH ../bin)

include_directories(${Boost_INCLUDE_DIRS} ${CMAKE_BINARY_DIR} src )

include_directories( ${OpenCV_INCLUDE_DIRS})

# Build type configuration.
if (CMAKE_BUILD_TYPE)
	string(TOUPPER ${CMAKE_BUILD_TYPE} _build_type)
	set(CMAKE_BUILD_TYPE ${_build_type} CACHE STRING "" FORCE)
endif (CMAKE_BUILD_TYPE)

# Build type must be either DEBUG or RELEASE.
if (CMAKE_BUILD_TYPE STREQUAL "")
	message("No build type specified: forcing to RELEASE.")
	set(CMAKE_BUILD_TYPE "RELEASE" CACHE STRING "" FORCE)
endif (CMAKE_BUILD_TYPE STREQUAL "")

if (CMAKE_BUILD_TYPE STREQUAL "DEBUG")
	add_definitions(-ggdb)
elseif (CMAKE_BUILD_TYPE STREQUAL "RELEASE")
	add_definitions(-O3)
else (CMAKE_BUILD_TYPE STREQUAL "DEBUG")
	message("Invalid build type specified: doing nothing.")
endif (CMAKE_BUILD_TYPE STREQUAL "DEBUG")

file(GLOB_RECURSE ffd_SRC "src/*.cpp")
add_executable( ffd ${ffd_SRC})
target_link_libraries( ffd ${Boost_LIBRARIES} ${OpenCV_LIBS})
