Attribute VB_Name = "Module_����"
' �������� ��������� �������� ����
Sub ��������_��������()
  
Dim FileProtocolName, str_����������������_��_��������, str_���������������_��_��������, str_�����������, �_���_Range, str_���������i, ���������_��_��������_Range, range_������_����������� As String
Dim �����������_��������_���, �����_�������, rowCount, �_���_Row, �_���_Column, �����_���������, ����������������������, i, ���������_��_��������_Row, ���������_��_��������_Column As Byte
Dim row_column_������_�����������, column_������_����������� As Byte

  ' �������� ��������� (�� �������)
  ' Workbooks.Open FileName:="C:\Users\������\Documents\#VBA\DB_Result\Templates\���������� 1. ��������.xlsx"
  ' ChDir "C:\Users\������\Documents\#VBA\DB_Result\Out"
  ' ActiveWorkbook.SaveAs FileName:="C:\Users\������\Documents\#VBA\DB_Result\Out\��������_��������.xlsx", FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False
  ' ActiveWindow.Close

  ' ������ �� ������������ ��������� ��������
  If MsgBox("������������ �������� ��������?", vbYesNo) = vbYes Then
    
    ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
    Workbooks.Open (ThisWorkbook.Path + "\Templates\���������� 1. ��������.xlsx")
         
    ' ��� ����� � ���������� - ����� �� G2 "10-02032020"
    FileProtocolName = "�������� _ ��� ���������_" + CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + ".xlsx"
    Workbooks("���������� 1. ��������.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileProtocolName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
    
    ' ����� ���������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C1:E2").Value = "�������� �������� �" + ThisWorkbook.Sheets("����").Range("G2").Value
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C1:G2").MergeCells = True
    ' ����������� ������ �������������� �������
    Workbooks(FileProtocolName).Sheets("��������_��������").Columns("H:H").ColumnWidth = 20.43  ' 20.43, 21.64-������
    Workbooks(FileProtocolName).Sheets("��������_��������").Columns("I:I").ColumnWidth = 3
    ' ����
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A4:C4").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A4:C4").VerticalAlignment = xlCenter
    ' Workbooks(FileProtocolName).Sheets("��������_��������").Range("D4:H4").Value = "������������ ���������-���� � ������������ ������ � ������� ���������� ��� �� ���������� ������ ������ ������ �� ���������� ������ � ���������� ������-����� �� ������� ������"
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D4:H4").Value = "������������ ���������-���� � ������������ ������ � ������� ���������� ��� �� ���������� ������ ������ ������ �� ���������� ������ � ���������� ������-����� �� ������ � " + strDDMM(weekStartDate(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value))) + " �� " + CStr(weekEndDate(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value))) + " �."
    ' ���� ����������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A5:C5").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A5:C5").VerticalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D5:H5").Value = CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + " �."
    ' ����� ����������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A6:C6").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A6:C6").VerticalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D6:H6").Value = "�.������, ��.��������� 51/1"
    ' ��������� ��������������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A7:B8").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A7:B8").VerticalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C7").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C7").VerticalAlignment = xlCenter
    str_����������������_��_�������� = ����������������_��_��������(1)
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D7:H7").Value = str_����������������_��_��������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D7:H7").WrapText = True
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("7:7").RowHeight = lineHeight(str_����������������_��_��������, 15, 60) ' ���� 50 - ����. 60 - �������� ������
        
    ' ��������� �������������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C8").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C8").VerticalAlignment = xlCenter
    str_���������������_��_�������� = ����������������_��_��������(0)
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D8:H8").Value = str_���������������_��_��������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D8:H8").WrapText = True
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("8:8").RowHeight = lineHeight(str_���������������_��_��������, 15, 60) ' ���� 40 - ����
    ' ����� � �����:
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A9:C9").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A9:C9").VerticalAlignment = xlCenter
    str_����������� = getFromAddrBook("��", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("�af", 1) + ", " + getFromAddrBook("����", 1)
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D9:H9").Value = str_�����������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D9:H9").WrapText = True
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("9:9").RowHeight = lineHeight(str_�����������, 15, 60) ' ���� 30 - ����
    
    ' �������� ���:
    �����������_��������_��� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)).Row
    rowCount = 2
    �����_������� = 0
    Do While ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 1).Value <> ""
      ' ���� � ������� ����� ������� "1", �� ������ ��� � �������� ��������
      If ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 14).Value = "1" Then
        
        �����_������� = �����_������� + 1
        
        ' ���� ����� ������� ����� 6-��, �� ��������� ������
        If �����_������� > 6 Then
          ' ��������� ������
          Workbooks(FileProtocolName).Sheets("��������_��������").Range(CStr(12 + �����_�������) + ":" + CStr(12 + �����_�������)).Select
          Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
          ' ��������� "7." �������� ������ ���� ������ ������������� � ���������� ("@")
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).NumberFormat = "@"
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).Value = CStr(�����_�������) + "."
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).HorizontalAlignment = xlLeft
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("B" + CStr(12 + �����_�������) + ":H" + CStr(12 + �����_�������)).MergeCells = True
          ' �����
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("A" + CStr(12 + �����_�������) + ":H" + CStr(12 + �����_�������)).Select
          With Selection.Borders(xlEdgeLeft)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
          With Selection.Borders(xlEdgeTop)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
          With Selection.Borders(xlEdgeBottom)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
          With Selection.Borders(xlEdgeRight)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
          With Selection.Borders(xlInsideVertical)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
        
        End If
        
        ' ������ ������ ������ �������� ���
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).HorizontalAlignment = xlCenter
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).VerticalAlignment = xlCenter
        ' ������ � �������� ���
        If ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 13).Value = "" Then
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).Value = ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 2).Value + ": " + ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).Value
        Else
          ' ���� ���� ������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).Value = ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 2).Value + ": " + ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).Value + " (" + ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 13).Value + ")"
        End If
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).HorizontalAlignment = xlLeft
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).VerticalAlignment = xlTop
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).WrapText = True
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).RowHeight = lineHeight(delSym(Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).Value), 15, 90) ' ���� 15, 65
      End If
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    
    ' ������������ ����� �������, ���� �� ����� 6 ��� ����, ����� ��������� ������������ ����� ����� � ����������
    If �����_������� < 6 Then
      �����_������� = 6
    End If
       
    ' ��������� ����������
    �����_��������� = 0
    For i = 1 To 5
      ' ������� ������� �_���i
      �_���_Range = RangeByValue(ThisWorkbook.Name, "����", "�_���" + CStr(i), 100, 100)
      �_���_Row = ThisWorkbook.Sheets("����").Range(�_���_Range).Row
      �_���_Column = ThisWorkbook.Sheets("����").Range(�_���_Range).Column
      ' ������������ ��������� �� �����, ��� ����� ����
      rowCount = �_���_Row + 1
      Do While ThisWorkbook.Sheets("����").Cells(rowCount, �_���_Column - 6).Value <> ""
        
        ' ���� � ���� ���� �� ����� (+ ���� ���� �� 0), �� ������� � ���������
        If (ThisWorkbook.Sheets("����").Cells(rowCount, �_���_Column + 1).Value <> "") And (ThisWorkbook.Sheets("����").Cells(rowCount, �_���_Column + 2).Value <> 0) Then
          ' ����� ���������
          �����_��������� = �����_��������� + 1
          ' ���� ����� ��������� ����� 6-��, �� ��������� ������
          If �����_��������� > 6 Then
            
            ' ��������� ������ ������ � ���� "���������"
            Workbooks(FileProtocolName).Sheets("��������_��������").Range(CStr(12 + �����_������� + 4 + �����_���������) + ":" + CStr(12 + �����_������� + 4 + �����_���������)).Select
            Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
            ' ��������� "7." �������� ������ ���� ������ ������������� � ���������� ("@")
            Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).NumberFormat = "@"
            Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).Value = CStr(�����_���������) + "."
            ' ���������� B, �, D
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("B" + CStr(12 + �����_������� + 4 + �����_���������) + ":D" + CStr(12 + �����_������� + 4 + �����_���������)).MergeCells = True
            ' ���������� G, �
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("G" + CStr(12 + �����_������� + 4 + �����_���������) + ":H" + CStr(12 + �����_������� + 4 + �����_���������)).MergeCells = True
            ' �����
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("A" + CStr(12 + �����_������� + 4 + �����_���������) + ":H" + CStr(12 + �����_������� + 4 + �����_���������)).Select
            With Selection.Borders(xlEdgeLeft)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeTop)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeBottom)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeRight)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlInsideVertical)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With

          End If ' ��������� ����� ������ ��������� � ��������
          
          ' ����� ��������� (� �/�) - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).HorizontalAlignment = xlCenter
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).VerticalAlignment = xlCenter

          ' ���������
          str_���������i = getNameOfficeByNumber(i) + ": " + ThisWorkbook.Sheets("����").Cells(rowCount, �_���_Column - 5).Value + " " + CStr(ThisWorkbook.Sheets("����").Cells(rowCount, �_���_Column + 2).Value) + " " + ThisWorkbook.Sheets("����").Cells(rowCount, �_���_Column + 3).Value
          
          ' ��������� - "���������� �� ������"
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("B" + CStr(12 + �����_������� + 4 + �����_���������) + ":D" + CStr(12 + �����_������� + 4 + �����_���������)).WrapText = True
          ' ��������� - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).HorizontalAlignment = xlLeft
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).VerticalAlignment = xlTop
          ' ��������� - ������ ������
          Workbooks(FileProtocolName).Sheets("��������_��������").Range(CStr(12 + �����_������� + 4 + �����_���������) + ":" + CStr(12 + �����_������� + 4 + �����_���������)).RowHeight = lineHeight(str_���������i, 15, 37) ' 20 - ����
          ' ��������� - ������ � ��������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).Value = str_���������i

          ' �������������
          ' ������� 1 - ��������� � ���
          ' Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).Value = ThisWorkbook.Sheets("����").Cells(�_���_Row - 1, �_���_Column - 4).Value + " " + ThisWorkbook.Sheets("����").Cells(�_���_Row - 1, �_���_Column - 3).Value
          ' ������� 2 - ���
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).Value = ThisWorkbook.Sheets("����").Cells(�_���_Row - 1, �_���_Column - 3).Value
          
          ' ������������� - "���������� �� ������"
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("E" + CStr(12 + �����_������� + 4 + �����_���������) + ":E" + CStr(12 + �����_������� + 4 + �����_���������)).WrapText = True
          ' ������������� - ������������ �� ��������� � �����������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).VerticalAlignment = xlTop
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).HorizontalAlignment = xlCenter
          
          ' ���� ����������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).Value = CStr(weekEndDate(CDate(ThisWorkbook.Sheets("����").Cells(rowCount, �_���_Column + 1).Value)))
          ' ���� ���������� - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).HorizontalAlignment = xlCenter
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).VerticalAlignment = xlTop
          
        End If
        ' ��������� ������
        DoEvents
        rowCount = rowCount + 1
      Loop ' Do While
      
    Next i ' ��������� ����
    
    ' ������� ���������� ���������� ���������� ��������� �� BASE\
    
    ' ��� ������� ��� ����������
    ���������������������� = (12 + �����_������� + 4 + �����_���������) + 2
    Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
    Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 2).Value = "����������� ��������� �� �������� ���������� �������"
    Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 7).Value = "������� �.�."
    ���������������������� = ���������������������� + 1
    Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
    ���������������������� = ���������������������� + 1
    Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
    
    ' � ���������� �����������: (�� ����������� �����) - ���������� �������������� � �������������
    Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 2).Value = "C ���������� ����������� (�� ����������� �����):"
    ' Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 2).Font.Underline = xlUnderlineStyleSingle
    ���������������������� = ���������������������� + 1
    Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
    '
    ���������_��_��������_Range = RangeByValue(ThisWorkbook.Name, "����", "���������_��_��������", 100, 100)
    ���������_��_��������_Row = ThisWorkbook.Sheets("����").Range(���������_��_��������_Range).Row
    ���������_��_��������_Column = ThisWorkbook.Sheets("����").Range(���������_��_��������_Range).Column
    
    rowCount = ���������_��_��������_Row + 1
    Do While ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column).Value <> "�����_��_��������"
      
      ' ���� ��� <>0
      If ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 1).Value <> 0 Then
        
        ' ���������_�_��� = ThisWorkbook.Sheets("����").Cells(RowCount, ���������_��_��������_Column + 4).Value + " " + �������_�_���(ThisWorkbook.Sheets("����").Cells(RowCount, ���������_��_��������_Column + 1).Value, 3)
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 2).Value = ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 4).Value
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 6).Value = �������_�_���(ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 1).Value, 3)
        ���������������������� = ���������������������� + 1
        Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
      
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
 
    ' ��������� ������ ��� �������� (� "������ �����������:"):
    range_������_����������� = RangeByValue(ThisWorkbook.Name, "����", "������ �����������:", 100, 100)
    row_������_����������� = ThisWorkbook.Sheets("����").Range(range_������_�����������).Row
    column_������_����������� = ThisWorkbook.Sheets("����").Range(range_������_�����������).Column
    '
    ThisWorkbook.Sheets("����").Cells(row_������_�����������, column_������_����������� + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���", 2)
    ThisWorkbook.Sheets("����").Cells(row_������_�����������, column_������_����������� + 3).Value = " "
    
    ' ���������� � ������ A1
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A1").Select
    
    ' �������� ����� � ���������� ��������
    Workbooks(FileProtocolName).Close SaveChanges:=True
    
    ' ����������� ���� ������
    ThisWorkbook.Sheets("����").Cells(1, 17).Value = "��������� ���: �������� ���������-����� � ������� �" + ThisWorkbook.Sheets("����").Cells(2, 7).Value + " �� " + CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + " �."
    
    ' ����������� ���� � ������ 1 � 2 �� ����� ����
    ThisWorkbook.Sheets("����").Cells(1, 15).Value = "#protocol"
    ThisWorkbook.Sheets("����").Cells(3, 15).Value = "#protocol_" + ThisWorkbook.Sheets("����").Cells(2, 7).Value
   
    MsgBox ("�������� �����������!")
    
  End If ' ������ �� ������������
  
End Sub

' ����� ����� ��������� �������� (��������� � ����� ��������)
Sub �����_�����_���������_��������()
Dim �����������_��������_���, rowCount, �����_�������, row_��������_���, column_��������_��� As Byte

  ' ������ �� ������������ ������ ��������� ��������
  If MsgBox("��������� �������� � ��������� � �����?", vbYesNo) = vbYes Then
    
    ' 1. ����������� ����� ���������: ��������� ��� � BASE\?
    ' OpenBookInBase InsertRecordInBook CloseBook
    ' 1.1. ����������� � BASE\Protocols
    Application.StatusBar = "����������� ������: Protocols ..."
    ' ��������� BASE\Protocols
    OpenBookInBase ("Protocols")
    ThisWorkbook.Activate
    
    ' ��������� ��������
    Call InsertRecordInBook("Protocols", "����1", "Protocol", ThisWorkbook.Sheets("����").Range("G2").Value, _
                                            "Date", dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value), _
                                              "Protocol", ThisWorkbook.Sheets("����").Range("G2").Value, _
                                                "Theme", "������������ ���������-���� � ������������ ������ � ������� ���������� ��� �� ���������� ������ ������ ������ �� ���������� ������ � ���������� ������-����� �� ������� ������", _
                                                  "Place", "�.������, ��.��������� 51/1", _
                                                    "Participants", ����������������_��_��������(1), _
                                                      "Lack", ����������������_��_��������(0), _
                                                        "Copy_to", getFromAddrBook("���", 1), _
                                                          "", "", _
                                                            "", "", _
                                                              "", "", _
                                                                "", "", _
                                                                  "", "", _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")

    
    ' 1.2. ����������� � BASE\Themes
    Application.StatusBar = "����������� ������: Themes ..."
    ' ��������� BASE\Themes
    OpenBookInBase ("Themes")
    ThisWorkbook.Activate
        
    �����������_��������_��� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)).Row
    rowCount = 2
    Do While ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 1).Value <> ""
      
      ' ���� � ������� ����� ������� "1", �� ������ �� ��� �������� � ��������� � �����. ���� ����� 0, �� ��������� ��� ���������� ��������
      If ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 14).Value = "1" Then
        
        ' ��������� ���� �����������
        Call InsertRecordInBook("Themes", "����1", "Number_Theme", ThisWorkbook.Sheets("����").Range("G2").Value + "-" + CStr(ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 1).Value), _
                                            "Date", dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value), _
                                              "Protocol", ThisWorkbook.Sheets("����").Range("G2").Value, _
                                                "Number_Theme", ThisWorkbook.Sheets("����").Range("G2").Value + "-" + CStr(ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 1).Value), _
                                                  "Speker", ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 2).Value, _
                                                    "Theme", ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).Value, _
                                                      "HashTag", ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 13).Value, _
                                                        "Action", ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 14).Value, _
                                                          "", "", _
                                                            "", "", _
                                                              "", "", _
                                                                "", "", _
                                                                  "", "", _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")

      End If ' ���� � ������� ����� 1
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
        
    ' 1.3. ����������� � BASE\Tasks
    ' Application.StatusBar = "����������� ������: Tasks ..."
    ' ��������� BASE\Tasks
    ' OpenBookInBase ("Tasks")
        
    ' ����� ���������� ������
        
    ' ��������� 3 �������
    CloseBook ("Protocols")
    CloseBook ("Themes")
    ' CloseBook ("Tasks")
                
    ' 2. ����� ����� ��������� � G2 ��������:   10-02032020
    ' 3. ����� ����� ������ � J2 ������: 10
    ' 4. ���������_��_�������� - ��������� ���� 0
    ' 5. �����_��_�������� - ���������� ���� 0
    
    ' 6. ��������_��� - �������� ��� ������, ������� ���� ���������� � ����� � ��������� 1, ������ � 0 ��������� ��� ���������
    Application.StatusBar = "������� ������ ��������..."
    
    row_��������_��� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)).Row
    column_��������_��� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)).Column
    rowCount = 2
    Do While ThisWorkbook.Sheets("����").Cells(row_��������_��� + rowCount, column_��������_���).Value <> ""
    
      ' ���� ������� = "1"
      If ThisWorkbook.Sheets("����").Cells(row_��������_��� + rowCount, column_��������_��� + 12).Value = "1" Then
        
        ' �����
        ThisWorkbook.Sheets("����").Cells(row_��������_��� + rowCount, column_��������_��� - 1).Value = ""
        ' �����������:
        ThisWorkbook.Sheets("����").Cells(row_��������_��� + rowCount, column_��������_���).Value = ""
        ' ����:
        ThisWorkbook.Sheets("����").Cells(row_��������_��� + rowCount, column_��������_��� + 1).Value = ""
        ' HashTag
        ThisWorkbook.Sheets("����").Cells(row_��������_��� + rowCount, column_��������_��� + 11).Value = ""
        ' �������
        ThisWorkbook.Sheets("����").Cells(row_��������_��� + rowCount, column_��������_��� + 12).Value = ""
      
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    
    Application.StatusBar = ""
    
    ' 7. �������� ���������_����������
    Application.StatusBar = "������� ������ ��������� ����������..."
    
    row_���������_���������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)).Row
    column_���������_���������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)).Column
    
    ' ������� ������
    CountError = 0

    rowCount = 2
    Do While ThisWorkbook.Sheets("����").Cells(row_���������_���������� + rowCount, column_���������_���������� + 2).Value <> ""
    
      ' ���� ������� = "1"
      If ThisWorkbook.Sheets("����").Cells(row_���������_���������� + rowCount, column_���������_���������� + 13).Value = "1" Then
        
        ' �����
        ThisWorkbook.Sheets("����").Cells(row_���������_���������� + rowCount, column_���������_���������� - 1).Value = ""
        ' �������������:
        ThisWorkbook.Sheets("����").Cells(row_���������_���������� + rowCount, column_���������_����������).Value = ""
        ' ����:
        ThisWorkbook.Sheets("����").Cells(row_���������_���������� + rowCount, column_���������_���������� + 1).Value = ""
        ' ���������� ���������:
        ThisWorkbook.Sheets("����").Cells(row_���������_���������� + rowCount, column_���������_���������� + 2).Value = ""
        ' ������� ���������� "� To-Do"
        ThisWorkbook.Sheets("����").Cells(row_���������_���������� + rowCount, column_���������_���������� + 13).Value = ""
      
      End If
      
      ' ���� ���� ������� = "0"
      If ThisWorkbook.Sheets("����").Cells(row_���������_���������� + rowCount, column_���������_���������� + 13).Value = "0" Then
        ' ������� ������
        CountError = CountError + 1
      End If
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    
    ' ��������� ��������� �� ������� ������
    If CountError <> 0 Then
      MsgBox ("��������! " + CStr(CountError) + " ��������� �� ���������� � To-Do!")
    End If
    
    Application.StatusBar = ""
    
    ' �����������: "��������� � ����� �������� ��������"
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� � ����� �������� ��������", 100, 100))
    
    ' ������ �������
    Application.StatusBar = ""
    
    MsgBox ("�������� � ��������� ���������� � �����!")
  
  End If
