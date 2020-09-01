cmake_minimum_required(VERSION 2.8.3)
project(omniwheel_control)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  geometry_msgs
)

add_message_files(FILES
  num.msg
  move_base.msg
)

generate_messages(DEPENDENCIES
  std_msgs
)

catkin_package(
  INCLUDE_DIRS src
  CATKIN_DEPENDS
  message_runtime roscpp geometry_msgs
)

include_directories(
  include ${catkin_INCLUDE_DIRS}${catkin_INCLUDE_DIRS})

add_executable(teleop_twist_keyboard src/teleop_twist_keyboard.cpp)
target_link_libraries(teleop_twist_keyboard ${catkin_LIBRARIES})



# add_executable(sub_test src/sub_test.cpp)
#add_dependencies(sub_test ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
# target_link_libraries(sub_test ${catkin_LIBRARIES})

set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")

add_executable(move_control
  src/move_control.cpp
)
add_dependencies(move_control ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(move_control
  ${catkin_LIBRARIES}
)

