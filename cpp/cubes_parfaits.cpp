#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

int main() {
int max = 1500, lim;

 lim = cbrt(max);
  cout << "Cubes parfaits en bas de 1500" << endl;
     for(int i = 1; i <= lim; i++)
     {
     cout << i << " ^ 3  : " << setw(3) << setfill('0')
      << pow(i, 3) << endl;
        }
    }