End Sub

' ��������� �������� ��������
Sub sendProtocol()
  ' ������ �� ������������ ������ ��������� ��������
  If MsgBox("��������� �������� ��������?", vbYesNo) = vbYes Then
    
    ' ��������� � Lotus Notes
    ' ������ �������
    Application.StatusBar = "�������� ��������� ���������� � Lotus Notes ..."
    
    ' ������ �������
    Application.StatusBar = ""
    
    MsgBox ("�������� ��������� � Lotus Notes!")
    ' ����������� � ������� ����
    ' ������ �������
    Application.StatusBar = "����������� ��������� � ������� ���� ..."
    
    ' ������ �������
    Application.StatusBar = ""
    MsgBox ("�������� ���������� � ������� ����!")
  End If
End Sub


' ���������� ������
Sub InsertRow_InProtocol(In_FileProtocolName, In_Sheets, In_RowNumber)
  
  ' ��������� ������ ������ � ���� "���������"
  Workbooks(In_FileProtocolName).Sheets(In_Sheets).Range(CStr(In_RowNumber) + ":" + CStr(In_RowNumber)).Select
  Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
              
End Sub

' ����: ���������� ������ �������� �� ����� � ������� �������� �� 1 �� ...
Sub createNumberingThemes()
Dim �����������_��������_���, rowCount As Byte

  �����������_��������_��� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)).Row
  rowCount = 2
  Do While ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).Value <> ""
    
    ' ���������
    ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 1).Value = (rowCount - 1)
    
    ' ������� ��������� "���������� �� ������"
    ' ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).HorizontalAlignment = xlGeneral
    ' ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).VerticalAlignment = xlBottom
    ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).WrapText = False
    ' ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).Orientation = 0
    ' ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).AddIndent = False
    ' ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).IndentLevel = 0
    ' ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).ShrinkToFit = False
    ' ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).ReadingOrder = xlContext
    ' ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).MergeCells = False
    
    ' ��������� ������
    rowCount = rowCount + 1
  Loop

End Sub

' ����: ���������� ������ �������� �� ����� � ������� ��������� �� 1 �� ...
Sub createNumberingTask()
Dim �����������_���������_����������, rowCount As Byte

  �����������_���������_���������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)).Row
  rowCount = 2
  Do While ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, 19).Value <> ""
    ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, 18).Value = (rowCount - 1)
    ' ��������� ������
    rowCount = rowCount + 1
  Loop

End Sub


