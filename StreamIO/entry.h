#pragma once
#include <string>
#include <iosfwd>

struct Entry
{
    std::string name;
    int         number;
};

std::ostream& operator<<(std::ostream& os, Entry const& e);
std::istream& operator>>(std::istream& is, Entry& e);

