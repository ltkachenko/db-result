Attribute VB_Name = "Module_��"
' *** ���� �� ***

' *** ���������� ���������� ***
' Public numStr_����8 As Integer
' ***                       ***

' �������� ����������� � �� �������� �� BASE\Birthdays
Sub ��������_�����������_��()

  ' ������ �������
  Application.StatusBar = "��: �������� �����������..."

  ' �������� ������� �� ����� "��"
  Call clear�ontents2(ThisWorkbook.Name, "��", "A9", "I28")

  ' ������� BASE\Birthdays
  OpenBookInBase ("Birthdays")
  
  ' "���"
  column_��_��� = ColumnByValue("Birthdays", "����1", "���", 100, 100)

  ' "���� ��������"
  column_��_����_�������� = ColumnByValue("Birthdays", "����1", "���� ��������", 100, 100)
  
  ' "�����������"
  column_��_����������� = ColumnByValue("Birthdays", "����1", "�����������", 100, 100)
  
  ' "���������"
  column_��_��������� = ColumnByValue("Birthdays", "����1", "���������", 100, 100)
  
  ' "����������"
  column_��_���������� = ColumnByValue("Birthdays", "����1", "����������", 100, 100)
  
  ' "���"
  column_��_��� = ColumnByValue("Birthdays", "����1", "���", 100, 100)
  
  ' ��������� "��������� ������������"
  column_��_���������_������������ = ColumnByValue("Birthdays", "����1", "��������� ������������", 100, 100)
  
  ' "1� - ������������ ����� �.�. ��������� (����� ������ ��� �����������)"
  ' "2� - ������������ ������������� �������������"
  ' "3� - ����������� ����� ����������� �������� (�����������/��������)"
  
  ' "���� �����������"
  column_��_����_����������� = ColumnByValue("Birthdays", "����1", "���� �����������", 100, 100)
  
  
  ' ������ �
  row_N = rowByValue("Birthdays", "����1", "�", 100, 100)
    
  ' ��������� ����������� �� ��������, � ������� �� �������
  �����_������_����_�� = 8
  �����_�������_����_�� = 0
  rowCount = row_N + 2
  Do While Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_���).Value <> ""
 
    ����������_����������� = False
 
    ' ��������� ���� �� - ��� ������ ���� �� ������
    If Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_����_��������).Value <> "" Then
    
      ' ��������� ���� �� - ��� ������ ���� ��� ������� ��� �� ������� -2 ���
      If ��������_����_��������_���_�����������(CDate(Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_����_��������).Value)) = True Then
        
        
        ' ��������� - ���� ����������� �����?
        If Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_����_�����������).Value <> "" Then
        
          ' ��������� - ������������ �� ����������� ��� � ���� ����?
          If Year(Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_����_�����������).Value) <> Year(Date) Then
            ����������_����������� = True
          End If
        
        Else
          
          ����������_����������� = True
          
        End If ' ��������� - ���� ����������� �����?
        
      End If ' ��������� ���� ��
                
      ' ���������� �����������?
      If ����������_����������� = True Then
        
            �����_������_����_�� = �����_������_����_�� + 1
        
            ' 1) ������� ������� �� ���� ��
            ' N
            �����_�������_����_�� = �����_�������_����_�� + 1
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 1).Value = �����_�������_����_��
            ' ���
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 2).Value = Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_���).Value
            ' ��
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 3).Value = Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_����_��������).Value
            ' �����������
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 4).Value = Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_�����������).Value
            ' ���������
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 5).Value = Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_���������).Value
            ' ����������
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 6).Value = Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_����������).Value
            ' ���
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 7).Value = Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_���).Value
            ' ���������
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 8).Value = Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_���������_������������).Value
            ' ���� �����������
            ThisWorkbook.Sheets("��").Cells(�����_������_����_��, 9).Value = Date
        
            ' 2) ���������� �����������
            Call ��������_����_��("Birthdays", "����1", rowCount)
        
            ' 3) ������ ������� � "���� �����������"
            ' column_��_����_����������� = ColumnByValue("Birthdays", "����1", "���� �����������", 100, 100)
            Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_����_�����������).Value = Date

        
      End If ' ���������� �����������?
        
    End If
    
    ' ��������� ������
    Application.StatusBar = "��: �������� ����������� " + CStr(rowCount) + "..."
    rowCount = rowCount + 1
    DoEventsInterval (rowCount)
    
  Loop
    
  ' ������� BASE\Birthdays
  CloseBook ("Birthdays")

  ' ������ �������
  Application.StatusBar = ""