' ��������� � ���� ����� ��������� ������ � CSMP (common standards for management procedures)
Sub changeWeekNumberInCSMP()
Dim currentOperDate As Date
Dim i, Range_Row, Range_Row2, Range_Column, Range_Column2, row_���������_��_��������, column_���������_��_�������� As Byte
Dim ������������_������, ������������_��, ������������_��_������ As Double
Dim rowCount, ������������_��, ������������_�� As Integer
Dim �����_���������_�������_������, Range_str, Range_str2 As String

  ' ������� ������������ ���� �� ����� ������ - ������ ����������� �� ������ + 1
  ' currentOperDate = Date
  currentOperDate = MondayDateByWeekNumber(�������������N("����") + 1, Year(Date))
  
  ' ��������� ������ �� ����� � ������� ������
  If �������������N("����") < WeekNumber(currentOperDate) Then
  
    ' ������ �� ������������ ������ ��������� ��������
    If MsgBox("������� ����� ������?", vbYesNo) = vbYes Then
    
      ' ������ �������
      Application.StatusBar = "�������� ����� ������ ..."
    
      ' �������� ������� ������
      �����_���������_�������_������ = ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "��������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����", "��������:", 100, 100) + 1).Value
      
      ' ��������� BASE\Tasks
      OpenBookInBase ("Tasks")

      ' ������: � 01.01 �� 07.01.2020 �. (���� "������ ������� �������������� ��������")
      ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "������ ������� �������������� ��������", 100, 100) + 1, ColumnByValue(ThisWorkbook.Name, "����", "������ ������� �������������� ��������", 100, 100)).Value = "������: � " + CStr(weekStartDate(currentOperDate)) + " �� " + CStr(weekEndDate(currentOperDate)) + " �."
    
      ' � G2 ��������:   10-02032020
      ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "��������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����", "��������:", 100, 100) + 1).Value = CStr(WeekNumber(currentOperDate)) + "-" + strDDMMYYYY(currentOperDate)

      ' � J2 ������: 10. ������������� ����� ������ ��� ���������� ���� 1!
      ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����", "������:", 100, 100) + 1).Value = WeekNumber(currentOperDate)
      
      ' � ������ C6 (��), E6 (���), G6 (��), I6 (��) ������� ����� ������ "���� ���.(11)"
      ' ��
      ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 2, ColumnByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 1).Value = "���� ���.(" + CStr(WeekNumber(currentOperDate)) + ")"
      ' �� ��� ��������� �� ���� 4
      ' ThisWorkbook.Sheets("����").Cells(RowByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 2, ColumnByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 3).Value = "���� ���.(" + CStr(WeekNumber(currentOperDate)) + ")"
      ' ��
      ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 2, ColumnByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 5).Value = "���� ���.(" + CStr(WeekNumber(currentOperDate)) + ")"
      ' ��
      ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 2, ColumnByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 7).Value = "���� ���.(" + CStr(WeekNumber(currentOperDate)) + ")"
      ' ��
      ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 13, ColumnByValue(ThisWorkbook.Name, "����", "��������� �������:", 100, 100) + 1).Value = "���� ���.(" + CStr(WeekNumber(currentOperDate)) + ")"
      
    
      ' ������ ������ ������ �� ������ �� ������� - ����� ���� � ���� � ����3
      
      ' ������: ����-��������� ����� ���i
      ' Range_str = RangeByValue(ThisWorkbook.Name, "����3", "����� 2", 100, 100)
      ' ����� 2.1
      Range_str = RangeByValue(ThisWorkbook.Name, "����3", "����� 2.1", 100, 100)
      Range_Row = Workbooks(ThisWorkbook.Name).Sheets("����3").Range(Range_str).Row
      Range_Column = Workbooks(ThisWorkbook.Name).Sheets("����3").Range(Range_str).Column
      
      ' �� � ��
      Range_str2 = RangeByValue(ThisWorkbook.Name, "����5", "������ �� ��������� ��������", 100, 100)
      Range_Row2 = Workbooks(ThisWorkbook.Name).Sheets("����5").Range(Range_str2).Row
      Range_Column2 = Workbooks(ThisWorkbook.Name).Sheets("����5").Range(Range_str2).Column
      
      
      ' ���� �� 5-�� ������
      For i = 1 To 6
        
        ' ����� - ������ �� 1 �� 5
        If i <= 5 Then
        
          Application.StatusBar = "������ ������ " + getNameOfficeByNumber(i) + "..."
        
          ' ������ ����� ��
          ������������_������ = Round(������������(ThisWorkbook.Sheets("����3").Cells(Range_Row + 2 + i, Range_Column + 3).Value, ThisWorkbook.Sheets("����3").Cells(Range_Row + 2 + i, Range_Column + 4).Value, currentOperDate, 6), 0)
          ' ������ ����� ��
          Call set�_���In����(ThisWorkbook.Name, "����", "���" + CStr(i), ������������_������, weekStartDate(currentOperDate), "���.���.", "")
          ' ��������� ���������� ����� �� ������� ������ �����_���������_�������_������
          Call setStatusInTasks("Tasks", "����1", currentOperDate, "���" + CStr(i), �����_���������_�������_������)
      
          ' ������ ����� ��
          ������������_�� = Round(������������(ThisWorkbook.Sheets("����5").Cells(Range_Row2 + 2 + i, Range_Column2 + 1).Value, ThisWorkbook.Sheets("����5").Cells(Range_Row2 + 2 + i, Range_Column2 + 2).Value, currentOperDate, 6), 0)
          ' ������ ����� ��
          Call set�_���In����(ThisWorkbook.Name, "����", "���" + CStr(i), ������������_��, weekStartDate(currentOperDate), "��.", "")
          ' ��������� ���������� ����� �� ������� ������ �����_���������_�������_������
          Call setStatusInTasks("Tasks", "����1", currentOperDate, "���" + CStr(i), �����_���������_�������_������)
       
          ' ������ ����� ��
          ������������_�� = Round(������������(ThisWorkbook.Sheets("����5").Cells(Range_Row2 + 2 + i, Range_Column2 + 3).Value, ThisWorkbook.Sheets("����5").Cells(Range_Row2 + 2 + i, Range_Column2 + 4).Value, currentOperDate, 6), 0)
          ' ������ ����� ��
          Call set�_���In����(ThisWorkbook.Name, "����", "���" + CStr(i), ������������_��, weekStartDate(currentOperDate), "��.", "")
          ' ��������� ���������� ����� �� ������� ������ �����_���������_�������_������
          Call setStatusInTasks("Tasks", "����1", currentOperDate, "���" + CStr(i), �����_���������_�������_������)
                    
        Else
          ' ������� ���1
          Application.StatusBar = "������ ������ �� �� ���������� ..."
          ' ������ ����� ��
          ������������_�� = Round(������������(ThisWorkbook.Sheets("����3").Cells(Range_Row + 16, Range_Column + 3).Value, ThisWorkbook.Sheets("����3").Cells(Range_Row + 16, Range_Column + 4).Value, currentOperDate, 5), 0)
          ' ������ ����� ��
          Call set�_���In����(ThisWorkbook.Name, "����", "���1", ������������_��, weekStartDate(currentOperDate), "���.���.", "")
          ' ��������� ���������� ����� �� ������� ������ �����_���������_�������_������
          Call setStatusInTasks("Tasks", "����1", currentOperDate, "���1", �����_���������_�������_������)
          
          ' � � �.�. �� �� ����������� ���2
          ' ������ ����� �� ������
          ������������_��_������ = Round(������������(ThisWorkbook.Sheets("����3").Cells(Range_Row + 17, Range_Column + 3).Value, ThisWorkbook.Sheets("����3").Cells(Range_Row + 17, Range_Column + 4).Value, currentOperDate, 5), 0)
          ' ������ ����� �� ������
          Call set�_���In����(ThisWorkbook.Name, "����", "���2", ������������_��_������, weekStartDate(currentOperDate), "���.���.", "")
          ' ��������� ���������� ����� �� ������ ������� ������ �����_���������_�������_������
          Call setStatusInTasks("Tasks", "����1", currentOperDate, "���2", �����_���������_�������_������)
          
        End If ' ����� - ������ �� 1 �� 5
      
      Next i
  
      Application.StatusBar = "������� ������ ���������_��_�������� ..." ' Application.StatusBar = "������� ������ �����_��_�������� ..."
      row_���������_��_�������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "���������_��_��������", 100, 100)).Row
      column_���������_��_�������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "���������_��_��������", 100, 100)).Column
      rowCount = 1
      Do While ThisWorkbook.Sheets("����").Cells(row_���������_��_�������� + rowCount, column_���������_��_��������).Value <> ""
        If ThisWorkbook.Sheets("����").Cells(row_���������_��_�������� + rowCount, column_���������_��_��������).Value = "1" Then
          ThisWorkbook.Sheets("����").Cells(row_���������_��_�������� + rowCount, column_���������_��_��������).Value = "0"
        End If
        ' ��������� ������
        rowCount = rowCount + 1
      Loop

      ' ������ �������
      Application.StatusBar = ""
                    
      ' ��������� ���� BASE\Tasks
      CloseBook ("Tasks")
    
      ' ���������� �� ����0 "������� ����� ������ � ����"
      Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "������� ����� ������ � ����", 100, 100))

      MsgBox ("������ �������!")
    End If
  Else
    MsgBox ("��� ����������� ������: " + CStr(WeekNumber(currentOperDate)) + "!")
  End If
  
End Sub

' ����������� ������ � �������� �������� �����
Sub moveInListUp()
Dim ������_��������_���, �������_�����, �������_�����������, �������_����, �������_HashTag, �������_�������, ����_�����, ����_�����������, ����_����, ����_HashTag, ����_������� As String
Dim �����������_��������_���, ������������_��������_���, �������_Row, �������_Column As Byte

  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_��������_��� = RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)
  �����������_��������_��� = ThisWorkbook.Sheets("����").Range(������_��������_���).Row
  ������������_��������_��� = ThisWorkbook.Sheets("����").Range(������_��������_���).Column
  '
  If (ActiveCell.Row >= �����������_��������_��� + 2) And (ActiveCell.Row <= �����������_��������_��� + 20) And (ActiveCell.Column >= ������������_��������_��� - 1) And ((ActiveCell.Column <= ������������_��������_��� + 12)) Then
      ' ����������
      �������_Row = ActiveCell.Row
      �������_Column = ActiveCell.Column
      ' ���������� �������
      �������_����� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� - 1).Value
      �������_����������� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_���).Value
      �������_���� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 1).Value
      �������_HashTag = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 11).Value
      �������_������� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 12).Value
      ' ���������� ����
      ' ����_Row = �������_Row + 1
      ����_����� = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_��� - 1).Value
      ����_����������� = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_���).Value
      ����_���� = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_��� + 1).Value
      ����_HashTag = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_��� + 11).Value
      ����_������� = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_��� + 12).Value
      ' ������ �������:
      ' ������� ������ � ����:
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_��� - 1).Value = �������_�����
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_���).Value = �������_�����������
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_��� + 1).Value = �������_����
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_��� + 11).Value = �������_HashTag
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_��������_��� + 12).Value = �������_�������
      ' ���� ������ � �������:
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� - 1).Value = ����_�����
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_���).Value = ����_�����������
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 1).Value = ����_����
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 11).Value = ����_HashTag
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 12).Value = ����_�������
      ' ������������� �� ������ ����
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, �������_Column).Select
      ' ���������� ������������� ������
      Call createNumberingThemes
    Else
      MsgBox ("������� ������ � ��������� ��������_���!")
  End If
End Sub

' ����������� ������ � �������� �������� ����
Sub moveInListDown()
Dim ������_��������_���, �������_�����, �������_�����������, �������_����, �������_HashTag, �������_�������, ����_�����, ����_�����������, ����_����, ����_HashTag, ����_������� As String
Dim �����������_��������_���, ������������_��������_���, �������_Row, �������_Column As Byte

  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_��������_��� = RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)
  �����������_��������_��� = ThisWorkbook.Sheets("����").Range(������_��������_���).Row
  ������������_��������_��� = ThisWorkbook.Sheets("����").Range(������_��������_���).Column
  '
  If (ActiveCell.Row >= �����������_��������_��� + 2) And (ActiveCell.Row <= �����������_��������_��� + 20) And (ActiveCell.Column >= ������������_��������_��� - 1) And ((ActiveCell.Column <= ������������_��������_��� + 12)) Then
      ' ����������
      �������_Row = ActiveCell.Row
      �������_Column = ActiveCell.Column
      ' ���������� �������
      �������_����� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� - 1).Value
      �������_����������� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_���).Value
      �������_���� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 1).Value
      �������_HashTag = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 11).Value
      �������_������� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 12).Value
      ' ���������� ����
      ' ����_Row = �������_Row + 1
      ����_����� = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_��� - 1).Value
      ����_����������� = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_���).Value
      ����_���� = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_��� + 1).Value
      ����_HashTag = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_��� + 11).Value
      ����_������� = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_��� + 12).Value
      ' ������ �������:
      ' ������� ������ � ����:
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_��� - 1).Value = �������_�����
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_���).Value = �������_�����������
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_��� + 1).Value = �������_����
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_��� + 11).Value = �������_HashTag
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_��������_��� + 12).Value = �������_�������
      ' ���� ������ � �������:
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� - 1).Value = ����_�����
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_���).Value = ����_�����������
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 1).Value = ����_����
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 11).Value = ����_HashTag
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_��������_��� + 12).Value = ����_�������
      ' ������������� �� ������ ����
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, �������_Column).Select
      ' ���������� ������������� ������
      Call createNumberingThemes
    Else
      MsgBox ("������� ������ � ��������� ��������_���!")
  End If

End Sub

' �������� ������ �� ��������
Sub deleteFromList()
Dim ������_��������_��� As String
Dim �����������_��������_���, ������������_��������_��� As Byte

  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_��������_��� = RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)
  �����������_��������_��� = ThisWorkbook.Sheets("����").Range(������_��������_���).Row
  ������������_��������_��� = ThisWorkbook.Sheets("����").Range(������_��������_���).Column
  '
  If (ActiveCell.Row >= �����������_��������_��� + 2) And (ActiveCell.Row <= �����������_��������_��� + 20) And (ActiveCell.Column >= ������������_��������_��� - 1) And ((ActiveCell.Column <= ������������_��������_��� + 12)) And (ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_��������_��� + 1).Value <> "") Then
    '
    If MsgBox("������� ������ �" + CStr(ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_��������_��� - 1).Value) + " �� ��������?", vbYesNo) = vbYes Then
      ' �������
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_��������_��� - 1).Value = ""
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_��������_���).Value = ""
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_��������_��� + 1).Value = ""
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_��������_��� + 11).Value = ""
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_��������_��� + 12).Value = ""
    End If
  Else
    MsgBox ("������� ������ � ��������� ��������_���!")
  End If
  
End Sub


