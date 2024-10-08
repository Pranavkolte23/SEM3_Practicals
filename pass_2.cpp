#include<bits/stdc++.h>
using namespace std;

vector<string> pass2Ouput;

vector<string> symbolTable;
vector<string> literalTable;


class Utils{
    public:
    static vector<string> splitSpace(string line)
        {

            vector<string> result;

            string word = "";

            for (char i : line)
            {

                if (i == ' ')
                {
                    result.push_back(word);
                    word = "";
                }
                else
                {
                    word += i;
                }
            }

            result.push_back(word);

            return result;
        }

    static vector<string> split(string line)
    {

        vector<string> result;

        string word = "";

        for (char i : line)
        {
           
            if(i == ' ') continue;
            word += i;

            if (i == '}')
            {
                result.push_back(word);
                word = "";
            }
            
        }

        result.push_back(word);

        return result;
    }

    static string extractInt(string word){

        string result = "";

        for(char ch: word){
            if(ch >= '0' && ch <= '9'){
                result += ch;
            }
        }
        return result;

    }

    static void saveSymbolTable(){

        fstream fin;
        fin.open("symbol_table.txt", ios::in);

        string line;
        while(getline(fin, line)){

            vector<string> myLine = Utils::splitSpace(line);
            symbolTable.push_back(myLine[2]);
        }
    }
   
    static void saveLiteralTable(){

        fstream fin;
        fin.open("literal_table.txt", ios::in);

        string line;
        while(getline(fin, line)){

            vector<string> myLine = Utils::splitSpace(line);
            literalTable.push_back(myLine[2]);
        }
    }

    static void saveMachineCode(){
        fstream fout;
        fout.open("machine_code.txt", ios::out);

        for(string row: pass2Ouput){
            fout << row << endl;
        }

        fout.close();
    }
};

void handleLine(vector<string> line, int len){

    string output;

    if(len == 1){
        return;
    }

    if(len == 2){

        //check if it is instruction statement
        if(line[0].substr(0, 3) == "{IS"){
            string data = "("+Utils::extractInt(line[0]) + ")";

            output += data;
            output += " ";
        }

        //if DL statements
        cout<<line[0].substr(0,6);
        if(line[0].substr(0, 6) == "{DL,01"){
            output += "(00) (0) (";
            output += line[1].at(3);
            output += ")";
            cout<<output<<endl;
             pass2Ouput.push_back(output);
            return;
        }
        if(line[0].substr(0,3) == "{DL")
            return;
        output += "(00)";

        if (line[1].substr(0, 2) == "{S"){
            int idx = stoi(Utils::extractInt(line[1]));
            output += "("+symbolTable[idx] +")";
        }

        if (line[1].substr(0, 2) == "{L")
        {
            int idx = stoi(Utils::extractInt(line[1]));
            output += "(" + literalTable[idx] + ")";
        }

        pass2Ouput.push_back(output);
        return;
    }

   // line with length 3
   string ouput = "";

   // check if it is instruction statement
   if (line[0].substr(0, 3) == "{IS")
   {
       string data = "(" + Utils::extractInt(line[0]) + ")";

       output += data;
       output += " ";
   }

   // check if it is register statement
   if (line[1].substr(0, 4) == "{REG")
   {
       string data = "(" + Utils::extractInt(line[1]) + ")";

       output += data;
       output += " ";
   }

   // check if it is CC
   if (line[1].substr(0, 3) == "{CC")
   {
       string data = "(" + Utils::extractInt(line[1]) + ")";

       output += data;
       output += " ";
   }

   if (line[2].substr(0, 2) == "{S")
   {
       int idx = stoi(Utils::extractInt(line[1]));
       output += "(" + symbolTable[idx] + ")";
   }

   if (line[2].substr(0, 2) == "{L")
   {
       int idx = stoi(Utils::extractInt(line[1]));
       output += "(" + literalTable[idx] + ")";
   }

   pass2Ouput.push_back(output);
   return;
}

int main(){

    fstream fin;
    fin.open("intermediate_code.txt", ios::in);
    //fin.open("temp.txt", ios::in);

    Utils::saveSymbolTable();
    Utils::saveLiteralTable();

    string line;

    //skip first line
    getline(fin, line);

    while(getline(fin, line)){
        vector<string> myLine = Utils::split(line);
        handleLine(myLine, myLine.size()-1);
    }

    Utils::saveMachineCode();
    

}