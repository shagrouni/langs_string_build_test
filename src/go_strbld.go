// go build -ldflags "-s -w" -o ..\exe\go_strbld.exe go_strbld.go
package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"
	"time"
)

func test(num int64) {
	fmt.Printf("  Go")
	var sb strings.Builder
	var i int64
	start := time.Now()

	for i = 1; i <= num; i++ {
		sb.WriteString(fmt.Sprintf(" G %d", i))
	}

	len := sb.Len()

	elapsed := time.Since(start)
	minutes := int(elapsed.Minutes())
	seconds := int(elapsed.Seconds()) % 60
	milliseconds := elapsed.Milliseconds() % 1000

	fmt.Printf("  %2d:%2d:%3d Itr %d  Len %d  \n", minutes, seconds, milliseconds, num, len)

	filePath := "out/go_output.txt"
	err := os.WriteFile(filePath, []byte(sb.String()), 0644)

	if err == nil {
	} else {
		fmt.Printf("Error saving string to file: %v\n", err)
	}

}

func main() {

	num, _ := strconv.ParseInt(os.Args[1], 10, 64)
	test(num)

}
