cmake_minimum_required(VERSION 3.5)
project(PulseToolGui)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 COMPONENTS Widgets REQUIRED)

add_executable(pulsetool-gui
    main.cpp
    MainWindow.cpp
)

target_link_libraries(pulsetool-gui Qt5::Widgets)

