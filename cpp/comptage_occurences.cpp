#include <iostream>
#include <cstring>
#include <algorithm>
#include <chrono>

struct RepeatedStr {
    static char* makeRepeat(const char* base, size_t baseSize, size_t factor)
    {
        size_t totalSize = factor * baseSize;
        char* newString = new char[totalSize];
        for (size_t i = 0; i < totalSize; i += baseSize) {
            std::copy(base, base + baseSize, newString + i);
        }
        return newString;
    }
    RepeatedStr(const char* literal, size_t factor): repeat(factor),
     pattern(literal),
     patternSize(std::strlen(pattern)),
     data(RepeatedStr::makeRepeat(pattern, patternSize, repeat))
     {}
    ~RepeatedStr() {
        delete[] data;
    }
    
    inline char operator[](size_t pos) { return data[pos]; }
    
    size_t size() const { return repeat * patternSize; }
    
    const char* pattern; 
    size_t repeat;
    size_t patternSize;
    char* data;
};

static size_t countPatternsTest(size_t factor)
{
    static const char* PATT = "$$$@";
    static const char* SPATT = "$$$";
    
    size_t total = 0;
    RepeatedStr s(PATT, factor);
    for (size_t i = 0; i < s.size() - 2 ; i++) {
        if (s[i] == SPATT[0] && s[i + 1] == SPATT[1] && s[i + 2] == SPATT[2])
            ++total;
    }
    return total;
}

int main(void) {
    size_t times = 20;
    size_t j = times + 1;
    double total = 0.0;
    while (--j) {
        auto countStart = std::chrono::steady_clock::now();
        countPatternsTest(50);
        auto countEnd = std::chrono::steady_clock::now();
        std::chrono::duration<double, std::milli> countDur = countEnd - countStart;
        total += countDur.count();
    }
    double averaged = total / 20.0;
    
    std::cout << "le test à été exécuté " << times << "fois avec une moyenne de "
              << averaged << " ms\n";
    return 0;
}