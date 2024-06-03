import datetime
import sys
from io import StringIO

def test(num):
    print("  Python", end = "")
    s = StringIO()
    start_time = datetime.datetime.now()
    num += 1
    for i in range(1, num):
        s.write(f" Y {i}")
      
    elapsed_time = datetime.datetime.now() - start_time
    
    minutes = elapsed_time.seconds // 60
    seconds = elapsed_time.seconds % 60
    milliseconds = elapsed_time.microseconds // 10000

    print(f"  {minutes}:{seconds}:{milliseconds} Itr {i} Len {len(s.getvalue())} ")
    
    file_path = "out/python_output.txt"
    
    try:
        with open(file_path, "w") as file:
            file.write(s.getvalue())
    except Exception as e:
        print(f"Error saving string to file: {e}")

arg = sys.argv[1]
num = int(arg)

test(num)


