#include <bits/stdc++.h>
using namespace std;

void leftFactoring(string nonTerminal, vector<string> productions) {
    // Find longest common prefix among productions
    string prefix = productions[0];
    for (int i = 1; i < productions.size(); i++) {
        string temp = "";
        for (int j = 0; j < min(prefix.size(), productions[i].size()); j++) {
            if (prefix[j] == productions[i][j])
                temp += prefix[j];
            else
                break;
        }
        prefix = temp;
    }

    if (prefix.empty()) {
        cout << "No left factoring needed for " << nonTerminal << endl;
        return;
    }

    cout << "Yes, left factoring needed\n";
    cout << "Common prefix: " << prefix << endl;

    string newNonTerminal = nonTerminal + "'";

    cout << "After left factoring:\n";
    cout << nonTerminal << " -> " << prefix << newNonTerminal << endl;
    cout << newNonTerminal << " -> ";

    bool first = true;
    for (auto &prod : productions) {
        string suffix = prod.substr(prefix.size());
        if (suffix.empty()) suffix = "epsilon";
        if (!first) cout << " | ";
        cout << suffix;
        first = false;
    }
    cout << endl;
}

int main() {
    string nonTerminal;
    int n;
    cout << "Enter Non-terminal (e.g., A): ";
    cin >> nonTerminal;
    cout << "Enter number of productions: ";
    cin >> n;

    vector<string> productions(n);
    cout << "Enter productions (e.g., ab or ac):\n";
    for (int i = 0; i < n; i++) {
        cout << nonTerminal << " -> ";
        cin >> productions[i];
    }

    leftFactoring(nonTerminal, productions);
    return 0;
}
