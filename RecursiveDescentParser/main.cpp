#include <iostream>
#include <string>
using namespace std;

string s;
int i = 0;
bool error = false;

void E();
void T();

void F() {
    if (s[i] == '(') {
        i++;
        E();
        if (s[i] == ')') i++;
        else error = true;
    }
    else if (s[i] == 'i' && s[i+1] == 'd') {
        i += 2;
    }
    else {
        error = true;
    }
}

void Tprime() {
    if (s[i] == '*') {
        i++;
        F();
        Tprime();
    }
}

void T() {
    F();
    Tprime();
}

void Eprime() {
    if (s[i] == '+') {
        i++;
        T();
        Eprime();
    }
}

void E() {
    T();
    Eprime();
}

int main() {
    cout << "Enter string: ";
    cin >> s;

    E();

    if (!error && i == s.length())
        cout << "Success\n";
    else
        cout << "Failure\n";

    return 0;
}