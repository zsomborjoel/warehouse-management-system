Dim args, objExcel

Set args = wScript.Arguments
Set objExcel = CreateObject("Excel.Application") 

objExcel.workbooks.Open args(0)
objExcel.Run "DeleteRows"
objExcel.Activeworkbook.Save
objExcel.Activeworkbook.Close(0)
objExcel.Quit