' ������� �������� ��������
Sub �������_��������_��������()
  
  ' ��������� �������������� �������� �� �����
           
  ' ��� ����� � ���������� - ����� �� G2 "10-02032020"
  FileProtocolName = "�������� _ ��� ���������_" + CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + ".xlsx"

  ' �������� ������� �����
  If Dir(ThisWorkbook.Path + "\Out\" + FileProtocolName) <> "" Then
    ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
    Workbooks.Open (ThisWorkbook.Path + "\Out\" + FileProtocolName)
  Else
    ' ���������, ��� ���� �� ������
    MsgBox ("���� " + FileProtocolName + " �� ������!")
  End If
  
End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_����_����()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
Dim ��������_Lotus_Notes, FileCopy_To_���� As Boolean
  
  
  ��������_Lotus_Notes = False
  FileCopy_To_���� = False
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ������ �������
    Application.StatusBar = "�������� ������ � Lotus Notes ..."
    
    ' ���� ������ - ����:
    ' ���������� = "��������� ���: �������� ���������-����� � ������� �� " + CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + " �."
    ���������� = ThisWorkbook.Sheets("����").Cells(1, 17).Value
    
    ' hashTag - ������:
    hashTag = hashTagFromSheet("����")
    
    ' ����-�������� (!!!)
    attachmentFile = ThisWorkbook.Path + "\Out\�������� _ ��� ���������_" + CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + ".xlsx"
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("����").Cells(rowByValue(ThisWorkbook.Name, "����", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������ ��� �����
    
    '     str_����������� = getFromAddrBook("��", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("�af", 1)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + ", " + getFromAddrBook("���", 2) + ", " + getFromAddrBook("���", 2) + ", " + getFromAddrBook("���", 2) + ", " + getFromAddrBook("�af", 2) + ", " + getFromAddrBook("����", 1) + Chr(13)
    
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ����������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� �������� �����������. ����� ������� ��������� � ����������." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(25) + hashTag + " " + hashTagFromSheetII("����", 2)
    
    ' �����
    Call send_Lotus_Notes2(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "", "", �����������, attachmentFile)
        
    ��������_Lotus_Notes = True
        
    ' ������ �������
    Application.StatusBar = ""
    
    ' ���������
    MsgBox ("������ ����������!")
     
  End If
  
  ' ����������� ��������� � To-Do
  Call copyTaskInToDo
  
  ' �������� ������ � ToDO � ��������� ���������� � �������
  Application.StatusBar = "�������� ������ �������� � To-Do..."
  
  ' ��������� ������� BASE\ToDo
  OpenBookInBase ("ToDo")

  ' ��������� �� ���� DB
  ThisWorkbook.Sheets("����").Activate

  ' ������ ������ � BASE\ToDo
  hashTag = createHashTag("t")
  ' Id_Task
  Id_TaskVar = Replace(hashTag, "#t", "")

  Call InsertRecordInBook("ToDo", "����1", "Id_Task", Id_TaskVar, _
                                            "Date_Create", Date, _
                                              "Id_Task", Id_TaskVar, _
                                                "Task", "��������� ���������� ��������� �� ��������� " + ThisWorkbook.Sheets("����").Range("G2").Value, _
                                                  "Lotus_subject", subjectFromSheet("����"), _
                                                    "Responsible", "���/�������/����", _
                                                      "Lotus_hashtag", hashTagFromSheetII("����", 2), _
                                                        "Task_Status", 1, _
                                                          "Date_Control", weekEndDate(Date) - 2, _
                                                            "", "", _
                                                              "", "", _
                                                                "", "", _
                                                                  "", "", _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")

  ' ��������� ������� BASE\ToDo
  CloseBook ("ToDo")
  
  ' ������ �������
  Application.StatusBar = ""
  
  
  ' ��������� ���� ��������� � ������� ����? - https://www.excel-vba.ru/chto-umeet-excel/kak-sredstvami-vba-pereimenovatperemestitskopirovat-fajl/
  If MsgBox("��������� ���� ��������� �������� � ������� ����?", vbYesNo) = vbYes Then
  
    ' ������ �������
    Application.StatusBar = "����������� � ������� ���� ..."
    
    FileCopy attachmentFile, "\\probank\DavWWWRoot\drp\DocLib1\��������� ��1\�������������� ���������\��������\�������� _ ��� ���������_" + CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + ".xlsx"
  
    FileCopy_To_���� = True
  
    ' ������ �������
    Application.StatusBar = ""

    ' ���������
    MsgBox ("���� ��������� � ������� ����!")
    
  End If
  
  ' ���� ��� ������ ��������� - �����������: "��������� �������� �������� � ����� � � ������� ����"
  If (��������_Lotus_Notes = True) And (FileCopy_To_���� = True) Then
    Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "��������� �������� �������� � ����� � � ������� ����", 100, 100))
  End If
  
End Sub

' ���������� ����_���� ��.��.����
Sub ����������_����_����()

' �������� ����������
Dim ������_��_����_��_���_����_Range_str, ������_�����_����������_����_����_str, ������_�����_str, ������_���������_��1_str, ReportName_String, officeNameInReport, CheckFormatReportResult, ����2_Range_str, ������2_Range_str, ���������������85��������� As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
Dim ������_��_����_��_���_����_Range_Row, ������_��_����_��_���_����_Range_Column, ������_�����_����������_����_����_row, ������_�����_����������_����_����_Column, ������_���������_��1_Row, ������_���������_��1_Column, Row_��������_�_��������, Column_��������_�_��������, ����2_Range_Row, ����2_Range_Column, ������2_Range_Row, ������2_Range_Column As Byte
Dim dateReportFrom_ReportName_String As Date
    
  ' ������� ���� � �������
  FileName = Application.GetOpenFilename("Excel Files (*.xlsx), *.xlsx", , "�������� ����� � �������")

  ' ���� ���� ��� ������
  If (Len(FileName) > 5) Then
  
    ' ������ �������
    Application.StatusBar = "��������� ������..."
  
    ' ���������� ������ ���������
    finishProcess = False

    ' ������� ��� ���� ������ �� ����� �����
    ReportName_String = Dir(FileName)
  
    ' ��������� ��������� ����� (UpdateLinks:=0)
    Workbooks.Open FileName, 0
      
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "����������", 9, Date)
    If CheckFormatReportResult = "OK" Then
      
      ' ���� ������ �� ����� �����
      dateReportFrom_ReportName_String = CDate(getDateReportFromFileName(ReportName_String))
                
      ' ������� ������ "�����_����������_����_����" �� ����� "����"
      ������_�����_����������_����_����_str = RangeByValue(ThisWorkbook.Name, "����", "����� ����������� ����_����", 100, 100)
      ������_�����_����������_����_����_row = Workbooks(ThisWorkbook.Name).Sheets("����").Range(������_�����_����������_����_����_str).Row
      ������_�����_����������_����_����_Column = Workbooks(ThisWorkbook.Name).Sheets("����").Range(������_�����_����������_����_����_str).Column

      ' ���������� ���� �� ___
      ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row - 1, ������_�����_����������_����_����_Column).Value = "���������� ���� �� " + CStr(dateReportFrom_ReportName_String) + " �."
                      
      ' ����2:
      ����2_Range_str = RangeByValue(ThisWorkbook.Name, "����", "����2:", 100, 100)
      ����2_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("����").Range(����2_Range_str).Row
      ����2_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("����").Range(����2_Range_str).Column
      ThisWorkbook.Sheets("����").Cells(����2_Range_Row, ����2_Range_Column + 1).Value = "���������� ���� �� " + CStr(dateReportFrom_ReportName_String) + " �."
    
      ' ������2: "#����"+strDDMMYYYY
      ������2_Range_str = RangeByValue(ThisWorkbook.Name, "����", "������2:", 100, 100)
      ������2_Range_Row = Workbooks(ThisWorkbook.Name).Sheets("����").Range(������2_Range_str).Row
      ������2_Range_Column = Workbooks(ThisWorkbook.Name).Sheets("����").Range(������2_Range_str).Column
      ThisWorkbook.Sheets("����").Cells(������2_Range_Row, ������2_Range_Column + 1).Value = "#����_" + strDDMMYYYY(dateReportFrom_ReportName_String)
                                
      ' ������� ������� "��" �� ����� "��_���.����"
      ������_��_����_��_���_����_Range_str = RangeByValue(ReportName_String, "��_���.����", "��", 100, 100)
      ������_��_����_��_���_����_Range_Row = Workbooks(ReportName_String).Sheets("��_���.����").Range(������_��_����_��_���_����_Range_str).Row
      ������_��_����_��_���_����_Range_Column = Workbooks(ReportName_String).Sheets("��_���.����").Range(������_��_����_��_���_����_Range_str).Column

      ' ������� � ������ ������ ��������� ���� ������ ������ monthStartDate (����� �� 160-�� ������� ��������� ������ ��� ������������� ������� �� �������� ConvertToLetter)
      ' ������_�����_str = RangeByValue(ReportName_String, "��_���.����", CStr(monthStartDate(dateReportFrom_ReportName_String)), 100, 10000)
      ' ������_�����_Row = Workbooks(ReportName_String).Sheets("��_���.����").Range(������_�����_str).Row
      ' ������_�����_Column = Workbooks(ReportName_String).Sheets("��_���.����").Range(������_�����_str).Column

      ������_�����_str = cellByValue(ReportName_String, "��_���.����", CStr(monthStartDate(dateReportFrom_ReportName_String)), 100, 10000)
      ������_�����_Row = row_cellByValue(������_�����_str)
      ������_�����_Column = column_cellByValue(������_�����_str)

      ' ������� ������ ������
      ' Call clear�ontents2(ThisWorkbook.Name, "����", "X7", "AJ12")
      Call clear�ontents3(ThisWorkbook.Name, "����", ������_�����_����������_����_����_row + 3, ������_�����_����������_����_����_Column + 3, ������_�����_����������_����_����_row + 8, ������_�����_����������_����_����_Column + 12)

      ' ������ ������ � ����������� ���� ����� 85%
      ������_������_�_�����������_����_�����_85 = ""
 
      ' ������������ �����
      ' ���� �� 5-�� ������
      ' ��������� ������
      For i = 1 To 5
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' �� ����������
            officeNameInReport = "���������"
          Case 2 ' �� �����������
            officeNameInReport = "����������"
          Case 3 ' �� ����������������
            officeNameInReport = "���������������"
          Case 4 ' �� ����������������
            officeNameInReport = "���������������"
          Case 5 ' �� ������-����
            officeNameInReport = "�����-����"
        End Select

        rowCount = 4
        office_was_found = False
        Do While (Not IsEmpty(Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_��_����_��_���_����_Range_Column).Value)) And (office_was_found = False)
          
          ' �������� �����
          If InStr(Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_��_����_��_���_����_Range_Column).Value, officeNameInReport) <> 0 Then
            
            ' ���������� ������
            ' �������������� �������: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 3).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column).Value
            ' �������������� �������: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 4).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 1).Value
            ' �������������� �������:  % ���.
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 5).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 2).Value
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 5).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 5).Value) ' "0.0%"
            
            ' ���������� �� ������� ����.: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 6).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 6).Value
            ' ���������� �� ������� ����.: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 7).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 7).Value
            ' ���������� �� ������� ����.:  % ���.
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 8).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 8).Value
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 8).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 8).Value) ' "0.0%"
            
            ' ��������: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 9).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 9).Value
            ' ��������: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 10).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 10).Value
            ' ��������: % ���.
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 11).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 11).Value
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 11).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 11).Value) ' "0.0%"
            
            ' �������� �������
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12).Value = Workbooks(ReportName_String).Sheets("��_���.����").Cells(rowCount, ������_�����_Column + 12).Value
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12).Value) ' "0.0%"
            
            ' ������ ������ � ����������� ���� ����� 85%
            If ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12).Value < 0.85 Then
              If ������_������_�_�����������_����_�����_85 = "" Then
                ������_������_�_�����������_����_�����_85 = getNameOfficeByNumber(i)
              Else
                ������_������_�_�����������_����_�����_85 = ������_������_�_�����������_����_�����_85 + ", " + getNameOfficeByNumber(i)
              End If
            End If
            
            ' �������� ��������������
            Call cellFormatConditions(ThisWorkbook.Name, "����", ������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12)
                        
            ' ���������� - ���� ��� ������
            office_was_found = True
          End If
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
      
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
      ' ���� �� �������
        
      ' ������� ������� "��������� ��1" �� ����� "�������"
      ������_���������_��1_str = RangeByValue(ReportName_String, "�������", "��������� ��1", 100, 100)
      ������_���������_��1_Row = Workbooks(ReportName_String).Sheets("��_���.����").Range(������_���������_��1_str).Row
      ������_���������_��1_Column = Workbooks(ReportName_String).Sheets("��_���.����").Range(������_���������_��1_str).Column

      ' ������� � ������ ������ ��������� ���� ������ ������ monthStartDate
      ' ������_�����_str = RangeByValue(ReportName_String, "�������", CStr(monthStartDate(dateReportFrom_ReportName_String)), 100, 10000)
      ' ������_�����_Row = Workbooks(ReportName_String).Sheets("�������").Range(������_�����_str).Row
      ' ������_�����_Column = Workbooks(ReportName_String).Sheets("�������").Range(������_�����_str).Column
          
      ������_�����_Row = rowByValue(ReportName_String, "�������", CStr(monthStartDate(dateReportFrom_ReportName_String)), 100, 10000)
      ������_�����_Column = ColumnByValue(ReportName_String, "�������", CStr(monthStartDate(dateReportFrom_ReportName_String)), 100, 10000)
      
            ' ���������� ������
            ' ������� �������������� �������: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 3).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 6).Value
            ' ������� �������������� �������: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 4).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 7).Value
            ' ������� �������������� �������:  % ���.
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 5).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 8).Value
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 5).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 5).Value) ' "0.0%"
            
            ' ������� ���������� �� ������� ����.: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 6).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 3).Value
            ' ������� ���������� �� ������� ����.: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 7).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 4).Value
            ' ������� ���������� �� ������� ����.:  % ���.
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 8).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 5).Value
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 8).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 8).Value) ' "0.0%"
            
            ' ������� ��������: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 9).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 0).Value
            ' ������� ��������: ����
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 10).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 1).Value
            ' ������� ��������: % ���.
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 11).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 2).Value
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 11).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 11).Value) ' "0.0%"
            
            ' ������� �������� �������
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12).Value = Workbooks(ReportName_String).Sheets("�������").Cells(������_���������_��1_Row, ������_�����_Column + 9).Value
            ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12).NumberFormat = cellsNumberFormat(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12).Value) ' "0.0%"
    
            ' �������� ��������������
            Call cellFormatConditions(ThisWorkbook.Name, "����", ������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12)

            ' ������ ������ � ����������� ���� ����� 85%
            If ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + i, ������_�����_����������_����_����_Column + 12).Value < 0.85 Then
              If ������_������_�_�����������_����_�����_85 = "" Then
                ������_������_�_�����������_����_�����_85 = "��"
              Else
                ������_������_�_�����������_����_�����_85 = ������_������_�_�����������_����_�����_85 + ", ��"
              End If
            End If



      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� ���������� � �������� �������� ����� ��������_�_��������_��������_���()
    ' 1) ������� � ������ "�������� � �������� "��������_���":"
    Row_��������_�_�������� = rowByValue(ThisWorkbook.Name, "����0", "�������� � �������� " + Chr(34) + "��������_���" + Chr(34) + ":", 100, 100)
    Column_��������_�_�������� = ColumnByValue(ThisWorkbook.Name, "����0", "�������� � �������� " + Chr(34) + "��������_���" + Chr(34) + ":", 100, 100)
    
    ' ������������ ��������� ��� ������ � ������� ����� 85%
    If ������_������_�_�����������_����_�����_85 <> "" Then
      ���������������85��������� = "������������� " + ������_������_�_�����������_����_�����_85 + " �������� � �������������� ��������, �������������� �������, ���������� �� ������� ����������� ��� ���������� ������ ��������� �������� �� " + ������������(dateReportFrom_ReportName_String) + " - �� ����� 85%."
    Else
      ���������������85��������� = ""
    End If
    
    ' ����:
    ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_��������).Value = ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row - 1, ������_�����_����������_����_����_Column).Value + " ����������: " _
                                                                                                        + "�� ���������� " + CStr(Round(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + 1, ������_�����_����������_����_����_Column + 12).Value * 100, 0)) + "%, " _
                                                                                                          + "�� ����������� " + CStr(Round(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + 2, ������_�����_����������_����_����_Column + 12).Value * 100, 0)) + "%, " _
                                                                                                            + "�� ���������������� " + CStr(Round(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + 3, ������_�����_����������_����_����_Column + 12).Value * 100, 0)) + "%, " _
                                                                                                              + "�� ���������������� " + CStr(Round(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + 4, ������_�����_����������_����_����_Column + 12).Value * 100, 0)) + "%, " _
                                                                                                                + "�� ������-���� " + CStr(Round(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + 5, ������_�����_����������_����_����_Column + 12).Value * 100, 0)) + "%, " _
                                                                                                                  + "��������� ����� " + CStr(Round(ThisWorkbook.Sheets("����").Cells(������_�����_����������_����_����_row + 2 + 6, ������_�����_����������_����_����_Column + 12).Value * 100, 0)) + "%. " _
                                                                                                                    + ���������������85���������
        
    ' HashTag �� ����0 �� ������2:
    ThisWorkbook.Sheets("����0").Cells(Row_��������_�_�������� + 2, Column_��������_�_�������� + 14).Value = ThisWorkbook.Sheets("����").Cells(������2_Range_Row, ������2_Range_Column + 1).Value

    ' 2) ��������_�_��������_��������_���()
    Call ��������_�_��������_��������_���
    
    ' ��������� ������ ��� �������� (� "������ �����������2:"):
    range_������_����������� = RangeByValue(ThisWorkbook.Name, "����", "������ �����������2:", 100, 100)
    row_������_����������� = ThisWorkbook.Sheets("����").Range(range_������_�����������).Row
    column_������_����������� = ThisWorkbook.Sheets("����").Range(range_������_�����������).Column
    '
    ThisWorkbook.Sheets("����").Cells(row_������_�����������, column_������_����������� + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,���", 2)
    ThisWorkbook.Sheets("����").Cells(row_������_�����������, column_������_����������� + 3).Value = " "

    ' ��������� � ������ M2
    ThisWorkbook.Sheets("����").Range("AL4").Select

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� _________________", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������


End Sub

' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������
Sub ��������_Lotus_Notes_����_����_��_�_��()
'
Dim ����������, �����������, hashTag As String
Dim i As Byte
  
  If MsgBox("��������� ���� ������ ������?", vbYesNo) = vbYes Then
    
    ' ���� ������ - ����:
    ���������� = subjectFromSheet2("����")

    ' hashTag - ������:
    hashTag = hashTagFromSheet2("����")
    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + recipientList2("����") + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "���������� �� �������� ���������� ����������. �������� ��������� �������� - 85%." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    ' �����
    Call send_Lotus_Notes2(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "", "", �����������, "")
  
    ' ���������
    MsgBox ("������ ����������!")
     
  End If


End Sub

' �������� ��������������
Sub cellFormatConditions(In_BookName, In_Sheet, In_Row, In_Column)
                       
            Workbooks(In_BookName).Sheets(In_Sheet).Cells(In_Row, In_Column).FormatConditions.AddIconSetCondition
            Workbooks(In_BookName).Sheets(In_Sheet).Cells(In_Row, In_Column).FormatConditions(Workbooks(In_BookName).Sheets(In_Sheet).Cells(In_Row, In_Column).FormatConditions.Count).SetFirstPriority
            
            With Workbooks(In_BookName).Sheets(In_Sheet).Cells(In_Row, In_Column).FormatConditions(1)
              .ReverseOrder = False
              .ShowIconOnly = False
              .IconSet = ActiveWorkbook.IconSets(xl3TrafficLights1)
            End With
            
            With Workbooks(In_BookName).Sheets(In_Sheet).Cells(In_Row, In_Column).FormatConditions(1).IconCriteria(2)
              .Type = xlConditionValueNumber
              .Value = 0.5
              .Operator = 7
            End With
            
            With Workbooks(In_BookName).Sheets(In_Sheet).Cells(In_Row, In_Column).FormatConditions(1).IconCriteria(3)
              .Type = xlConditionValueNumber
              .Value = 0.85
              .Operator = 7
            End With

End Sub


' �������� ��������� �������� ���� 2
Sub ��������_��������2()
  
Dim FileProtocolName, str_����������������_��_��������, str_���������������_��_��������, str_�����������, �_���_Range, str_���������i, ���������_��_��������_Range, range_������_����������� As String
Dim �����������_��������_���, �����_�������, rowCount, �_���_Row, �_���_Column, �����_���������, ����������������������, i, ���������_��_��������_Row, ���������_��_��������_Column As Byte
Dim row_column_������_�����������, column_������_����������� As Byte

  ' �������� ��������� (�� �������)
  ' Workbooks.Open FileName:="C:\Users\������\Documents\#VBA\DB_Result\Templates\���������� 1. ��������.xlsx"
  ' ChDir "C:\Users\������\Documents\#VBA\DB_Result\Out"
  ' ActiveWorkbook.SaveAs FileName:="C:\Users\������\Documents\#VBA\DB_Result\Out\��������_��������.xlsx", FileFormat:=xlOpenXMLWorkbook, CreateBackup:=False
  ' ActiveWindow.Close

  ' ������ �� ������������ ��������� ��������
  If MsgBox("������������ �������� ��������?", vbYesNo) = vbYes Then
    
    ' ��������� ������� BASE\ToDo
    OpenBookInBase ("ToDo")
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����").Activate

    
    ' ��������� ������ ��������� �� C:\Users\...\Documents\#VBA\DB_Result\Templates
    Workbooks.Open (ThisWorkbook.Path + "\Templates\���������� 1. ��������.xlsx")
         
    ' ��� ����� � ���������� - ����� �� G2 "10-02032020"
    FileProtocolName = "�������� _ ��� ���������_" + CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + ".xlsx"
    
    ' ��������� - ���� ���� ����, �� ������� ���
    Call deleteFile(ThisWorkbook.Path + "\Out\" + FileProtocolName)
    
    ' ��������� ���� � ����������
    Workbooks("���������� 1. ��������.xlsx").SaveAs FileName:=ThisWorkbook.Path + "\Out\" + FileProtocolName, FileFormat:=xlOpenXMLWorkbook, createBackUp:=False
    
    ' ����� ���������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C1:E2").Value = "�������� �������� �" + ThisWorkbook.Sheets("����").Range("G2").Value
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C1:G2").MergeCells = True
    ' ����������� ������ �������������� �������
    Workbooks(FileProtocolName).Sheets("��������_��������").Columns("H:H").ColumnWidth = 20.43  ' 20.43, 21.64-������
    Workbooks(FileProtocolName).Sheets("��������_��������").Columns("I:I").ColumnWidth = 3
    ' ����
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A4:C4").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A4:C4").VerticalAlignment = xlCenter
    ' Workbooks(FileProtocolName).Sheets("��������_��������").Range("D4:H4").Value = "������������ ���������-���� � ������������ ������ � ������� ���������� ��� �� ���������� ������ ������ ������ �� ���������� ������ � ���������� ������-����� �� ������� ������"
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D4:H4").Value = "������������ ���������-���� � ������������ ������ � ������� ���������� ��� �� ���������� ������ ������ ������ �� ���������� ������ � ���������� ������-����� �� ������ � " + strDDMM(weekStartDate(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value))) + " �� " + CStr(weekEndDate(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value))) + " �."
    ' ���� ����������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A5:C5").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A5:C5").VerticalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D5:H5").Value = CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + " �."
    ' ����� ����������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A6:C6").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A6:C6").VerticalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D6:H6").Value = "�.������, ��.��������� 51/1"
    ' ��������� ��������������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A7:B8").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A7:B8").VerticalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C7").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C7").VerticalAlignment = xlCenter
    str_����������������_��_�������� = ����������������_��_��������(1)
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D7:H7").Value = str_����������������_��_��������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D7:H7").WrapText = True
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("7:7").RowHeight = lineHeight(str_����������������_��_��������, 15, 60) ' ���� 50 - ����. 60 - �������� ������
        
    ' ��������� �������������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C8").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("C8").VerticalAlignment = xlCenter
    str_���������������_��_�������� = ����������������_��_��������(0)
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D8:H8").Value = str_���������������_��_��������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D8:H8").WrapText = True
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("8:8").RowHeight = lineHeight(str_���������������_��_��������, 15, 60) ' ���� 40 - ����
    ' ����� � �����:
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A9:C9").HorizontalAlignment = xlCenter
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A9:C9").VerticalAlignment = xlCenter
    ' str_����������� = getFromAddrBook("���", 1) ' + ", " + getFromAddrBook("���", 1) - ���� ��� ���������
    str_����������� = getFromAddrBook("��", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("���", 1) + ", " + getFromAddrBook("�af", 1) + ", " + getFromAddrBook("����", 1)
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D9:H9").Value = str_�����������
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("D9:H9").WrapText = True
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("9:9").RowHeight = lineHeight(str_�����������, 15, 60) ' ���� 30 - ����
    
    ' �������� ���:
    �����������_��������_��� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)).Row
    rowCount = 2
    �����_������� = 0
    Do While ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 1).Value <> ""
      ' ���� � ������� ����� ������� "1", �� ������ ��� � �������� ��������
      If ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 14).Value = "1" Then
        
        �����_������� = �����_������� + 1
        
        ' ���� ����� ������� ����� 6-��, �� ��������� ������
        If �����_������� > 6 Then
          ' ��������� ������
          Workbooks(FileProtocolName).Sheets("��������_��������").Range(CStr(12 + �����_�������) + ":" + CStr(12 + �����_�������)).Select
          Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
          ' ��������� "7." �������� ������ ���� ������ ������������� � ���������� ("@")
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).NumberFormat = "@"
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).Value = CStr(�����_�������) + "."
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).HorizontalAlignment = xlLeft
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("B" + CStr(12 + �����_�������) + ":H" + CStr(12 + �����_�������)).MergeCells = True
          ' �����
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("A" + CStr(12 + �����_�������) + ":H" + CStr(12 + �����_�������)).Select
          With Selection.Borders(xlEdgeLeft)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
          With Selection.Borders(xlEdgeTop)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
          With Selection.Borders(xlEdgeBottom)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
          With Selection.Borders(xlEdgeRight)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
          With Selection.Borders(xlInsideVertical)
            .LineStyle = xlContinuous
            .ThemeColor = 3
            .TintAndShade = -0.749992370372631
            .Weight = xlThin
          End With
        
        End If
        
        ' ������ ������ ������ �������� ���
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).HorizontalAlignment = xlCenter
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 1).VerticalAlignment = xlCenter
        ' ������ � �������� ���
        If ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 13).Value = "" Then
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).Value = ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 2).Value + ": " + ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).Value
        Else
          ' ���� ���� ������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).Value = ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 2).Value + ": " + ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 3).Value + " (" + ThisWorkbook.Sheets("����").Cells(�����������_��������_��� + rowCount, 13).Value + ")"
        End If
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).HorizontalAlignment = xlLeft
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).VerticalAlignment = xlTop
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).WrapText = True
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).RowHeight = lineHeight(delSym(Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_�������, 2).Value), 15, 90) ' ���� 15, 65
      End If
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
    
    ' ������������ ����� �������, ���� �� ����� 6 ��� ����, ����� ��������� ������������ ����� ����� � ����������
    If �����_������� < 6 Then
      �����_������� = 6
    End If
       
    ' ��������� ����������:
      
      ' ����� ���������
      �����_��������� = 0
      
      ' ������������ ��������� �� �����, ��� ����� ����
      rowCount = 62
      Do While Trim(ThisWorkbook.Sheets("����").Cells(rowCount, 19).Value) <> ""
        
          ' ����� ���������
          �����_��������� = �����_��������� + 1
          ' ���� ����� ��������� ����� 6-��, �� ��������� ������
          If �����_��������� > 6 Then
            
            ' ��������� ������ ������ � ���� "���������"
            Workbooks(FileProtocolName).Sheets("��������_��������").Range(CStr(12 + �����_������� + 4 + �����_���������) + ":" + CStr(12 + �����_������� + 4 + �����_���������)).Select
            Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
            
            ' ��������� "7." �������� ������ ���� ������ ������������� � ���������� ("@")
            Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).NumberFormat = "@"
            Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).Value = CStr(�����_���������) + "."
            
            ' ���������� B, �, D
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("B" + CStr(12 + �����_������� + 4 + �����_���������) + ":D" + CStr(12 + �����_������� + 4 + �����_���������)).MergeCells = True
            
            ' ���������� G, �
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("G" + CStr(12 + �����_������� + 4 + �����_���������) + ":H" + CStr(12 + �����_������� + 4 + �����_���������)).MergeCells = True
            
            ' �����
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("A" + CStr(12 + �����_������� + 4 + �����_���������) + ":H" + CStr(12 + �����_������� + 4 + �����_���������)).Select
            With Selection.Borders(xlEdgeLeft)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeTop)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeBottom)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeRight)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlInsideVertical)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With

          End If ' ��������� ����� ������ ��������� � ��������
          
          ' ����� ��������� (� �/�) - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).HorizontalAlignment = xlCenter
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).VerticalAlignment = xlCenter

          ' ���������
          str_���������i = ThisWorkbook.Sheets("����").Cells(rowCount, 21).Value
          
          ' ��������� - "���������� �� ������"
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("B" + CStr(12 + �����_������� + 4 + �����_���������) + ":D" + CStr(12 + �����_������� + 4 + �����_���������)).WrapText = True
          ' ��������� - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).HorizontalAlignment = xlLeft
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).VerticalAlignment = xlTop
          ' ��������� - ������ ������
          Workbooks(FileProtocolName).Sheets("��������_��������").Range(CStr(12 + �����_������� + 4 + �����_���������) + ":" + CStr(12 + �����_������� + 4 + �����_���������)).RowHeight = lineHeight(str_���������i, 15, 37) ' 20 - ����
          ' ��������� - ������ � ��������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).Value = str_���������i

          ' �������������
          ' ������� 1 - ��������� � ���
          ' Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).Value = ThisWorkbook.Sheets("����").Cells(�_���_Row - 1, �_���_Column - 4).Value + " " + ThisWorkbook.Sheets("����").Cells(�_���_Row - 1, �_���_Column - 3).Value
          ' ������� 2 - ���
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).Value = ThisWorkbook.Sheets("����").Cells(rowCount, 19).Value
          
          ' ������������� - "���������� �� ������"
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("E" + CStr(12 + �����_������� + 4 + �����_���������) + ":E" + CStr(12 + �����_������� + 4 + �����_���������)).WrapText = True
          ' ������������� - ������������ �� ��������� � �����������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).VerticalAlignment = xlTop
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).HorizontalAlignment = xlCenter
          
          ' ���� ����������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).Value = CStr(ThisWorkbook.Sheets("����").Cells(rowCount, 20).Value)
          ' ���� ���������� - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).HorizontalAlignment = xlCenter
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).VerticalAlignment = xlTop
          
        
        ' ��������� ������
        DoEvents
        rowCount = rowCount + 1
      Loop ' Do While
      
    
    ' ������� ���������� ���������� ���������� ��������� �� BASE\To-Do � ������� Protocol_Number<>"" � Protocol_Number2=""
    ' ������������ ��������� �� �����, ��� ����� ����
    rowCount = 2
    Do While Trim(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 1).Value) <> ""
        
      ' ���� (Protocol_Number<>"" � Protocol_Number2="") ��� (Protocol_Number<>"" � Protocol_Number2=�������� ���������)
      ' If ((Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 13).Value = "")) Or (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 13).Value = ThisWorkbook.Sheets("����").Range("G2").Value) Then
      
      ' �������2 (���������� ��������� � ����� ���� � ������������� ��� �� �� To-DO)
      ' ���� (Protocol_Number<>"" � Protocol_Number<>�������� ��������� � Protocol_Number2="") ��� (Protocol_Number<>"" � Protocol_Number2=�������� ���������)
      If ((Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> ThisWorkbook.Sheets("����").Range("G2").Value) And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 13).Value = "")) Or (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value <> "") And (Workbooks("ToDo").Sheets("����1").Cells(rowCount, 13).Value = ThisWorkbook.Sheets("����").Range("G2").Value) Then
      
      
          ' ����� ���������
          �����_��������� = �����_��������� + 1
          ' ���� ����� ��������� ����� 6-��, �� ��������� ������
          If �����_��������� > 6 Then
            
            ' ��������� ������ ������ � ���� "���������"
            Workbooks(FileProtocolName).Sheets("��������_��������").Range(CStr(12 + �����_������� + 4 + �����_���������) + ":" + CStr(12 + �����_������� + 4 + �����_���������)).Select
            Selection.Insert Shift:=xlDown, CopyOrigin:=xlFormatFromLeftOrAbove
            
            ' ��������� "7." �������� ������ ���� ������ ������������� � ���������� ("@")
            Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).NumberFormat = "@"
            Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).Value = CStr(�����_���������) + "."
            
            ' ���������� B, �, D
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("B" + CStr(12 + �����_������� + 4 + �����_���������) + ":D" + CStr(12 + �����_������� + 4 + �����_���������)).MergeCells = True
            
            ' ���������� G, �
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("G" + CStr(12 + �����_������� + 4 + �����_���������) + ":H" + CStr(12 + �����_������� + 4 + �����_���������)).MergeCells = True
            
            ' �����
            Workbooks(FileProtocolName).Sheets("��������_��������").Range("A" + CStr(12 + �����_������� + 4 + �����_���������) + ":H" + CStr(12 + �����_������� + 4 + �����_���������)).Select
            With Selection.Borders(xlEdgeLeft)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeTop)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeBottom)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlEdgeRight)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With
            With Selection.Borders(xlInsideVertical)
                .LineStyle = xlContinuous
                .ThemeColor = 3
                .TintAndShade = -0.749992370372631
                .Weight = xlThin
            End With

          End If ' ��������� ����� ������ ��������� � ��������
          
          ' ����� ��������� (� �/�) - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).HorizontalAlignment = xlCenter
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 1).VerticalAlignment = xlCenter

          ' ���������
          str_���������i = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 3).Value
          
          ' ��������� - "���������� �� ������"
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("B" + CStr(12 + �����_������� + 4 + �����_���������) + ":D" + CStr(12 + �����_������� + 4 + �����_���������)).WrapText = True
          ' ��������� - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).HorizontalAlignment = xlLeft
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).VerticalAlignment = xlTop
          ' ��������� - ������ ������
          Workbooks(FileProtocolName).Sheets("��������_��������").Range(CStr(12 + �����_������� + 4 + �����_���������) + ":" + CStr(12 + �����_������� + 4 + �����_���������)).RowHeight = lineHeight(str_���������i, 15, 37) ' 20 - ����
          ' ��������� - ������ � ��������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 2).Value = str_���������i

          ' �������������
          ' ������� 1 - ��������� � ���
          ' Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).Value = ThisWorkbook.Sheets("����").Cells(�_���_Row - 1, �_���_Column - 4).Value + " " + ThisWorkbook.Sheets("����").Cells(�_���_Row - 1, �_���_Column - 3).Value
          ' ������� 2 - ���
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 5).Value
          
          ' ������������� - "���������� �� ������"
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("E" + CStr(12 + �����_������� + 4 + �����_���������) + ":E" + CStr(12 + �����_������� + 4 + �����_���������)).WrapText = True
          ' ������������� - ������������ �� ��������� � �����������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).VerticalAlignment = xlTop
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 5).HorizontalAlignment = xlCenter
          
          ' ���� ����������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).Value = CStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 8).Value)
          ' ���� ���������� - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).HorizontalAlignment = xlCenter
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 6).VerticalAlignment = xlTop
          
          ' ������ ����������/�����������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 7).Value = Workbooks("ToDo").Sheets("����1").Cells(rowCount, 9).Value + " (�. " + CStr(Workbooks("ToDo").Sheets("����1").Cells(rowCount, 12).Value) + " ����.�" + Workbooks("ToDo").Sheets("����1").Cells(rowCount, 10).Value + ")"
          ' ������������� - "���������� �� ������" ��� "G39:H39"
          Workbooks(FileProtocolName).Sheets("��������_��������").Range("G" + CStr(12 + �����_������� + 4 + �����_���������) + ":H" + CStr(12 + �����_������� + 4 + �����_���������)).WrapText = True
          ' ���� ���������� - ������������ �� ������ � �� ���������
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 7).HorizontalAlignment = xlCenter
          Workbooks(FileProtocolName).Sheets("��������_��������").Cells(12 + �����_������� + 4 + �����_���������, 7).VerticalAlignment = xlCenter
          
          ' ���� ������ ��������� � ToDo.Task_Status = 0, �.�. ������ ��� �� �������, �� ������ � ToDo.Protocol_Number2, ToDo.Protocol_Date2, ToDo.Protocol_Question_number2
          If Workbooks("ToDo").Sheets("����1").Cells(rowCount, 7).Value = 0 Then
            
             ' ToDo.Protocol_Number2
             Workbooks("ToDo").Sheets("����1").Cells(rowCount, 13).Value = ThisWorkbook.Sheets("����").Range("G2").Value
             
             ' ToDo.Protocol_Date2
             Workbooks("ToDo").Sheets("����1").Cells(rowCount, 14).Value = getDateFromProtocolNumber(ThisWorkbook.Sheets("����").Range("G2").Value)
             
             ' ToDo.Protocol_Question_number2 = �����_���������
             Workbooks("ToDo").Sheets("����1").Cells(rowCount, 15).Value = �����_���������
             
          End If
          
 
          
        End If ' ���� Protocol_Number<>"" � Protocol_Number2=""
        
        ' ��������� ������
        DoEvents
        rowCount = rowCount + 1
      Loop ' Do While
    
    
    ' ����� ������������ ����� ������ ��� ������ ����������������������
    If �����_��������� < 6 Then
      ' ����� ���������
      �����_��������� = 6
      
      ' ������� ��������� ����� � ���������� �
      
    End If
    
    ' ��� ������� ��� ����������
    ���������������������� = (12 + �����_������� + 4 + �����_���������) + 2
    Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
    Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 2).Value = "����������� ��������� �� �������� ���������� �������"
    Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 7).Value = "������� �.�."
    ���������������������� = ���������������������� + 1
    Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
    ���������������������� = ���������������������� + 1
    Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
    
    ' � ���������� �����������: (�� ����������� �����) - ���������� �������������� � �������������
    Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 2).Value = "C ���������� ����������� (�� ����������� �����):"
    ' Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 2).Font.Underline = xlUnderlineStyleSingle
    ���������������������� = ���������������������� + 1
    Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
    '
    ���������_��_��������_Range = RangeByValue(ThisWorkbook.Name, "����", "���������_��_��������", 100, 100)
    ���������_��_��������_Row = ThisWorkbook.Sheets("����").Range(���������_��_��������_Range).Row
    ���������_��_��������_Column = ThisWorkbook.Sheets("����").Range(���������_��_��������_Range).Column
    rowCount = ���������_��_��������_Row + 1
    Do While ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column).Value <> "�����_��_��������"
      
      ' ���� ��� <>0
      If ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 1).Value <> 0 Then

        ' ���������_�_��� = ThisWorkbook.Sheets("����").Cells(RowCount, ���������_��_��������_Column + 4).Value + " " + �������_�_���(ThisWorkbook.Sheets("����").Cells(RowCount, ���������_��_��������_Column + 1).Value, 3)
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 2).Value = ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 4).Value
        Workbooks(FileProtocolName).Sheets("��������_��������").Cells(����������������������, 6).Value = �������_�_���(ThisWorkbook.Sheets("����").Cells(rowCount, ���������_��_��������_Column + 1).Value, 3)
        ���������������������� = ���������������������� + 1
        Call InsertRow_InProtocol(FileProtocolName, "��������_��������", ����������������������)
      
      End If
         
      ' ��������� ������
      rowCount = rowCount + 1
    Loop
 
    ' ��������� ������ ��� �������� (� "������ �����������:"):
    range_������_����������� = RangeByValue(ThisWorkbook.Name, "����", "������ �����������:", 100, 100)
    row_������_����������� = ThisWorkbook.Sheets("����").Range(range_������_�����������).Row
    column_������_����������� = ThisWorkbook.Sheets("����").Range(range_������_�����������).Column
    '
    ThisWorkbook.Sheets("����").Cells(row_������_�����������, column_������_����������� + 2).Value = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,��,���1,���2,���3,���4,���5,����,����,���", 2)
    ThisWorkbook.Sheets("����").Cells(row_������_�����������, column_������_����������� + 3).Value = " "
    
    ' ���������� � ������ A1
    Workbooks(FileProtocolName).Sheets("��������_��������").Range("A1").Select
    
    ' �������� ����� � ���������� ��������
    Workbooks(FileProtocolName).Close SaveChanges:=True
    
    ' ����������� ���� ������
    ThisWorkbook.Sheets("����").Cells(1, 17).Value = "��������� ���: �������� ���������-����� � ������� �" + ThisWorkbook.Sheets("����").Cells(2, 7).Value + " �� " + CStr(dateProtocol(ThisWorkbook.Sheets("����").Range("G2").Value)) + " �."
    
    ' ����������� ���� � ������ 1 � 2 �� ����� ����
    ThisWorkbook.Sheets("����").Cells(1, 15).Value = "#protocol"
    ThisWorkbook.Sheets("����").Cells(3, 15).Value = "#protocol_" + ThisWorkbook.Sheets("����").Cells(2, 7).Value
    
    ' ��������� ������� BASE\ToDo
    CloseBook ("ToDo")
 
    ' ���������� ���������
    ThisWorkbook.Save

    MsgBox ("�������� �����������!")
    
  End If ' ������ �� ������������
  
