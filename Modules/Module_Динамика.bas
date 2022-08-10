Attribute VB_Name = "Module_��������"
' *** ���� �������� ***

' *** ���������� ���������� ***
' Public numStr_����8 As Integer
' ***                       ***

' �������� ������ �� �����, ���������, �������
Sub ��������_������()
Attribute ��������_������.VB_ProcData.VB_Invoke_Func = " \n14"
Dim �����_���������_������� As Integer

  ' ������
  If MsgBox("������������ ����� ������?", vbYesNo) = vbYes Then
    
    ' ������ "����� Dyn_1"
    row_�����_Dyn_1 = rowByValue(ThisWorkbook.Name, "��������", "����� Dyn_1", 100, 100)
    
    ' ������� �����
    Call clear�ontents2(ThisWorkbook.Name, "��������", "C9", "I23")
    
    ' ������ "����� Dyn_2"
    row_�����_Dyn_2 = rowByValue(ThisWorkbook.Name, "��������", "����� Dyn_2", 100, 100)
    
    ' ������� ����� 2
    Call clear�ontents2(ThisWorkbook.Name, "��������", "A" + CStr(row_�����_Dyn_2 + 3), "P93")
    
    
    ' ��������� �������:
    ' ��������� BASE\Sales
    OpenBookInBase ("Sales_Office")
    
    ' ��������� BASE\Products
    OpenBookInBase ("Products")
        
    ' ����� �������� �� ����� ��������
    �����_��������_��_�����_�������� = 0
        
    �����_�����������_������_�����_Dyn_2 = row_�����_Dyn_2 + 2
        
    ' ������� ������
    rowCount = row_�����_Dyn_1 + 3
    Do While (ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value <> "") And (rowCount < ThisWorkbook.Sheets("��������").Range("M6").Value)
    
      ' ����� �������� �� ����� ��������
      �����_��������_��_�����_�������� = �����_��������_��_�����_�������� + 1
      
      ' ��.���.
      ThisWorkbook.Sheets("��������").Cells(rowCount, 3).Value = Product_Name_to_Unit(ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value)
      ThisWorkbook.Sheets("��������").Cells(rowCount, 3).NumberFormat = "@"
      ThisWorkbook.Sheets("��������").Cells(rowCount, 3).HorizontalAlignment = xlCenter

      ' "����� Dyn_2"
      �����_�����������_������_�����_Dyn_2 = �����_�����������_������_�����_Dyn_2 + 1
      '
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 1).Value = ThisWorkbook.Sheets("��������").Cells(rowCount, 1).Value
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 1).NumberFormat = "@"
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 1).HorizontalAlignment = xlCenter
      '
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 2).Value = ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 2).NumberFormat = "@"
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 2).HorizontalAlignment = xlLeft
      '
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 3).Value = Product_Name_to_Unit(ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value)
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 3).NumberFormat = "@"
      ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 3).HorizontalAlignment = xlCenter
      
      
      ' ���� �� 3-� �����
      For i = 1 To 3
        ' ������ ������ �� 1 �� 5
        Select Case i
          Case 1 ' 2019
            curr_year = 2019
            column_����_year = 4
            �����_���������_������� = 12
          Case 2 ' 2020
            curr_year = 2020
            column_����_year = 6
            �����_���������_������� = 12
          Case 3 ' 2021
            curr_year = 2021
            column_����_year = 8
            �����_���������_������� = ThisWorkbook.Sheets("��������").Range("Q6").Value ' 8
        End Select
        
        ' ���������
        If Year(Date) <> curr_year Then
          ThisWorkbook.Sheets("��������").Cells(row_�����_Dyn_1 + 2, column_����_year).Value = "���� '" + Mid(CStr(curr_year), 3, 2)
          ThisWorkbook.Sheets("��������").Cells(row_�����_Dyn_1 + 2, column_����_year + 1).Value = "���.����� '" + Mid(CStr(curr_year), 3, 2)
        Else
          
          ThisWorkbook.Sheets("��������").Cells(row_�����_Dyn_1 + 2, column_����_year).Value = "���� �� " + strDDMM(Date_last_day_month(CDate("01." + CStr(�����_���������_�������) + "." + CStr(Year(Date))))) ' ThisWorkbook.Sheets("����8").Range("F9").Value
          
          ' ���� ����� ����� �����_���������_�������, �� ���� ����� ����� � ����8
          If Month(CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))) = �����_���������_������� Then
            ThisWorkbook.Sheets("��������").Cells(row_�����_Dyn_1 + 2, column_����_year).Value = ThisWorkbook.Sheets("����8").Range("F9").Value
          End If
          
        End If
        
        ' ������ ��� �������� � ��� �� ������ �������
        �����_�����������_������_�����_Dyn_2 = �����_�����������_������_�����_Dyn_2 + 1
        ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 2).Value = Product_Name_to_Product_Code(ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value) + "_" + CStr(curr_year)
        ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 2).NumberFormat = "@"
        ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 2).HorizontalAlignment = xlRight

        
        ' ��������� �� ������� ����
        ����_����_��� = 0
        ����_����_��� = 0
        
        curr_month = 1
        Do While curr_month <= �����_���������_������� ' 12
        
          ' ����� ���� �� �����
          ����_������_��� = 0
          ����_������_��� = 0
          For office_number = 1 To 5
            
            ' ����� ���������� �� ������� 2
            In_Product_Code = Product_Name_to_Product_Code(ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value)
           
            ' ���������� ���� ������
            date_Var = CDate("01." + CStr(curr_month) + "." + CStr(curr_year))
            ����_�_Var = ����_�(date_Var, office_number, In_Product_Code)
            ����_������_��� = ����_������_��� + ����_�_Var
            ����_����_��� = ����_����_��� + ����_�_Var
            ' ���� ������ - ����_�
            ����_�_Var = ����_�(date_Var, office_number, In_Product_Code)
            ����_������_��� = ����_������_��� + ����_�_Var
            ����_����_��� = ����_����_��� + ����_�_Var
            
          Next office_number
          
          ' ����� �� 5-�� ������ �� ����� ���������
          ' �����_�����������_������_�����_Dyn_2 = �����_�����������_������_�����_Dyn_2 + 1
          ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 3 + curr_month).Value = ����_������_���
          ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 3 + curr_month).NumberFormat = "#,##0"
          ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, 3 + curr_month).HorizontalAlignment = xlRight

          
          ' ��������� ������
          Application.StatusBar = "����������: " + ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value + "..."
          curr_month = curr_month + 1
          DoEventsInterval (rowCount)
    
        Loop ' ��������� � 1 �� 12 ������� ����
        
        
        ' ����� ������ �� ����
        ' ����
        ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year).Value = ����_����_���
        ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year).HorizontalAlignment = xlRight
        
        ' ���� ��� ����, �� ����� �� �����_���������_�������
        If InStr(ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value, "����") <> 0 Then
          ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year).Value = ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year).Value / �����_���������_�������
        End If
        
        '  ���������� �����
        ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year + 1).Value = �����������(����_����_���, ����_����_���, 3)
        ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year + 1).NumberFormat = "0%"
        ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year + 1).HorizontalAlignment = xlRight
        ' ������� ������ �������� ' 70. ������� ������ ������ "��������" - �������� In_Value � %, In_Target � %
        Call Full_Color_RangeII("��������", rowCount, column_����_year + 1, ThisWorkbook.Sheets("��������").Cells(rowCount, column_����_year + 1).Value, 1)
        
        ' ����� ���� �� ������ �������
        Column_����� = 16
        ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, Column_�����).Value = ����_����_���
        ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, Column_�����).NumberFormat = "#,##0"
        ThisWorkbook.Sheets("��������").Cells(�����_�����������_������_�����_Dyn_2, Column_�����).HorizontalAlignment = xlRight
        
      Next i
        
      
      ' ��������� ������
      Application.StatusBar = "����������: " + ThisWorkbook.Sheets("��������").Cells(rowCount, 2).Value + "..."
      rowCount = rowCount + 1
      DoEventsInterval (rowCount)
    
    Loop

    
    ' ��������� �������:
    ' ��������� BASE\Products
    CloseBook ("Products")
    
    ' ��������� BASE\Sales
    CloseBook ("Sales_Office")

    
    
    MsgBox ("������� ������������!")
  
  End If

  
  
