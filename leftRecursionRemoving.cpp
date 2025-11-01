#include <bits/stdc++.h>
using namespace std;

void removeLeftRecursion(string nonTerminal, vector<string> productions) {
    vector<string> alpha; // for A -> Aα
    vector<string> beta;  // for A -> β
    for (auto &prod : productions) {
        if (prod[0] == nonTerminal[0])
            alpha.push_back(prod.substr(1));
        else
            beta.push_back(prod);
    }

    if (alpha.empty()) {
        cout << "No left recursion for " << nonTerminal << endl;
        return;
    }

    // New non-terminal
    string newNonTerminal = nonTerminal + "'";
    cout<<"Yes left recursion present\n";
    cout << "After removing left recursion:\n";
    cout << nonTerminal << " -> ";
    for (size_t i = 0; i < beta.size(); i++) {
        cout << beta[i] << newNonTerminal;
        if (i != beta.size() - 1) cout << " | ";
    }
    cout << "\n" << newNonTerminal << " -> ";
    for (size_t i = 0; i < alpha.size(); i++) {
        cout << alpha[i] << newNonTerminal << " | ";
    }
    cout << "e\n";
}

int main() {
    string nonTerminal;
    int n;
    cout << "Enter Non-terminal (e.g., A): ";
    cin >> nonTerminal;
    cout << "Enter number of productions: ";
    cin >> n;

    vector<string> productions(n);
    cout << "Enter productions (e.g., Aa or b):\n";
    for (int i = 0; i < n; i++) {
        cout << nonTerminal << " -> ";
        cin >> productions[i];
    }

    removeLeftRecursion(nonTerminal, productions);
    return 0;
}