End Sub


' �������� ������� ���� �� ������ � ��������
Sub add_Focus()
Dim rowCount As Integer
  
  ' ������ �� �������� �� ����8 "B5" ����� �����
  If MsgBox("�������� � �������� ������� ���� " + ���������2(DashboardDate()) + "?", vbYesNo) = vbYes Then
    
    Application.StatusBar = "����� ������� ���..."
    
    ' ��������� ������� MBO
    ' ��������� BASE\Sales
    OpenBookInBase ("MBO")
    ' ThisWorkbook.Sheets("����8").Activate

    
    ' ��������� DB
    ' ������_��������_������ = ""
    ������_�_������ = ""

    ' ������ ����� �����
    ������_�����_����� = False

    ' ��������� �������� � ��������
    ���������_�������� = 0

    ' 1. ��
    ��������_��������_��_��� = "           �� � �������,            ��� ������ ��"
    
    rowCount = rowByValue(ThisWorkbook.Name, "����8", "����� �� ��� ����������", 500, 500)
    Do While ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value <> ""
    
      ' ���� ���������� ������ �����, �� ������_�_������ ��������
      If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "����� �� ��� ����������") <> 0) Then
        
        ' ������ ����� �����
        ������_�����_����� = True
        
        ' ��� �����
        ���_����� = "��"
        ���_�����_�_������_�_������ = "��"

        ' ������� ������� ��� �����
        �������_�������_���_����� = 0
        
      End If
    
      ' ��: ���� ������� �� �������� ����
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value < 1) And (InStr(��������_��������_��_���, ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) <> 0) Then
      
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
      
        ' ������ ���������
        ������_��������� = ������_��������� + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (+" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 13).Value, 0)) + ")___, "
      
      
      End If
    
      ' �� ���� �������� �� �������� ��� - ����� �� 20-�� ������� ����8 �������
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 20).Value < 1) And (InStr(��������_��������_��_���, ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) <> 0) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value = "") Then
        
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 20).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
        
        ' ������ ���������
        ������_��������� = ������_��������� + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (+" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 13).Value, 0)) + ")___, "
      
      End If
    
    
      ' ���� ���� ����� ����������
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������") Then
        
        ' �������� ������ � �������� ��������
        If �������_�������_���_����� <> 0 Then
          
          ' ��������� ������
          Call �������_������_�_��������(���_�����, _
                                           ���_�����_�_������_�_������ + " ������� ���. �� " + quarterName2(dateDB_����_8) + ": " + ������_�_������ + " ������ ���������: ������ ___, " + ������_���������, _
                                             "")
          ' ��������� �������� � ��������
          ���������_�������� = ���������_�������� + 1
          
        End If
        
        ' ������ ����� �����
        ������_�����_����� = False
      
        ' �������� ������
        ������_�_������ = ""
        ������_��������� = ""
      
      End If
    
      ' ��������� ������
      Application.StatusBar = "������ ��������� " + CStr(rowCount) + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
  
    Loop

    
    ' 2. ��� =========================================================================================================
    '  ���������� ���
    ��������_��������_���_��� = "���������� ����� 18+, �������� �� 18+, ��._������� ,            �� � ��"
    
    rowCount = rowByValue(ThisWorkbook.Name, "����8", "����� �� ��� ����������", 500, 500)
    Do While ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value <> ""
    
      ' ���� ���������� ������ �����, �� ������_�_������ ��������
      If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "����� �� ��� ����������") <> 0) Then
        
        ' ������ ����� �����
        ������_�����_����� = True
        
        ' ��� �����
        ���_����� = "���"
        ���_�����_�_������_�_������ = "���"

        ' ������� ������� ��� �����
        �������_�������_���_����� = 0
        
      End If
    
      ' ���: ���� ������� �� �������� ����
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value < 1) And (InStr(��������_��������_���_���, ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) <> 0) Then
      
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
      
      End If
    
      ' ��� ���� �������� �� �������� ��� - ����� �� 20-�� ������� ����8 �������
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 20).Value < 1) And (InStr(��������_��������_���_���, ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) <> 0) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value = "") Then
        
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 20).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
      
      End If
    
    
      ' ���� ���� ����� ����������
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������") Then
        
        ' �������� ������ � �������� ��������
        If �������_�������_���_����� <> 0 Then
          
          ' ��������� ������
          Call �������_������_�_��������(���_�����, _
                                           ���_�����_�_������_�_������ + " ������� ���. �� " + quarterName2(dateDB_����_8) + ": " + ������_�_������ + " ������ ���������: ������.���������___, ������ ����___, ������ ����___, �� � ��___", _
                                             "")
          ' ��������� �������� � ��������
          ���������_�������� = ���������_�������� + 1
          
        End If
        
        ' ������ ����� �����
        ������_�����_����� = False
      
        ' �������� ������
        ������_�_������ = ""
        ������_��������� = ""

      End If
    
      ' ��������� ������
      Application.StatusBar = "������ ��������� " + CStr(rowCount) + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
  
    Loop
    
    
    ' 3. ��� =================================================================================================
    '  ���������� ���
    ��������_��������_���_��� = "� �.�. �� DSA,            �� DSA"
    
    rowCount = rowByValue(ThisWorkbook.Name, "����8", "����� �� ��� ����������", 500, 500)
    Do While ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value <> ""
    
      ' ���� ���������� ������ �����, �� ������_�_������ ��������
      If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "����� �� ��� ����������") <> 0) Then
        
        ' ������ ����� �����
        ������_�����_����� = True
        
        ' ��� �����
        ���_����� = "���"
        ���_�����_�_������_�_������ = "���"

        ' ������� ������� ��� �����
        �������_�������_���_����� = 0
        
      End If
    
      ' ���: ���� ������� �� �������� ����
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value < 1) And (InStr(��������_��������_���_���, ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) <> 0) Then
      
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
      
        ' ������ ���������
        ������_��������� = ������_��������� + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (+" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 13).Value, 0)) + ")___, "
      
      End If
    
      ' ��� ���� �������� �� �������� ��� - ����� �� 20-�� ������� ����8 �������
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 20).Value < 1) And (InStr(��������_��������_���_���, ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) <> 0) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value = "") Then
        
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 20).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
      
        ' ������ ���������
        ������_��������� = ������_��������� + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (+" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 13).Value, 0)) + ")___, "
      
      End If
    
    
      ' ���� ���� ����� ����������
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������") Then
        
        ' �������� ������ � �������� ��������
        If �������_�������_���_����� <> 0 Then
          
          ' ��������� ������
          Call �������_������_�_��������(���_�����, _
                                           ���_�����_�_������_�_������ + " ������� ���. �� " + quarterName2(dateDB_����_8) + ": " + ������_�_������ + " ������ ���������: " + ������_���������, _
                                             "")
          ' ��������� �������� � ��������
          ���������_�������� = ���������_�������� + 1
          
        End If
        
        ' ������ ����� �����
        ������_�����_����� = False
      
        ' �������� ������
        ������_�_������ = ""
        ������_��������� = ""

      End If
    
      ' ��������� ������
      Application.StatusBar = "������ ��������� " + CStr(rowCount) + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
  
    Loop


    ' 4. �� ��������� (����) ============================================================
    
    ' ���������� �������� ������ ������
    ��������_��������_����_������ = "��������������� �������, � �.�. �� ����,            �� OPC, Orange Premium Club, ������������ �����, �������, ������, ������ OPC, ������ ������ ������, ������ ������ ������ OPC"
    
    rowCount = rowByValue(ThisWorkbook.Name, "����8", "��������� ���", 100, 100) + 2
    Do While (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "������������ ������� �� ������") = 0)
    
      ' ���� ���������� ������ �����, �� ������_�_������ ��������
      If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������") <> 0) Then
        
        ' ������ ����� �����
        ������_�����_����� = True
        
        ' ��� �����
        ���_����� = cityOfficeName(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value)
        ���_�����_�_������_�_������ = ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value + " (����)"

        ' ������� ������� ��� �����
        �������_�������_���_����� = 0
        
      End If
    
      ' ������ (����): ���� ������� �� �������� ����
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value < 1) And (InStr(��������_��������_����_������, ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) <> 0) Then
      
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
      
      End If
    
      ' ������ (����): ���� �������� �� �������� ��� (��������)
      If (������_�����_����� = True) And (InStr(��������_��������_����_������, ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) <> 0) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value = "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 7).Value < 1) Then
        
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 7).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
      
      End If
    
    
      ' ���� ���� ����� ����������
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������") Then
        
        ' �������� ������ � �������� ��������
        If �������_�������_���_����� <> 0 Then
          
          ' ��������� ������
          Call �������_������_�_��������(���_�����, _
                                           ���_�����_�_������_�_������ + " ������� ���. �� " + quarterName2(dateDB_����_8) + ": " + ������_�_������, _
                                             "")
          ' ��������� �������� � ��������
          ���������_�������� = ���������_�������� + 1
          
        End If
        
        ' ������ ����� �����
        ������_�����_����� = False
      
        ' �������� ������
        ������_�_������ = ""
        ������_��������� = ""

      End If
    
      ' ��������� ������
      Application.StatusBar = "������ ��������� " + CStr(rowCount) + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
  
    Loop

    ' 5. ����������� ����� (������, �������������, ����� �������, �����-����) ��� - ������������ �������� �� ������ � ����� �� ����8 ================================================================================================
    rowCount = rowByValue(ThisWorkbook.Name, "����8", "�� �����������", 100, 100) - 1
    Do While (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "������������ ������� �� ������") = 0)
    
      ' ���� ���������� ������ �����, �� ������_�_������ ��������
      ' If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "����������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������������") Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������������")) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�����-����") <> 0)) Then
      If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "����������") <> 0) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������������") Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������������")) Or (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "�����-����") <> 0)) Then
        
        ' ������ ����� �����
        ������_�����_����� = True
        
        ' ��� �����
        ���_����� = cityOfficeName(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value)
        ���_�����_�_������_�_������ = ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value

        ' �� �� "���������" ��������� "(����)"
        ' If (InStr(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value, "���������") <> 0) Then
        '   ���_�����_�_������_�_������ = ���_�����_�_������_�_������ + " (����)"
        ' End If

        ' ������� ������� ��� �����
        �������_�������_���_����� = 0
        
      End If
    
      ' ���� ������� �� �������� ����
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value < 1) And ((ThisWorkbook.Sheets("����8").Cells(rowCount, 3).Value <> "") Or (����������_MBO(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) = True)) Then
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
        
        ' ������ ���������
        ������_��������� = ������_��������� + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (+" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 13).Value, 0)) + ")___, "
        
      End If
    
      ' ���� �������� �� �������� ��� (��������)
      If (������_�����_����� = True) And ((ThisWorkbook.Sheets("����8").Cells(rowCount, 3).Value <> "") Or (����������_MBO(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) = True)) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 8).Value = "") And (ThisWorkbook.Sheets("����8").Cells(rowCount, 7).Value < 1) Then
        ������_�_������ = ������_�_������ + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 7).Value * 100, 0)) + "%), "
        �������_�������_���_����� = �������_�������_���_����� + 1
          
        ' ������ ���������
        If ThisWorkbook.Sheets("����8").Cells(rowCount, 13).Value <> "" Then
          ������_��������� = ������_��������� + ����(ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value) + " (+" + CStr(Round(ThisWorkbook.Sheets("����8").Cells(rowCount, 13).Value, 0)) + ")___, "
        End If
  
      End If
    
    
      ' ���� ���� ����� ����������
      If (������_�����_����� = True) And (ThisWorkbook.Sheets("����8").Cells(rowCount, 2).Value = "�������") Then
        
        ' �������� ������ � �������� ��������
        If �������_�������_���_����� <> 0 Then
          
          ' ��������� ������
          Call �������_������_�_��������(���_����� + " (" + CStr(�������_�������_���_�����) + ")", _
                                           ���_�����_�_������_�_������ + " ������� ���. �� " + quarterName2(dateDB_����_8) + ": " + ������_�_������ + " ������ ���������: " + ������_���������, _
                                             "")
          ' ��������� �������� � ��������
          ���������_�������� = ���������_�������� + 1
          
        End If
        
        ' ������ ����� �����
        ������_�����_����� = False
      
        ' �������� ������
        ������_�_������ = ""
        ������_��������� = ""
      
      End If
    
      ' ��������� ������
      Application.StatusBar = "������ ��������� " + CStr(rowCount) + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
  
    Loop
  
    ' �����
    ' ������_��������_������ = ������_��������_������ + ������_�_������ + Chr(13)
  
    ' ��������� ������� MBO
    ' ��������� BASE\Sales
    CloseBook ("MBO")
    ' ThisWorkbook.Sheets("����8").Activate
  
    Application.StatusBar = ""
    
    MsgBox ("��������� " + CStr(���������_��������) + " ��������!")
    
  End If
  
