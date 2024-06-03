// g++ cpp_strbld.cpp -o ..\exe\cpp_strbld.exe
#include <chrono>
#include <fstream>
#include <iomanip>
#include <sstream>
#include <string>
#include <iostream>
#include <iomanip>
#include <ctime>

std::string format_time(uint64_t time_ms) {
    uint64_t milliseconds = time_ms % 1000;
    uint64_t seconds = (time_ms / 1000) % 60;
    uint64_t minutes = (time_ms / 1000) / 60;

    std::stringstream ss;
    ss << std::setw(2) << std::setfill('0') << minutes << ":"
       << std::setw(2) << std::setfill('0') << seconds << ":"
       << std::setw(2) << std::setfill('0') << milliseconds;

    return ss.str();
}

void test(int64_t num) {
    std::string s = "";
    std::cout << "  C++";
    auto start = std::chrono::high_resolution_clock::now();
    int64_t cnt = 0;

    for (int64_t i = 1; i <= num; ++i) {
        s += " C " + std::to_string(i);
        cnt += 1;
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    auto len = s.length();

    std::string s_time = format_time(elapsed);
    std::cout << "  " << s_time << " itr " << cnt << " len " << len << std::endl;

    std::string file_path = "out/cpp_output.txt";
    std::ofstream file(file_path);
    if (file.is_open()) {
        file << s;
        file.close();
    } else {
        std::cerr << "Error saving string to file: Unable to open file" << std::endl;
    }
}


int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <num>" << std::endl;
        return 1;
    }

    int64_t num = std::stoll(argv[1]);

    test(num);

    return 0;
}
