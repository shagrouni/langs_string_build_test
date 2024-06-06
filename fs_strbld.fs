// dotnet build --configuration Release fs_strbld.fsproj -o ..\exe

open System
open System.Text

let test (num: int64) =
    printf "  F#"
    let mutable s = new StringBuilder("")
    let mutable i = 0L
    let startTime = DateTime.Now

    for i in 1L .. num do
        s.Append(" F " + i.ToString()) |> ignore

    let elapsedTime = DateTime.Now - startTime
    let minutes = elapsedTime.Minutes
    let seconds = elapsedTime.Seconds
    let milliseconds = elapsedTime.Milliseconds

    let length = String.length(s.ToString())        

    
    printfn "  %02d:%02d:%03d Iter %d: Len %d " minutes seconds milliseconds i length 
    
    let filePath = "out/f#_output.txt"
    
    try
        use file = System.IO.File.CreateText(filePath)
        file.Write(s.ToString())
    with
        | ex -> printfn "Error saving string to file: %s" ex.Message

    ()


[<EntryPoint>]
let main argv =

    let _, num = Int64.TryParse(argv[0])
    test num
    0    


   