End Sub

' ����������� ����� �� ����������
Sub moveInListUp2()
Dim ������_���������_����������, �������_�����, �������_�������������, �������_���������, �������_����, �������_�_To_Do, ����_�����, ����_�������������, ����_���������, ����_����, ����_�_ToDo As String
Dim �����������_��������_���, ������������_��������_���, �������_Row, �������_Column As Byte

  ' ����������, ��� ��������� ������� ������
  ������_���������_���������� = RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)
  �����������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Row
  ������������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Column
  '
  If (ActiveCell.Row >= �����������_���������_���������� + 2) And (ActiveCell.Row <= �����������_���������_���������� + 52) And (ActiveCell.Column >= ������������_���������_���������� - 1) And ((ActiveCell.Column <= ������������_���������_���������� + 13)) Then
      ' ����������
      �������_Row = ActiveCell.Row
      �������_Column = ActiveCell.Column
      ' ���������� �������
      �������_����� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� - 1).Value
      �������_������������� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_����������).Value
      �������_��������� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 2).Value
      �������_���� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 1).Value
      �������_�_To_Do = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 13).Value
      ' ���������� ����
      ' ����_Row = �������_Row + 1
      ����_����� = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_���������� - 1).Value
      ����_������������� = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_����������).Value
      ����_��������� = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_���������� + 2).Value
      ����_���� = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_���������� + 1).Value
      ����_�_ToDo = ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_���������� + 13).Value
      ' ������ �������:
      ' ������� ������ � ����:
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_���������� - 1).Value = �������_�����
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_����������).Value = �������_�������������
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_���������� + 2).Value = �������_���������
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_���������� + 1).Value = �������_����
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, ������������_���������_���������� + 13).Value = �������_�_To_Do
      ' ���� ������ � �������:
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� - 1).Value = ����_�����
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_����������).Value = ����_�������������
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 2).Value = ����_���������
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 1).Value = ����_����
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 13).Value = ����_�_ToDo
      ' ������������� �� ������ ����
      ThisWorkbook.Sheets("����").Cells(�������_Row - 1, �������_Column).Select
      ' ���������� ������������� ������
      Call createNumberingTask
    Else
      MsgBox ("������� ������ � ��������� ���������_����������!")
  End If
