Attribute VB_Name = "Module_�����"
' *** �������� ����� �������� � ������� ***

' ��������� ���� � ������� ������ ������ �� ����� ����������� ����� (�� ������ ����� ��������)
' Templates\���������� ����� ������ (�������) 2.xlsx
Sub �����_���������_����_�������_������2()
Dim FileNewVar As String

  ' ��������� ���� �� ���� �� ����� ��������
  
  ' ������ �� ������������
  If MsgBox("������������ ��������� �� ���� ��� ������?", vbYesNo) = vbYes Then
      
    ' ��������� ������ C:\Users\proschaevsf\Documents\#DB_Result\Templates\���������� ����� ������ (�������) 2.xlsx
    fileTemplatesName = "���������� ����� ������ (�������) 2.xlsx"
    Workbooks.Open (ThisWorkbook.Path + "\Templates\" + fileTemplatesName)
           
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����8").Activate

    ' ���� ������������ - ���� ������� �����������, �� ��������� �� �������
    ' ���� ������� ���� ��� �����������, �� ��������� ����� �� �������
    If Weekday(CurrDate, vbMonday) = 1 Then
      dateReport = Date - 3
    Else
      dateReport = Date
    End If

    ' ��� ������ �����
    FileNewVar = "����������_�����_������_" + str��_MM_YYYY(dateReport) + ".xlsx"
    Workbooks(fileTemplatesName).SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileNewVar, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
    
    ' ������������ ����� � ����� (TemplateSheets)
    TS = "���������� �����"
    
    ' ������� ������� ���� ���������� ����� ������� ���� � ����������� �� ����� ������ Working_days_between_dateReports(In_dateReportStart, In_dateReportEnd, In_working_days_in_the_week) As Integer
    �������_�������_���� = Working_days_between_dates(dateReport - 1, Date_last_day_month(dateReport), 5)

    ' ���������
    Workbooks(FileNewVar).Sheets(TS).Range("A1").Value = "������� ��: " + CStr(dateReport) + " (���.���� " + CStr(�������_�������_����) + ")"

    ' ������ � ������� ������ ��� �������������
    strFileNewVar_Office = ""

    ' �������� �� �����8 � ��������� �����:
    For i = 1 To 5
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "�� ����������"
          Case 2 ' �� �����������
            officeNameInReport = "�� �����������"
          Case 3 ' �� ����������������
            officeNameInReport = "�� ����������������"
          Case 4 ' �� ����������������
            officeNameInReport = "�� ����������������"
          Case 5 ' �� ������-����
            officeNameInReport = "�� ������-����"
        End Select
        
        ' ���������
        Application.StatusBar = "������������ �� " + officeNameInReport
                
        ' ������� ������ ����� � ������
        row_TS = rowByValue(FileNewVar, TS, officeNameInReport, 100, 100)
        
        ' ������������ ������� � fileTemplatesName � �������������� �����������
        ColumnCount = 1
        Do While (ColumnCount <= 100)
          
          ' ���� ������� # � ������
          If InStr(Workbooks(FileNewVar).Sheets(TS).Cells(1, ColumnCount).Value, "#") <> 0 Then
            
            ' ������� ������� � ����� ������
            currProductName = Mid(Workbooks(FileNewVar).Sheets(TS).Cells(1, ColumnCount).Value, 2)
            
            ' ������� ������� ������� �� ����8 ��� �������� �����
            Row_����8 = getRowFromSheet8(officeNameInReport, currProductName)
            
            ' ������ ����� ���
            If Round(((ThisWorkbook.Sheets("����8").Cells(Row_����8, 9).Value - ThisWorkbook.Sheets("����8").Cells(Row_����8, 10).Value) / �������_�������_����), 0) > 0 Then
              Workbooks(FileNewVar).Sheets(TS).Cells(row_TS, ColumnCount).Value = Round(((ThisWorkbook.Sheets("����8").Cells(Row_����8, 9).Value - ThisWorkbook.Sheets("����8").Cells(Row_����8, 10).Value) / �������_�������_����), 0)
            Else
              Workbooks(FileNewVar).Sheets(TS).Cells(row_TS, ColumnCount).Value = 0
            End If

            ' ������ ������ �����
            Workbooks(FileNewVar).Sheets(TS).Cells(row_TS, ColumnCount).NumberFormat = "#,##0"
            
          End If ' ���� ������� # � ������
          
          ' ��������� �������
          ' Application.StatusBar = In_Product_Code + " " + In_officeNameInReport + ": " + CStr(rowCount) + "..."
          ColumnCount = ColumnCount + 1
          DoEventsInterval (ColumnCount)
        Loop
                
        ' ������ �������
        Application.StatusBar = "���������� " + officeNameInReport + "..."
                
        ' ���������� ���������
        ' Workbooks(FileNewVar).Save
        
        ' ���� ��������� - �������� � ��������� ����
        FileNewVar_Office = ThisWorkbook.Path + "\Out\����������_�����_" + cityOfficeNameByNumber(i) + "_" + str��_MM_YYYY(dateReport) + ".xlsx"
        Workbooks(FileNewVar).SaveCopyAs FileName:=FileNewVar_Office

        ' ������ � ������� ������ ��� �������������
        strFileNewVar_Office = strFileNewVar_Office + FileNewVar_Office + " "

        ' ��������� �� ���� DB
        ThisWorkbook.Sheets("����8").Activate

        ' ������ �������
        Application.StatusBar = ""

        
    Next i
    
    ' ��������� ����
    Workbooks(FileNewVar).Close SaveChanges:=True

    Application.StatusBar = "����������� ���� " + ThisWorkbook.Path + "\Out\" + FileNewVar

    Application.StatusBar = "�������� ������"

    ' ��������� ��������� ����� �����
    ' �������� Shell ("C:\Program Files\7-Zip\7z a -tzip -ssw -mx0 C:\Users\PROSCHAEVSF\Documents\#DB_Result\Out\�����.zip C:\Users\PROSCHAEVSF\Documents\#DB_Result\OUT\����������_�����_������_07-02-2021.xlsx C:\Users\PROSCHAEVSF\Documents\#DB_Result\Out\�����.zip C:\Users\PROSCHAEVSF\Documents\#DB_Result\OUT\����������_�����_�����-����_07-02-2021.xlsx")
    Shell ("C:\Program Files\7-Zip\7z a -tzip -ssw -mx9 C:\Users\PROSCHAEVSF\Documents\#DB_Result\Out\����������_�����_������_" + str��_MM_YYYY(dateReport) + ".zip " + strFileNewVar_Office)
    ' ��� ����� ������
    File7zipName = "����������_�����_������_" + str��_MM_YYYY(dateReport) + ".zip"

    Application.StatusBar = "����� ������!"

    MsgBox ("����������� ���� " + ThisWorkbook.Path + "\Out\" + FileNewVar + "!")

    ' �������� � ����� � �����
    ' Call ��������_Lotus_Notes_����_����_����8(ThisWorkbook.Path + "\Out\" + FileNewVar, DateReport)
    Call ��������_Lotus_Notes_����_����_����8(ThisWorkbook.Path + "\Out\" + File7zipName, dateReport)
      
    ' ������ �������
    Application.StatusBar = ""
      
  End If
  
End Sub

