#pragma once

#include <array>
using std::array;

#include <vector>
using std::vector;

#include <utility>
using std::pair;
using std::tuple;

#include <string>
using std::string;

#include <iostream>
using std::cout;
using std::cin;
using std::cerr;
using std::endl;

#include <functional>
using std::function;

#if __cplusplus >= 202002L
#include <ranges>
using namespace std::ranges;
using std::begin, std::end;

#include <optional>
using std::optional, std::nullopt;

#include <variant>
using std::variant;
#endif
