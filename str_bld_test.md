Evaluating Language Performance when Handling Extensive String Constructions
================================================================================

To investigate how different programming languages handle building large strings, I created nearly identical programs for each language. Each program constructs a string through a series of iterations, with each iteration appending a character representing the iteration number. The entire text is then saved to a file in one go.

Notes
------------

*   To accelerate the string building process, I utilized the string building feature available in each language or its equivalent. (In the C language, custom functions were implemented to simulate this feature.)
*   Only the time taken to generate the string is measured.
*   No initial capacity value was set for the string building.
*   The generated file is saved in a single batch without being divided into multiple chunks.
*   To ensure a fair comparison, I avoided using any optimization tricks or advanced features that could enhance the programs' performance, relying solely on the default language features.
*   The programs were created with the assistance of AI.

Please note that this is not a professional benchmarking test, but rather a humble attempt to explore the patterns of each language's capabilities and performance.

Languages Tested
----------------

*   Rust, rustc 1.77.1
*   Nim, 2.0.4
*   Julia, 1.10.3
*   Crystal, 1.12.1, LLVM: 18.1.1
*   D, gdc (crosstool-NG 1.20.0 - 20150413-2.066.1-f378f9ab41) 4.9.2
*   Go, 1.22.2
*   V, 0.4.6
*   Free Pascal, 3.2.2
*   C, clang 18.1.1
*   C++, clang 18.1.1
*   OCaml, 4.14.2
*   F#, 8.0: Dotnet 8.0.100
*   C#, 12.0: Dotnet 8.0.100
*   Red, 0.6.5
*   Python, 3.12.3
*   Dart, SDK 3.1.0
*   Java, OPENJDK VERSION "11.0.16.1"

Test Environment
-----------------

All tests are conducted on a computer with the following specifications:

*   Processor: 12th Gen Intel(R) Core(TM) i5-12500H 2.50 GHz
*   Memory: 16.0 GB
*   OS: Windows 11 Pro

Results
-------

The results are organized by iteration count and text size, with language performance metrics provided under each category.

### 50,000,000 iterations, 513 MB text size

| Language | Time |
| --- | --- |
| Java | 00:00:870 |
| C++ | 00:01:38 |
| C# | 00:01:45 |
| F# | 00:01:51 |
| Nim | 00:01:99 |
| C | 00:02:20 |
| Crystal | 00:02:80 |
| Go | 00:03:70 |
| D | 00:04:13 |
| Python | 00:04:16 |
| Free Pascal | 00:04:52 |
| Rust | 00:04:93 |
| Dart | 00:06:10 |
| V | 00:06:20 |
| Julia | 00:07:89 |
| OCaml | 00:08:85 |
| RED | 00:17:30 |

### 100,000,000 iterations, 1.01 GB text size

| Language | Time | Notes |
| --- | --- | --- |
| Java | 00:01:77 | Failed to save |
| C# | 00:02:89 | Failed to save |
| C++ | 00:02:95 |  |
| Nim | 00:03:89 |  |
| C | 00:04:41 |  |
| Crystal | 00:05:90 |  |
| Go | 00:07:51 |  |
| D | 00:08:34 |  |
| Python | 00:08:62 |  |
| Free Pascal | 00:09:08 |  |
| Rust | 00:09:90 |  |
| V | 00:13:30 |  |
| Dart | 00:13:68 |  |
| Julia | 00:15:47 |  |
| OCaml | 00:17:09 |  |
| &nbsp;&nbsp;&nbsp; F# |  | Failed |
| &nbsp;&nbsp;&nbsp; RED |  | Failed |

### 200,000,000 iterations, 2.13 GB text size

| Language | Time | Notes |
| --- | --- | --- |
| Nim | 00:08:37 | Failed to save |
| C | 00:09:92 |  |
| C++ | 00:13:00 |  |
| Python | 00:19:27 |  |
| Rust | 00:20:28 |  |
| D | 00:22:28 |  |
| Go | 00:25:51 |  |
| Julia | 00:31:27 |  |
| OCaml | 00:35:42 |  |
| Dart | 00:40:70 |  |
| &nbsp;&nbsp;&nbsp; Java |  | Failed |
| &nbsp;&nbsp;&nbsp; C# |  | Failed |
| &nbsp;&nbsp;&nbsp; Crystal |  | Failed |
| &nbsp;&nbsp;&nbsp; Free Pascal |  | Failed |
| &nbsp;&nbsp;&nbsp; V |  | Failed |

### 500,000,000 iterations, 5.48 GB text size

| Language | Time | Notes |
| --- | --- | --- |
| C | 00:21:21 | Failed to save |
| Nim | 00:21:22 | Failed to save |
| C++ | 00:37:538 |  |
| Python | 00:42:80 |  |
| Rust | 00:51:759 |  |
| D | 01:05:4 |  |
| Go | 01:07:53 |  |
| Julia | 01:16:79 |  |
| OCaml | 01:30:925 |  |
| Dart | 03:36:484 |  |

### 1000,000,000 iterations, 11.0 GB text size

| Language | Time | Notes |
| --- | --- | --- |
| C | 00:45:45 | Failed to save |
| C++ | 01:07:46 |  |
| Nim | 01:15:164 | Failed to save |
| Python | 01:41:46 |  |
| Rust | 02:01:3 |  |
| Julia | 02:58:553 |  |
| Go | 05:24:528 |  |
| &nbsp;&nbsp;&nbsp; D |  | Failed |
| &nbsp;&nbsp;&nbsp; OCaml |  | Failed |
| &nbsp;&nbsp;&nbsp; Dart |  | Failed |

### 1500,000,000 iterations, 17.1 GB text size

| Language | Time | Notes |
| --- | --- | --- |
| C | 02:14:134 | Failed to save |
| Nim | 02:29:30 | Failed to save |
| C++ | 02:44:174 |  |
| Python | 04:23:69 | Failed to save |
| Rust | 04:47:59 |  |
| Julia | 06:43:273 |  |
| Go | 13:25:161 |  |

### 2000,000,000 iterations, 23.1 GB text size

| Language | Time | Notes |
| --- | --- | --- |
| C | 02:30:15 | Failed to save |
| C++ | 03:16:36 |  |
| Nim | 04:44:49 | Failed to save |
| Rust | 06:36:783 |  |
| Julia | 10:14:19 |  |
| &nbsp;&nbsp;&nbsp; Go |  | Failed |
| &nbsp;&nbsp;&nbsp; Python |  | Failed |

### 2500,000,000 iterations, 29.2 GB text size

| Language | Time | Notes |
| --- | --- | --- |
| Nim | 05:19:25 | Failed to save |
| Rust | 08:16:706 |  |
| &nbsp;&nbsp;&nbsp; C++ |  | Failed |
| &nbsp;&nbsp;&nbsp; C |  | Failed |
| &nbsp;&nbsp;&nbsp; Julia |  | Failed |

### 3000,000,000 iterations

| Language | Notes |
| --- | --- |
| &nbsp;&nbsp;&nbsp; Nim | Failed |
| &nbsp;&nbsp;&nbsp; Rust | Failed |