End Sub

' ����������� ������ � �������� �������� ����
Sub moveInListDown2()
Dim ������_���������_����������, �������_�����, �������_�������������, �������_���������, �������_����, �������_�_ToDo, ����_�����, ����_�����������, ����_����, ����_HashTag, ����_������� As String
Dim �����������_���������_����������, ������������_���������_����������, �������_Row, �������_Column As Byte

  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_���������_���������� = RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)
  �����������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Row
  ������������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Column
  '
  If (ActiveCell.Row >= �����������_���������_���������� + 2) And (ActiveCell.Row <= �����������_���������_���������� + 52) And (ActiveCell.Column >= ������������_���������_���������� - 1) And ((ActiveCell.Column <= ������������_���������_���������� + 13)) Then
      ' ����������
      �������_Row = ActiveCell.Row
      �������_Column = ActiveCell.Column
      ' ���������� �������
      �������_����� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� - 1).Value
      �������_������������� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_����������).Value
      �������_��������� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 2).Value
      �������_���� = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 1).Value
      �������_�_ToDo = ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 13).Value
      ' ���������� ����
      ' ����_Row = �������_Row + 1
      ����_����� = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_���������� - 1).Value
      ����_����������� = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_����������).Value
      ����_���� = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_���������� + 2).Value
      ����_HashTag = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_���������� + 1).Value
      ����_������� = ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_���������� + 13).Value
      ' ������ �������:
      ' ������� ������ � ����:
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_���������� - 1).Value = �������_�����
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_����������).Value = �������_�������������
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_���������� + 2).Value = �������_���������
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_���������� + 1).Value = �������_����
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, ������������_���������_���������� + 13).Value = �������_�_ToDo
      ' ���� ������ � �������:
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� - 1).Value = ����_�����
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_����������).Value = ����_�����������
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 2).Value = ����_����
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 1).Value = ����_HashTag
      ThisWorkbook.Sheets("����").Cells(�������_Row, ������������_���������_���������� + 13).Value = ����_�������
      ' ������������� �� ������ ����
      ThisWorkbook.Sheets("����").Cells(�������_Row + 1, �������_Column).Select
      ' ���������� ������������� ������
      Call createNumberingTask
    Else
      MsgBox ("������� ������ � ��������� ���������_����������!")
  End If

