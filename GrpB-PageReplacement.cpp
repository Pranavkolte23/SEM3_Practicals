#include <iostream>
#include <vector>
#include <unordered_map>
#include <list>
#include <queue>
#include <algorithm>
#include <climits>

using namespace std;

// Utility function to print the current state of memory
void printMemory(int p, const vector<int>& memory) {
    cout << "Accessing page: " << p;
    cout << " Memory State: ";
    for (int page : memory) {
        if (page == -1) {
            cout << "- ";  // Use '-' to represent an empty slot
        } else {
            cout << page << " ";
        }
    }
    cout << endl;
}

// Function to simulate LRU Page Replacement
void LRUPageReplacement(const vector<int>& pages, int capacity) {
    unordered_map<int, list<int>::iterator> pageMap;
    list<int> lruList;
    vector<int> memory(capacity, -1); // Initialize with -1 for empty slots
    int pageFaults = 0;

    for (int page : pages) {
        
        // Page hit
        if (pageMap.find(page) != pageMap.end()) {
            lruList.erase(pageMap[page]);
            lruList.push_front(page);
            pageMap[page] = lruList.begin();
        } else {
            // Page fault
            if (lruList.size() == capacity) {
                int lastPage = lruList.back();
                lruList.pop_back();
                pageMap.erase(lastPage);
            }
            lruList.push_front(page);
            pageMap[page] = lruList.begin();
            pageFaults++;
        }

        // Update memory state
        fill(memory.begin(), memory.end(), -1);
        int i = 0;
        for (int pageInMemory : lruList) {
            memory[i++] = pageInMemory;
        }
        printMemory(page, memory);
    }

    cout << "LRU Page Faults: " << pageFaults << endl;
}

// Function to simulate MRU Page Replacement
void MRUPageReplacement(const vector<int>& pages, int capacity) {
    unordered_map<int, list<int>::iterator> pageMap;
    list<int> mruList;
    vector<int> memory(capacity, -1); // Initialize with -1 for empty slots
    int pageFaults = 0;

    for (int page : pages) {

        // Page hit
        if (pageMap.find(page) != pageMap.end()) {
            mruList.erase(pageMap[page]);
            mruList.push_back(page);
            pageMap[page] = --mruList.end();
        } else {
            // Page fault
            if (mruList.size() == capacity) {
                int mostRecentPage = mruList.back();
                mruList.pop_back();
                pageMap.erase(mostRecentPage);
            }
            mruList.push_back(page);
            pageMap[page] = --mruList.end();
            pageFaults++;
        }

        // Update memory state
        fill(memory.begin(), memory.end(), -1);
        int i = 0;
        for (int pageInMemory : mruList) {
            memory[i++] = pageInMemory;
        }
        printMemory(page, memory);
    }

    cout << "MRU Page Faults: " << pageFaults << endl;
}

// Function to simulate FIFO Page Replacement
void FIFOPageReplacement(const vector<int>& pages, int capacity) {
    unordered_map<int, int> pageMap;
    queue<int> fifoQueue;
    vector<int> memory(capacity, -1); // Initialize with -1 for empty slots
    int pageFaults = 0;

    for (int page : pages) {

        // Page hit
        if (pageMap.find(page) != pageMap.end()) {
            // Page is already in memory, no action needed
        } else {
            // Page fault
            if (fifoQueue.size() == capacity) {
                int oldestPage = fifoQueue.front();
                fifoQueue.pop();
                pageMap.erase(oldestPage);
            }
            fifoQueue.push(page);
            pageMap[page] = page;
            pageFaults++;
        }

        // Update memory state
        fill(memory.begin(), memory.end(), -1);
        int i = 0;
        queue<int> tempQueue = fifoQueue; // Copy to iterate
        while (!tempQueue.empty()) {
            memory[i++] = tempQueue.front();
            tempQueue.pop();
        }
        printMemory(page, memory);
    }

    cout << "FIFO Page Faults: " << pageFaults << endl;
}

// Function to simulate Optimal Page Replacement
void OptimalPageReplacement(const vector<int>& pages, int capacity) {
    unordered_map<int, int> pageMap;
    vector<int> memory(capacity, -1); // Initialize with -1 for empty slots
    int pageFaults = 0;
    int i;

    for (i = 0; i < pages.size(); ++i) {
        int page = pages[i];

        // Page hit
        if (pageMap.find(page) != pageMap.end()) {
            // Page is already in memory, no action needed
        } else {
            // Page fault
            if (pageMap.size() == capacity) {
                // Find the optimal page to replace
                vector<int> nextUse(capacity, INT_MAX);
                for (const auto& [currentPage, index] : pageMap) {
                    auto pos = find(pages.begin() + i, pages.end(), currentPage);
                    if (pos != pages.end()) {
                        nextUse[index] = distance(pages.begin(), pos);
                    }
                }

                auto maxIter = max_element(nextUse.begin(), nextUse.end());
                int pageToReplace = distance(nextUse.begin(), maxIter);
                pageMap.erase(pageToReplace);
            }
            pageMap[page] = page;
            pageFaults++;
        }

        // Update memory state
        fill(memory.begin(), memory.end(), -1);
        int j = 0;
        for (const auto& kv : pageMap) {
            memory[j++] = kv.first;
        }
        printMemory(page, memory);
    }

    cout << "Optimal Page Faults: " << pageFaults << endl;
}

int main() {
    int numPages, capacity;

    cout << "Enter the number of pages: ";
    cin >> numPages;
    vector<int> pages(numPages);

    cout << "Enter the pages: ";
    for (int i = 0; i < numPages; ++i) {
        cin >> pages[i];
    }

    cout << "Enter the page size (capacity): ";
    cin >> capacity;

    cout << "LRU Algorithm:" << endl;
    LRUPageReplacement(pages, capacity);
    cout << endl;

    cout << "MRU Algorithm:" << endl;
    MRUPageReplacement(pages, capacity);
    cout << endl;

    cout << "FIFO Algorithm:" << endl;
    FIFOPageReplacement(pages, capacity);
    cout << endl;

    cout << "Optimal Algorithm:" << endl;
    OptimalPageReplacement(pages, capacity);
    cout << endl;

    return 0;
}
