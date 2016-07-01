#include <iostream>
#include "entry.h"

int main(void)
{
    for (Entry e; std::cin>>e;)
    {
        std::cout << e << '\n';
    }

#if defined(_MSC_VER)
    system("pause");
#else
    std::cout << "Press [Enter] to continue...";
    std::cin.get();
#endif
}