End Sub

' �������� ������ �� ��������� ����������
Sub deleteFromList2()
Dim ������_���������_���������� As String
Dim �����������_���������_����������, ������������_���������_���������� As Byte

  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_���������_���������� = RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)
  �����������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Row
  ������������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Column
  '
  If (ActiveCell.Row >= �����������_���������_���������� + 2) And (ActiveCell.Row <= �����������_���������_���������� + 52) And (ActiveCell.Column >= ������������_���������_���������� - 1) And ((ActiveCell.Column <= ������������_���������_���������� + 13)) And (ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_���������� + 1).Value <> "") Then
    '
    If MsgBox("������� ������ �" + CStr(ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_���������� - 1).Value) + " �� ��������?", vbYesNo) = vbYes Then
      ' �������
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_���������� - 1).Value = ""
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_����������).Value = ""
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_���������� + 2).Value = ""
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_���������� + 1).Value = ""
      ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_���������� + 13).Value = ""
    End If
  Else
    MsgBox ("������� ������ � ��������� ���������_����������!")
  End If
  
End Sub

' ��������� ���� �� ������ ��������� NN-��������
Function getDateFromProtocolNumber(In_ProtocolNumber) As Date
  
  �������_���� = InStr(In_ProtocolNumber, "-")

  getDateFromProtocolNumber = CDate(Mid(In_ProtocolNumber, �������_���� + 1, 2) + "." + Mid(In_ProtocolNumber, �������_���� + 3, 2) + "." + Mid(In_ProtocolNumber, �������_���� + 5, 4))
  
End Function


' ����������� ��������� � To-Do
Sub copyTaskInToDo()
  
  ' ������
  If MsgBox("����������� ��������� � To-Do?", vbYesNo) = vbYes Then
    
    ' ��������� ������� BASE\ToDo
    OpenBookInBase ("ToDo")

    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("����").Activate

    ' ������ �������
    Application.StatusBar = "�����������..."

    ' �� ������ ������ �������� ������
    ' Call createNumberingTask

    �����������_���������_���������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)).Row
    ������������_���������_���������� = ThisWorkbook.Sheets("����").Range(RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)).Column
    
    rowCount = 2
    Do While ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, 19).Value <> ""
      
      ' Id_Task �� G2 + ����� �������
      Id_TaskVar = Replace(ThisWorkbook.Sheets("����").Range("G2").Value, "-", "") + CStr(ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, ������������_���������_���������� - 1).Value)
      
      ' ������ ������ � BASE\Sales �� ��.
      Call InsertRecordInBook("ToDo", "����1", "Id_Task", Id_TaskVar, _
                                            "Date_Create", getDateFromProtocolNumber(ThisWorkbook.Sheets("����").Range("G2").Value), _
                                              "Id_Task", Id_TaskVar, _
                                                "Task", ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, ������������_���������_���������� + 2).Value, _
                                                  "Lotus_subject", ThisWorkbook.Sheets("����").Cells(1, 17).Value, _
                                                    "Responsible", ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, ������������_���������_����������).Value, _
                                                      "Lotus_hashtag", "#" + Id_TaskVar, _
                                                        "Task_Status", 1, _
                                                          "Date_Control", ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, ������������_���������_���������� + 1).Value, _
                                                            "Comment", "� ������", _
                                                              "Protocol_Number", ThisWorkbook.Sheets("����").Range("G2").Value, _
                                                                "Protocol_Date", getDateFromProtocolNumber(ThisWorkbook.Sheets("����").Range("G2").Value), _
                                                                  "Protocol_Question_number", ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, ������������_���������_���������� - 1).Value, _
                                                                    "", "", _
                                                                      "", "", _
                                                                        "", "", _
                                                                          "", "", _
                                                                            "", "", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "")
      ' ��������
      ThisWorkbook.Sheets("����").Cells(�����������_���������_���������� + rowCount, ������������_���������_���������� + 13).Value = 1
      
      ' ��������� ������
      rowCount = rowCount + 1
    Loop


    
    Application.StatusBar = "����������..."
    
    ' ��������� ������� BASE\ToDo
    CloseBook ("ToDo")
 
    ' ������ �������
    Application.StatusBar = ""

    MsgBox ("���������� " + CStr(rowCount - 2) + " ��������!")
    
  End If
  
End Sub

' �������� ��������������
Sub addResponsibleSheet8(In_�_���)
  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_���������_���������� = RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)
  �����������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Row
  ������������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Column
  ' ��������� �������� ������
  If (ActiveCell.Row >= �����������_���������_���������� + 2) And (ActiveCell.Row <= �����������_���������_���������� + 52) And (ActiveCell.Column >= ������������_���������_���������� - 1) And ((ActiveCell.Column <= ������������_���������_���������� + 13)) Then
    ' �������������:
    ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_����������).Value = getFromAddrBook(In_�_���, 3)
  Else
    MsgBox ("������� ������ � ��������� ���������_����������!")
  End If
End Sub

' �������� ������������
Sub addSpeakerSheet8(In_�_���)
  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_��������_��� = RangeByValue(ThisWorkbook.Name, "����", "��������_���", 100, 100)
  �����������_��������_��� = ThisWorkbook.Sheets("����").Range(������_��������_���).Row
  ������������_��������_��� = ThisWorkbook.Sheets("����").Range(������_��������_���).Column
  
  ' ��������� �������� ������
  If (ActiveCell.Row >= �����������_��������_��� + 2) And (ActiveCell.Row <= �����������_��������_��� + 52) And (ActiveCell.Column >= ������������_��������_��� - 1) And ((ActiveCell.Column <= ������������_��������_��� + 13)) Then
    ' �������������:
    ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_��������_���).Value = getFromAddrBook(In_�_���, 3)
  Else
    MsgBox ("������� ������ � ��������� ��������_���!")
  End If
  
End Sub


' �������� �������������� ���
Sub addResponsibleSheet8_���()
  Call addResponsibleSheet8("���")
End Sub


' �������� �������������� ����
Sub addResponsibleSheet8_����()
  Call addResponsibleSheet8("����")
End Sub

' �������� �������������� �������1
Sub addResponsibleSheet8_�������1()
  Call addResponsibleSheet8("�������1")
End Sub

' �������� �������������� ���2
Sub addResponsibleSheet8_���2()
  Call addResponsibleSheet8("���2")
End Sub

' �������� �������������� �������2
Sub addResponsibleSheet8_�������2()
  Call addResponsibleSheet8("�������2")
End Sub

' �������� �������������� ���3
Sub addResponsibleSheet8_���3()
  Call addResponsibleSheet8("���3")
End Sub

' �������� �������������� �������3
Sub addResponsibleSheet8_�������3()
  Call addResponsibleSheet8("�������3")
End Sub

' �������� �������������� ���4
Sub addResponsibleSheet8_���4()
  Call addResponsibleSheet8("���4")
End Sub

' �������� �������������� �������4
Sub addResponsibleSheet8_�������4()
  Call addResponsibleSheet8("�������4")
End Sub

' �������� �������������� ���5
Sub addResponsibleSheet8_���5()
  Call addResponsibleSheet8("���5")
End Sub

' �������� �������������� �������5
Sub addResponsibleSheet8_�������5()
  Call addResponsibleSheet8("�������5")
End Sub

' �������� ���� ����������
Sub addDateEndSheet8(In_DateEnd)
  ' ����������, ��� ��������� ������� ������. ������ ���� �������� A62:N90 (� ������������� �� "��������_���" �����������)
  ������_���������_���������� = RangeByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)
  �����������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Row
  ������������_���������_���������� = ThisWorkbook.Sheets("����").Range(������_���������_����������).Column
  ' ��������� �������� ������
  If (ActiveCell.Row >= �����������_���������_���������� + 2) And (ActiveCell.Row <= �����������_���������_���������� + 52) And (ActiveCell.Column >= ������������_���������_���������� - 1) And ((ActiveCell.Column <= ������������_���������_���������� + 13)) Then
    ' �������������:
    ThisWorkbook.Sheets("����").Cells(ActiveCell.Row, ������������_���������_���������� + 1).Value = In_DateEnd
  Else
    MsgBox ("������� ������ � ��������� ���������_����������!")
  End If
End Sub

' �������� ���� ���������� - �� �������
Sub addDateEndSheet8_�������()
  Call addDateEndSheet8(weekEndDate(Date) - 2)
End Sub

' �������� ���� ���������� - �� ����� ������
Sub addDateEndSheet8_�����������()
  Call addDateEndSheet8(Date_last_day_month(Date))
End Sub

' �������� ���� ���������� - �� ����� ��������
Sub addDateEndSheet8_�������������()
  Call addDateEndSheet8(Date_last_day_quarter(Date))
End Sub

' �������� ������ � ���������_����������
Sub �������_������_�_���������_����������(In_FIO, In_DateEnd, In_Task)
Dim ���������������_����, ����������������_���� As Byte

    
    ���������������_���� = rowByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)
    ����������������_���� = ColumnByValue(ThisWorkbook.Name, "����", "���������_����������", 100, 100)
    
    ' ������� �� ���� "����"
    i = ���������������_���� + 2
    �����_��������� = 0
    Do While ThisWorkbook.Sheets("����").Cells(i, ����������������_���� + 2).Value <> ""
      �����_��������� = �����_��������� + 1
      i = i + 1
    Loop
    
    �����_��������� = �����_��������� + 1
    
    ' � ���������
    ThisWorkbook.Sheets("����").Cells(i, ����������������_���� - 1).Value = �����_���������
    ' �������������
    ThisWorkbook.Sheets("����").Cells(i, ����������������_����).Value = In_FIO
    ' ���� ��������
    ThisWorkbook.Sheets("����").Cells(i, ����������������_���� + 1).Value = In_DateEnd
    ' ���������
    ThisWorkbook.Sheets("����").Cells(i, ����������������_���� + 2).Value = In_Task
    ' ����������� � To-Do 0/1
    ThisWorkbook.Sheets("����").Cells(i, ����������������_���� + 13).Value = 0

End Sub


' �������� ������������ ����
Sub addSpeakerSheet8_����()
  Call addSpeakerSheet8("����")
End Sub

' �������� ������������ ���
Sub addSpeakerSheet8_���()
  Call addSpeakerSheet8("���")
End Sub

' �������� ������������ �������1
Sub addSpeakerSheet8_�������1()
  Call addSpeakerSheet8("�������1")
End Sub

' �������� ������������ ���2
Sub addSpeakerSheet8_���2()
  Call addSpeakerSheet8("���2")
End Sub

' �������� ������������ �������2
Sub addSpeakerSheet8_�������2()
  Call addSpeakerSheet8("�������2")
End Sub

' �������� ������������ ���3
Sub addSpeakerSheet8_���3()
  Call addSpeakerSheet8("���3")
End Sub

' �������� ������������ �������3
Sub addSpeakerSheet8_�������3()
  Call addSpeakerSheet8("�������3")
End Sub

' �������� ������������ ���4
Sub addSpeakerSheet8_���4()
  Call addSpeakerSheet8("���4")
End Sub

' �������� ������������ �������4
Sub addSpeakerSheet8_�������4()
  Call addSpeakerSheet8("�������4")
End Sub

' �������� ������������ ���5
Sub addSpeakerSheet8_���5()
  Call addSpeakerSheet8("���5")
End Sub

' �������� ������������ �������5
Sub addSpeakerSheet8_�������5()
  Call addSpeakerSheet8("�������5")
End Sub

