#include <iostream>
#include <chrono>

static long iterSum(long until)
{
    long total = 0;
    while (until)
        total += until--;
    return total;
}

static long recursSum(long until)
{
    if (until == 1)
        return 1;
    else
        return 1 + recursSum(until - 1);
}

int main(void) {
    long result = 0;
    auto iterStart = std::chrono::steady_clock::now();
    result = iterSum(150);
    auto iterEnd = std::chrono::steady_clock::now(); 
    auto iterNs = iterEnd - iterStart;
    
    auto recursStart = std::chrono::steady_clock::now();
    result = recursSum(150);
    auto recursEnd = std::chrono::steady_clock::now();
    auto recursNs = recursEnd - recursStart;
    
    std::cout << "la fonction itérative à pris " << iterNs.count()
              << " nanosecondes, la fonction récursive a pris " << recursNs.count()
              << " nanosecondes.\n";

    return 0;
}