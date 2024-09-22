#include <bits/stdc++.h>
using namespace std;

class Table {
public:
    int idx = -1;
    string data = "";
    int address = -1;

    Table(int idx, string data) {
        this->idx = idx;
        this->data = data;
    }
    Table(int idx, string data, int address) {
        this->idx = idx;
        this->data = data;
        this->address = address;
    }
};

vector<string> intermediateCode;
vector<Table*> symbolTable;
vector<Table*> literalTable;
vector<int> poolTable;  // Added pool table
map<string, string> dp;

static int counter = 0;

class Utility {
public:
    static void printLine(vector<string> line) {
        for (string word : line) {
            cout << "-" << word << "-";
        }
        cout << endl;
    }

    static vector<string> split(string line) {
        vector<string> result;
        string word = "";
        for (char i : line) {
            if (i == ' ') {
                if (!word.empty()) {
                    result.push_back(word);
                    word = "";
                }
            } else {
                word += i;
            }
        }
        if (!word.empty()) {
            result.push_back(word);
        }
        return result;
    }

    static void prepareDp() {
        dp["STOP"] = "{IS, 00}";
        dp["ADD"] = "{IS, 01}";
        dp["SUB"] = "{IS, 02}";
        dp["MULT"] = "{IS, 03}";
        dp["MOVER"] = "{IS, 04}";
        dp["MOVEM"] = "{IS, 05}";
        dp["COMP"] = "{IS, 06}";
        dp["BC"] = "{IS, 07}";
        dp["DIV"] = "{IS, 08}";
        dp["READ"] = "{IS, 09}";
        dp["PRINT"] = "{IS, 10}";
        dp["START"] = "{AD, 01}";
        dp["END"] = "{AD, 02}";
        dp["ORIGIN"] = "{AD, 03}";
        dp["EQU"] = "{AD, 04}";
        dp["LTORG"] = "{AD, 05}";

        dp["DS"] = "{DL, 01}";
        dp["DC"] = "{DL, 02}";

        dp["AREG"] = "{REG, 1}";
        dp["BREG"] = "{REG, 2}";
        dp["CREG"] = "{REG, 3}";
        dp["DREG"] = "{REG, 4}";

        dp["LT"] = "{CC, 1}";
        dp["LE"] = "{CC, 2}";
        dp["EQ"] = "{CC, 3}";
        dp["GT"] = "{CC, 4}";
        dp["GE"] = "{CC, 5}";
        dp["ANY"] = "{CC, 6}";
    }

    static string getConstantString(string constant) {
        string start = "{C,";
        string end = "}";
        return start + constant + end;
    }

    static string addSymbol(string symbol) {
        for (Table* row : symbolTable) {
            if (row->data == symbol)
                return "{S, " + to_string(row->idx) + "}";
        }

        size_t pos = symbol.find('+');
    string baseSymbol = symbol;
    string additionalInfo = "";

    if (pos != string::npos) {
        baseSymbol = symbol.substr(0, pos); // Extract the base symbol
        additionalInfo = symbol.substr(pos); // Extract the additional info
    }

for (Table* row : symbolTable) {
        if (row->data == baseSymbol) {
        
            return "{S, " + to_string(row->idx) + "}" + additionalInfo;
        }
    }
        int idx = symbolTable.size();
        Table* row = new Table(idx, symbol);
        symbolTable.push_back(row);
        return "{S, " + to_string(idx) + "}";
    }

    static string addSymbol(string symbol, int address) {
        for (Table* row : symbolTable) {
            if (row->data == symbol) {
                row->address = address;
                return "{S, " + to_string(row->idx) + "}";
            }
        }
        int idx = symbolTable.size();
        Table* row = new Table(idx, symbol, address);
        symbolTable.push_back(row);
        return "{S, " + to_string(idx) + "}";
    }

    static bool isConstant(string data) {
        return data[0] >= '0' && data[0] <= '9';
    }

    static bool isSymbol(string word) {
        return ((word[0] >= 'a' && word[0] <= 'z') || (word[0] >= 'A' && word[0] <= 'Z'));
    }

    static string addLiteral(string literal) {
         if(poolTable.empty())
        {
            poolTable.push_back(0);
        }
        for (Table* row : literalTable) {
            if (row->data == literal)
                return "{L, " + to_string(row->idx) + "}";
        }
        int idx = literalTable.size();
        Table* row = new Table(idx, literal);
        literalTable.push_back(row);
        return "{L, " + to_string(idx) + "}";
       
    }

    static string handleLtorg() {
       string str="";
        int temp = counter;
        for (Table* row : literalTable) {
            if (row->address == -1) {
                row->address = temp;
                str += "(DL,01) (C,"+row->data+")";
                temp += 1;
            }
        }
        return str;
       
        
    }
    static void loadLiteral() {
       
        int temp = counter;
        for (Table* row : literalTable) {
            if (row->address == -1) {
                row->address = temp;
                temp += 1;
            }
        }
        
    }

    static void saveIntermediateCode() {
        fstream fout;
        fout.open("intermediate_code.txt", ios::out);
        for (string row : intermediateCode) {
            fout << row << endl;
        }
        fout.close();
    }

    static void saveLiteralTable() {
        fstream fout;
        fout.open("literal_table.txt", ios::out);
        for (Table* row : literalTable) {
            fout << row->idx << " " << row->data << " " << row->address << endl;
        }
        fout.close();
    }

    static void saveSymbolTable() {
        fstream fout;
        fout.open("symbol_table.txt", ios::out);
        for (Table* row : symbolTable) {
            fout << row->idx << " " << row->data << " " << row->address << endl;
        }
        fout.close();
    }

    static void savePoolTable() {
        fstream fout;
        fout.open("pool_table.txt", ios::out);
        for (int address : poolTable) {
            fout << address << endl;
        }
        fout.close();
    }
};

void handleLine(vector<string> line) {
    Utility::printLine(line);
    string currInter;

    if (line[0] == "START") {
        counter = stoi(line[1]);
        cout << "counter value set to " << counter << endl;
        currInter += dp[line[0]];
        currInter += " {C," + line[1] + "}";
        intermediateCode.push_back(currInter);
        return;
    }

    if (line[0] == "LTORG") {
      
       
        Utility::handleLtorg();
               
        
        counter += 1;
        return;
    }

    counter += 1;

    if (line.size() == 2) {
        currInter += dp[line[0]];
        currInter += Utility::addSymbol(line[1]);
        intermediateCode.push_back(currInter);
        return;
    }

    for (int i = 0; i < line.size(); i++) {
        string word = line[i];
        if (dp.find(word) != dp.end()) {
            currInter += dp[word];
            currInter += " ";
        } else if (Utility::isConstant(word)) {
            currInter += Utility::getConstantString(word);
            currInter += " ";
        } else if (Utility::isSymbol(word)) {
            if (i == 0) {
                Utility::addSymbol(word, counter);
            } else {
                currInter += Utility::addSymbol(word);
                currInter += " ";
            }
        } else {
            currInter += Utility::addLiteral(word);
            currInter += " ";
        }
    }

    intermediateCode.push_back(currInter);
}

int main() {
    ifstream inputFile;
   
    inputFile.open("input.txt", ios::in);
    Utility::prepareDp();

    string line;
    while (getline(inputFile, line)) {
        vector<string> words = Utility::split(line);
        handleLine(words);
    }
    
    
    Utility::loadLiteral();
    Utility::saveIntermediateCode();
    Utility::saveLiteralTable();
    Utility::saveSymbolTable();
    Utility::savePoolTable();  // Save pool table to file
}
