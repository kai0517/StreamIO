#include "entry.h"
#include <iostream>

std::ostream& operator<<(std::ostream& os, Entry const& e)
{
    os << "{\"" << e.name << "\"," << e.number << '}';
    return os;
}

// The format of the structure 'Entry' is {"name",number}
std::istream& operator>>(std::istream& is, Entry& e)
{
    char ch1, ch2;
    if (is>>ch1 && ch1=='{' && is>>ch2 && ch2=='"') // start with a {"
    {
        std::string name;
        while (is.get(ch1) && ch1!='"')
        {
            name += ch1;
        }

        if (is>>ch1 && ch1==',')
        {
            int number = 0;
            if (is>>number>>ch1 && ch1=='}')
            {
                e = {name, number};
                return is;
            }
        }
    }
    is.setstate(std::ios_base::failbit);
    return is;
}