End Sub

' ���� ��������
Sub SaveFrom����_��������()

  ' �������� ����2
  ThisWorkbook.Sheets("��������").Copy

  '
  ' Workbooks("�����1").Sheets("����1").Paste

End Sub


' ������� ������ �� ������ �� �������
Sub �������_������_����_��������()

    ' ����� ��������� � �������� �� Y Range("C8:I9").Select
    ThisWorkbook.Sheets("Charts").Range("C9:I9").Select
    
    ' ���������� �������
    ActiveSheet.Shapes.AddChart2(332, xlLineMarkers, 1000, 150).Select
    
    ' ActiveChart.SetSourceData Source:=Range("�������!$C$8:$I$9")
    ActiveChart.SetSourceData Source:=ThisWorkbook.Sheets("Charts").Range("Charts!$C$8:$I$9")
    
    ActiveChart.ChartTitle.Select
    ActiveChart.Axes(xlValue).MajorGridlines.Select
    
    ' ������� ������������ �������
    ActiveChart.ChartTitle.Text = "������ ��"
    ActiveChart.ChartTitle.Format.TextFrame2.TextRange.Characters.Text = "������ ��"
    
    ' ������������ ������� ����
    ActiveChart.FullSeriesCollection(1).Name = "=""���_1"""
    
    ' ���������� ������� ����
    ActiveChart.PlotArea.Select
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(2).Name = "=""���_2"""
    ActiveChart.FullSeriesCollection(2).Values = "=Charts!$C$10:$I$10"
    
    ' ���������� �������� ���� - ������ ���� ����� ��������� FullSeriesCollection(2, ����� 3 � �.�.)
    ActiveChart.PlotArea.Select
    ActiveChart.SeriesCollection.NewSeries
    ActiveChart.FullSeriesCollection(3).Name = "=""���_3"""
    ActiveChart.FullSeriesCollection(3).Values = "=Charts!$C$11:$I$11"
    
    ' ���������� �������
    ' ActiveSheet.ChartObjects("��������� 23").Activate
    ActiveChart.SetElement (msoElementLegendRight)
    ' ActiveSheet.ChartObjects("��������� 23").Activate
    ' ActiveChart.Legend.Select
    ' ActiveChart.Legend.LegendEntries(1).Select
    ' Application.CommandBars("Format Object").Visible = False

    
End Sub