End Sub


' �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_����_��(In_Workbooks, In_Sheets, In_Row)
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������ �������
  Application.StatusBar = "�������� ������..."
  
    ' Workbooks("Birthdays").Sheets("����1").Cells(rowCount, column_��_����_�����������).Value = Date
  
    
    ' dateDB_����8 = CDate(Mid(ThisWorkbook.Sheets("����8").Range("B5").Value, 52, 10))
   
    ' ���� ������ - ����:
    ' ���������� = ThisWorkbook.Sheets("����8").Cells(RowByValue(ThisWorkbook.Name, "����8", "����:", 100, 100), ColumnByValue(ThisWorkbook.Name, "����8", "����:", 100, 100) + 1).Value
    ���������� = "��� �������� �������� " + �������_�_���(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 2).Value, 3)

    ' hashTag - ������:
    hashTag = "#�� #���_�������� #t227211055"

    ' ����-�������� (!!!)
    attachmentFile = "" ' ThisWorkbook.Sheets("����8").Range("S3").Value
    
    ' ������� ������
    Select Case Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 7).Value
      
      Case "���" ' �� ����������
        �������_������ = getFromAddrBook("����, ����", 2)
      
      Case "������ ������" ' �� ����������
        �������_������ = getFromAddrBook("�������1, ��", 2)
        
      Case "��" ' �� ����������
        �������_������ = getFromAddrBook("���", 2)
        
      Case "������" ' �� �����������
        ��������_������ = getFromAddrBook("���2, �������2", 2)
        
      Case "�������������" ' �� ����������������
        ��������_������ = getFromAddrBook("���3, �������3", 2)
        
      Case "����� �������" ' �� ����������������
        ��������_������ = getFromAddrBook("���4, �������4", 2)
        
      Case "�����-����" ' �� ������-����
        ��������_������ = getFromAddrBook("���5, �������5", 2)
            
    End Select

    
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + �������_������ + Chr(13) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ����������� � ��� �������� �������" + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + ">> " '  + Chr(13)
    
     
    ' ���
    ����������� = ����������� + Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 2).Value + ", "
    ' ��
    ����������� = ����������� + CStr(Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 3).Value) + ", "
    ' �����������
    ����������� = ����������� + Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 4).Value + ", "
    ' ���������
    ����������� = ����������� + Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 5).Value + ", "
    ' ����������
    ����������� = ����������� + Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 6).Value + ", "
    ' ���
    ����������� = ����������� + "�������������: " + Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 7).Value + ", "
    ' ���������
    ����������� = ����������� + "���������: " + Workbooks(In_Workbooks).Sheets(In_Sheets).Cells(In_Row, 8).Value + " "

    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(30) + hashTag
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)
  
    ' ���������
    ' MsgBox ("������ ����������!")
     
    ' ������ �������
    Application.StatusBar = ""
     
  
End Sub

' ��������� ���� �� - ��� ������ ���� ��� ������� ��� �� ������� -2 ���
Function ��������_����_��������_���_�����������(In_Date) As Boolean

  ��������_����_��������_���_����������� = False
  
  ' ������������� In_Date
  ' �����
  �����_�� = Month(In_Date)
  ' ���
  ���_�� = Year(In_Date)
  ' �����
  �����_�� = CByte(Mid(CStr(In_Date), 1, 2))

  ' �������� � ���� �������� ����
  ����_��_�_����_���� = CDate(CStr(�����_��) + "." + CStr(�����_��) + "." + CStr(Year(Date)))
    
  ' ���������
  If (����_��_�_����_���� = Date) Or (����_��_�_����_���� >= (Date - 2)) And (����_��_�_����_���� < Date) Then
    
      ��������_����_��������_���_����������� = True
   
  End If
  
End Function

