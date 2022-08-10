Attribute VB_Name = "Module_��_PA"
' *** ���������� �� ��������� ������ � PA (��_PA) ***

' *** ���������� ���������� ***
Public dateReport As Date
Public countRowNewLine_��_PA As Integer ' ������� ������ ����� ����� �� ���� "��_PA"

Public count�������_�_PA_�� As Integer  ' ��������
Public count_������_��_�� As Integer    ' ��������

Public count���_�������_�_PA_�� As Integer  ' ��������
Public count���_������_��_�� As Integer     ' ��������

Public count�������_�_PA_�� As Integer     ' ��������
Public count_�����_��_�� As Integer        ' ��������

Public count���_�������_�_PA_�� As Integer ' ��������
Public count���_�����_��_�� As Integer     ' ��������

Public �����_��_�_���_��_������_�� As Long
Public �����_��_�_���_��_������_�����_�������� As Integer
Public �����_��_�_���_��_������_�����_�������� As Double
Public �����_��_�_���_��_������_����_�������� As String
Public ���_��_�����_��_�_���_��_������ As String



' ***                       ***
  
' ��������� ������
Sub ����������_��_���������_������_�_PA()

' �������� ����������
Dim ReportName_String, officeNameInReport, CheckFormatReportResult As String
Dim i, rowCount As Integer
Dim finishProcess As Boolean
    
  ' ��������� � ������������� ���������� ������ �� ������� ����3 N1
  MsgBox ("����� �������� ��������� ���������� �������� �����: " + ThisWorkbook.Sheets("����3").Range("N1").Value + " ������� ������ " + Dir(ThisWorkbook.Sheets("����3").Range("Q3").Value) + "!")

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
      
    ' ��������� BASE\Clients
    OpenBookInBase ("Clients")
      
    ' ��������� �� ���� DB
    ThisWorkbook.Sheets("��_PA").Activate

    ' �������� ����� ������
    CheckFormatReportResult = CheckFormatReport(ReportName_String, "��. ����� � ��-�� (���)", 18, Date)
    If CheckFormatReportResult = "OK" Then
    
      ' ������ �������
      Application.StatusBar = "���������� ���� ������..."
    
      ' � O2 ������������� ����
      ThisWorkbook.Sheets("��_PA").Range("O2").Value = "���������� �� ��������� ������ � PA " + CStr(Workbooks(ReportName_String).Sheets("��. ����� � ��-�� (���)").Range("B1").Value)
    
      ' ��������� "����-�����:" � �����3 - ��� �������� ������� ��������
      ' ��������� ��������� ����� (UpdateLinks:=0)
      FileName2 = ThisWorkbook.Sheets("����3").Range("Q3").Value
      Workbooks.Open FileName2, 0
    
      ' ������� ���� ������ �� �����
      Call clear�ontents_��_PA

      ' ��������� �������� ������� ������� �� ����� "��. ����� � ��-�� (���)":
      
      ' 1) ����� ����������� ����1 ��� ���� ����������� ������ PA ��, �� ��� ���
      Call setFilter_��_�����_�_��_��_���(ReportName_String, "��. ����� � ��-�� (���)", "����_typeSeg1")
      
      ' 2) ����� ����������� ����2 ��� ���� ��������� ������ PA ��, �� ���� ���
      Call setFilter_��_�����_�_��_��_���(ReportName_String, "CR ��-�� (���) ��������", "����_typeSeg4")
      
      ' 3) ����� ����������� ����3 ��� PA ��
      Call setFilter_��_�����_�_��_��_���(ReportName_String, "CR ��-K� (���) ��������", "����_typeSeg41")
      
      ' ������� �������� ����� ��� �������� PA ��
      OutBookName = ThisWorkbook.Path + "\Out\Pre-App_��_" + strDDMMYYYY(dateReport) + ".xlsx"
      ThisWorkbook.Sheets("��_PA").Range("P3").Value = OutBookName ' ���������� ��� ����� �� ��������
      ' ������� ����
      Call createBook_out_PA2(OutBookName)

      ' ������� �������� ����� ��� �������� PA ��
      OutBookName2 = ThisWorkbook.Path + "\Out\Pre-App_��_" + strDDMMYYYY(dateReport) + ".xlsx"
      ThisWorkbook.Sheets("��_PA").Range("R3").Value = OutBookName2 ' ���������� ��� ����� �� ��������
      ' ������� ����
      Call createBook_out_PA2(OutBookName2)

      ' ������� �� ����
      ThisWorkbook.Sheets("��_PA").Activate
      
      ' ������ �������
      Application.StatusBar = "����������� �������� �� ����1/����2/����3..."
      
      ' ���������� ���� �� ����1
      column_����1_�� = ColumnByValue(ReportName_String, "����1", "NK", 100, 100)
      column_����1_���� = ColumnByValue(ReportName_String, "����1", "DP4_�����", 100, 100)
      column_����1_�������_����� = ColumnByValue(ReportName_String, "����1", "typeSegDetal", 100, 100) ' typeSegDetal
      
      ' ���������� ������� �� ����2
      column_����2_���� = ColumnByValue(ReportName_String, "����2", "DP4_�����", 100, 100) ' Q
      column_����2_����_���������� = ColumnByValue(ReportName_String, "����2", "load_date", 100, 100) ' ���� ����������
      column_����2_����� = ColumnByValue(ReportName_String, "����2", "month", 100, 100) '
      column_����2_�� = ColumnByValue(ReportName_String, "����2", "NK", 100, 100) ' �� ������
      column_����2_CRM_�� = ColumnByValue(ReportName_String, "����2", "ybpideal", 100, 100) ' ������������� ������� CRM
      column_����2_���_��� = ColumnByValue(ReportName_String, "����2", "Manager", 100, 100) ' ���
      column_����2_��_��� = ColumnByValue(ReportName_String, "����2", "���������_�����", 100, 100) ' ��������� �����
      column_����2_BIC_RFOFICID = ColumnByValue(ReportName_String, "����2", "/BIC/RFOFICID", 100, 100) ' ���� ��������
      column_����2_����_��_�� = ColumnByValue(ReportName_String, "����2", "type", 100, 100) ' type = 1/0 ������� ���� �������� �� (�� / ��) � ������ �������� � �����
      column_����2_������� = ColumnByValue(ReportName_String, "����2", "typeSeg", 100, 100) ' ��� ��������
      column_����2_potok = ColumnByValue(ReportName_String, "����2", "potok", 100, 100) ' potok=1- ������ � ����� � ��������� � ����� ��
      column_����2_������_PA_KK = ColumnByValue(ReportName_String, "����2", "applicCC", 100, 100) ' applicCC=1 - ������ ��-��
      column_����2_������_PA_�� = ColumnByValue(ReportName_String, "����2", "issuedLN", 100, 100) ' issuedLN=1 - ������ ��-��
      column_����2_�������3 = ColumnByValue(ReportName_String, "����2", "typeSeg_MO", 100, 100) ' typeSeg_MO
      column_����2_cntProduct = ColumnByValue(ReportName_String, "����2", "cntProduct", 100, 100) ' cntProduct

      ' ���������� ������� �� ����3
      column_����3_���� = ColumnByValue(ReportName_String, "����3", "DP4_�����", 100, 100) ' Q
      column_����3_����_���������� = ColumnByValue(ReportName_String, "����3", "load_date", 100, 100) ' ���� ����������
      column_����3_����� = ColumnByValue(ReportName_String, "����3", "month", 100, 100) '
      column_����3_�� = ColumnByValue(ReportName_String, "����3", "NK", 100, 100) ' �� ������
      column_����3_CRM_�� = ColumnByValue(ReportName_String, "����3", "ybpideal", 100, 100) ' ������������� ������� CRM
      column_����3_���_��� = ColumnByValue(ReportName_String, "����3", "Manager", 100, 100) ' ���
      column_����3_��_��� = ColumnByValue(ReportName_String, "����3", "���������_�����", 100, 100) ' ��������� �����
      column_����3_BIC_RFOFICID = ColumnByValue(ReportName_String, "����3", "/BIC/RFOFICID", 100, 100) ' ���� ��������
      column_����3_����_��_�� = ColumnByValue(ReportName_String, "����3", "type", 100, 100) ' type = 1/0 ������� ���� �������� �� (�� / ��) � ������ �������� � �����
      column_����3_������� = ColumnByValue(ReportName_String, "����3", "typeSeg", 100, 100) ' ��� ��������
      column_����3_potok = ColumnByValue(ReportName_String, "����3", "potok", 100, 100) ' potok=1- ������ � ����� � ��������� � ����� ��
      column_����3_������_PA_KK = ColumnByValue(ReportName_String, "����3", "applicCC", 100, 100) ' applicCC=1 - ������ ��-��
      column_����3_������_PA_�� = ColumnByValue(ReportName_String, "����3", "issuedLN", 100, 100) ' issuedLN=1 - ������ ��-��
      column_����3_�������3 = ColumnByValue(ReportName_String, "����3", "typeSeg_MO", 100, 100) ' typeSeg_MO
      column_����3_cntProduct = ColumnByValue(ReportName_String, "����3", "cntProduct", 100, 100) ' cntProduct

      ' ������� ������ ����� ����� �� ���� "��_PA"
      countRowNewLine_��_PA = 5

      ' ��������
      count�������_�_PA_�� = 0
      count_������_��_�� = 0
      
      count���_�������_�_PA_�� = 0
      count���_������_��_�� = 0

      count�������_�_PA_�� = 0
      count_�����_��_�� = 0

      count���_�������_�_PA_�� = 0
      count���_�����_��_�� = 0


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

        ' ������ �������� ����� � ����� �������
        Call writeOffice_��_PA(officeNameInReport, i)
        
        ' ��������� ����2 *** ��������������� ������� ***
        rowCount = 1
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, 1).Value)
        
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_����).Value, officeNameInReport) <> 0 Then
            
            ' ������ ��� �� ���� ������ (���� ��� ���) �  ��������� �� ��� ������
            Call write���_��_PA(Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_��_���).Value, _
                                  Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_���_���).Value, _
                                    Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_����_��_��).Value, _
                                      Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_������_PA_��).Value)
            
            ' �� �������
            ��_RetailVar = Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_��).Value
            
            ' ��������� �� �� ������� ������� � ������� �� ������ �� ������� ����3, ���� ����, �� ������ � ���� "������_���������" (���� �����������: ��������, ���� ������, ��������� � �.�.)
            ' ��_RetailVar
            Call ��������_������������_�������(Dir(FileName2), "����� ��", ��_RetailVar) ' ��������� ������������ � ���������� ���������� �����_��_�_���_��_������_��, �����_��_�_���_��_������_�����_��������, �����_��_�_���_��_������_�����_��������
            
            If �����_��_�_���_��_������_�����_�������� <> 0 Then
              �����������_Var = "����������� ������� " + CStr(�����_��_�_���_��_������_�����_��������) + " ��., �� ����� " + CStr(Round(�����_��_�_���_��_������_�����_�������� / 1000, 0)) + " ���. ���. (" + �����_��_�_���_��_������_����_�������� + ")"
            Else
              �����������_Var = " "
            End If
            
            ' ������ PA ��
            �������2Var = getDataFrom_����1(ReportName_String, "����1", column_����1_��, Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_��).Value, column_����1_�������_�����)
            Call InsertRecordInBook(Dir(OutBookName), "����1", "��_Retail", ��_RetailVar, _
                                              "����_��������", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_����_����������).Value, _
                                                "��_Retail", ��_RetailVar, _
                                                  "ID_CRM", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_CRM_��).Value, _
                                                    "���_�������", ���_��_�����_��_�_���_��_������, _
                                                      "�������", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_�������).Value, _
                                                        "�������2", �������2Var, _
                                                          "�������3", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_�������3).Value, _
                                                            "cntProduct", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_cntProduct).Value, _
                                                              "PA_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_����_��_��).Value, _
                                                                "������_PA_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_������_PA_��).Value, _
                                                                  "PA_KK", "", _
                                                                    "������_��_��", "", _
                                                                      "���_���", �������_�_���(Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_���_���).Value, 3), _
                                                                        "�������", officeNameInReport, _
                                                                          "������_���������", " ", _
                                                                            "�����������", �����������_Var, _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "", _
                                                                                    "", "")
                                                                                    
                                                                                                
            ' ������ � BASE\Clients ���� �����_�������, ����, PA_��, PA_KK, �������, �������2, �������3, ����_��������
            Call InsertRecordInBook("Clients", "����1", "�����_�������", ��_RetailVar, _
                                            "�����_�������", ��_RetailVar, _
                                              "����", cityOfficeName(officeNameInReport), _
                                                "PA_��", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_����_��_��).Value, _
                                                  "�������", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_�������).Value, _
                                                    "�������2", �������2Var, _
                                                      "�������3", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_�������3).Value, _
                                                        "����_��������", Workbooks(ReportName_String).Sheets("����2").Cells(rowCount, column_����2_����_����������).Value, _
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


          End If
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = "��������� " + officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
        ' ��������� ����3 *** ��������� ����� ***
        rowCount = 1
        Do While Not IsEmpty(Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, 1).Value)
        
          ' ���� ��� ������� ����
          If InStr(Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_����).Value, officeNameInReport) <> 0 Then
            
            ' ������ ��� �� ���� ������ (���� ��� ���) �  ��������� �� ��� ������
            Call write���_��_PA_KK(Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_��_���).Value, _
                                    Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_���_���).Value, _
                                      Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_����_��_��).Value, _
                                        Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_������_PA_KK).Value)
            ' ������ PA ��
            ��_RetailVar = Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_��).Value
            �������2Var = getDataFrom_����1(ReportName_String, "����1", column_����1_��, Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_��).Value, column_����1_�������_�����)
            Call InsertRecordInBook(Dir(OutBookName2), "����1", "��_Retail", ��_RetailVar, _
                                              "����_��������", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_����_����������).Value, _
                                                "��_Retail", ��_RetailVar, _
                                                  "ID_CRM", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_CRM_��).Value, _
                                                    "���_�������", "", _
                                                      "�������", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_�������).Value, _
                                                        "�������2", �������2Var, _
                                                          "�������3", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_�������3).Value, _
                                                            "cntProduct", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_cntProduct).Value, _
                                                              "PA_��", "", _
                                                                "������_PA_��", "", _
                                                                  "PA_KK", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_����_��_��).Value, _
                                                                    "������_��_��", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_������_PA_KK).Value, _
                                                                      "���_���", �������_�_���(Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����3_���_���).Value, 3), _
                                                                        "�������", officeNameInReport, _
                                                                          "������_���������", " ", _
                                                                            "�����������", " ", _
                                                                              "", "", _
                                                                                "", "", _
                                                                                  "", "", _
                                                                                    "", "")
            
            ' ������ � BASE\Clients ���� �����_�������, ����, PA_��, PA_KK, �������, �������2, �������3, ����_��������
            Call InsertRecordInBook("Clients", "����1", "�����_�������", ��_RetailVar, _
                                            "�����_�������", ��_RetailVar, _
                                              "����", cityOfficeName(officeNameInReport), _
                                                "PA_KK", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����2_����_��_��).Value, _
                                                  "�������", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����2_�������).Value, _
                                                    "�������2", �������2Var, _
                                                      "�������3", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����2_�������3).Value, _
                                                        "����_��������", Workbooks(ReportName_String).Sheets("����3").Cells(rowCount, column_����2_����_����������).Value, _
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
          
          End If
        
        
          ' ��������� ������
          rowCount = rowCount + 1
          Application.StatusBar = "��������� " + officeNameInReport + ": " + CStr(rowCount) + "..."
          DoEventsInterval (rowCount)
        Loop
   
   
        ' ������� ������ �� �����
      
      Next i ' ��������� ����
      
      ' �������� ����� �� �������� ����� i-1
      Call ��������_�����_��_��������_�����(i)
      
      ' ������� ����� ���������
      Call ����_��_PA_�����_���
      
      ' ��������� �������� ����� � ��������� PA ��
      Workbooks(Dir(OutBookName)).Close SaveChanges:=True
      
      ' ��������� �������� ����� � ��������� PA ��
      Workbooks(Dir(OutBookName2)).Close SaveChanges:=True
      
      ' ��������� ���� BASE\Clients
      CloseBook ("Clients")
      
      ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
      Workbooks(Dir(FileName2)).Close SaveChanges:=False
      
      ' ���������� ���������
      ThisWorkbook.Save
    
      ' ���������� ���������� ���������
      finishProcess = True
    Else
      ' ��������� � �������� ������� ������ ��� ����
      MsgBox ("��������� �����: " + CheckFormatReportResult + "!")
    End If ' �������� ����� ������

    ' ��������� ���� � ������� ��� ���������� ��������� (�������� SaveChanges:=False)
    Workbooks(Dir(FileName)).Close SaveChanges:=False
    
    ' ��������� � ������ M2
    ThisWorkbook.Sheets("��_PA").Activate
    ThisWorkbook.Sheets("��_PA").Range("A1").Select

    ' ������ �������
    Application.StatusBar = ""

    ' ����������� ����� ���� �� ��������� ��������
    ' Call �����������������������("����0", "D9")
    ' Call �����������������������("����0", RangeByValue(ThisWorkbook.Name, "����0", "����������� ������� �� _________________", 100, 100))
    
    ' �������� ���������
    If finishProcess = True Then
      MsgBox ("��������� " + Dir(ReportName_String) + " ���������!")
    Else
      MsgBox ("��������� ������ ���� ��������!")
    End If

  End If ' ���� ���� ��� ������
 
End Sub

' ��������� �������� ������� ������� �� ����� "��. ����� � ��-�� (���)"
Sub setFilter_��_�����_�_��_��_���(In_ReportName_String, In_Sheets, In_����_typeSeg)

  ' ������ �������
  Application.StatusBar = "�������� ������ " + In_Sheets + "..."

  ' ������� �� ������� "��. ����� � ��-�� (���)"/"CR ��-�� (���) ��������"
  Workbooks(In_ReportName_String).Sheets(In_Sheets).Activate
  
  ' ���������� �������, � ������� ���� �������� "��.�����" �� �����
  ' ���� ��� ���� "��. ����� � ��-�� (���)", �� ���� ������ ������� �� �����, ���������� "��.�����": �����_��_�����_��_����� = 2
  If In_Sheets = "��. ����� � ��-�� (���)" Then
    �����_��_�����_��_����� = 2
  End If
  ' ���� ��� ���� "CR ��-�� (���) ��������", �� ���� ������ ������� �� �����, ���������� "��.�����": �����_��_�����_��_����� = 1
  If In_Sheets = "CR ��-�� (���) ��������" Then
    �����_��_�����_��_����� = 1
  End If
  
  ' ��������� ����� �������
  column_��_����� = ColumnByValue2(In_ReportName_String, In_Sheets, "��.�����", 1000, 1000, �����_��_�����_��_�����)
  
  ' ������ "����� �� ���� CR"
  ' row_�����_��_����_CR = rowByValue(In_ReportName_String, In_Sheets, "����� �� ���� CR", 1000, 1000)
  ' ��������� ����� �������
  ' column_��_����� = ColumnByNameAndNumber(In_ReportName_String, In_Sheets, row_�����_��_����_CR, "��.�����", �����_��_�����_��_�����, 100)

  ' ������� "��. ����� � ��-�� (���)"
  ' ����_typeSeg = "����_typeSeg1"
  
  ' ���������� ��� ������� - ��� ���� ���!
  ' ������� "CR ��-�� (���) ��������"
  ' ����_typeSeg = "����_typeSeg4"

  ' ������ "��������� ��1"
  row_���������_��1 = rowByValue(In_ReportName_String, In_Sheets, "��������� ��1", 1000, 1000)

  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("��������").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("��").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("����������").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("������").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("�������").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("(�����)").Selected = False
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("").Selected = False
  Workbooks(In_ReportName_String).ShowPivotTableFieldList = False
  ' ��������� ����� ����X
  Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(row_���������_��1, column_��_����� - 1).Select
  Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(row_���������_��1, column_��_����� - 1).ShowDetail = True

  ' ����������� ������� ����1
  
  ' ���������� ���� ������
  column_����X_����_���������� = ColumnByValue(In_ReportName_String, "����1", "load_date", 100, 100) ' ���� ����������
  dateReport = CDate(Workbooks(In_ReportName_String).Sheets("����1").Cells(2, column_����X_����_����������).Value)
 
' ������� "��. ����� � ��-�� (���)"
'     With ActiveWorkbook.SlicerCaches("����_typeSeg1")
'        .SlicerItems("��������").Selected = True
'        .SlicerItems("��").Selected = True
'        .SlicerItems("").Selected = False
'        .SlicerItems("����������").Selected = False
'        .SlicerItems("������").Selected = False
'        .SlicerItems("�������").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    With ActiveWorkbook.SlicerCaches("����_typeSeg1")
'        .SlicerItems("��������").Selected = True
'        .SlicerItems("����������").Selected = True
'        .SlicerItems("��").Selected = True
'        .SlicerItems("").Selected = False
'        .SlicerItems("������").Selected = False
'        .SlicerItems("�������").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    With ActiveWorkbook.SlicerCaches("����_typeSeg1")
'        .SlicerItems("��������").Selected = True
'        .SlicerItems("����������").Selected = True
'        .SlicerItems("������").Selected = True
'        .SlicerItems("��").Selected = True
'        .SlicerItems("").Selected = False
'        .SlicerItems("�������").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    With ActiveWorkbook.SlicerCaches("����_typeSeg1")
'        .SlicerItems("��������").Selected = True
'        .SlicerItems("����������").Selected = True
'        .SlicerItems("������").Selected = True
'        .SlicerItems("�������").Selected = True
'        .SlicerItems("��").Selected = True
'        .SlicerItems("").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    ActiveWorkbook.ShowPivotTableFieldList = False
'    Range("T124").Select
'    Selection.ShowDetail = True
'

' ����������� ����1

' ���������� ��� ������� - ��� ���� ���!
' ������� "CR ��-�� (���) ��������"
'    With ActiveWorkbook.SlicerCaches("����_typeSeg4")
'        .SlicerItems("����������").Selected = True
'        .SlicerItems("�������").Selected = False
'        .SlicerItems("��").Selected = False
'        .SlicerItems("").Selected = False
'        .SlicerItems("��������").Selected = False
'        .SlicerItems("������").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    With ActiveWorkbook.SlicerCaches("����_typeSeg4")
'        .SlicerItems("����������").Selected = True
'        .SlicerItems("�������").Selected = True
'        .SlicerItems("��").Selected = False
'        .SlicerItems("").Selected = False
'        .SlicerItems("��������").Selected = False
'        .SlicerItems("������").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    With ActiveWorkbook.SlicerCaches("����_typeSeg4")
'        .SlicerItems("����������").Selected = True
'        .SlicerItems("�������").Selected = True
'        .SlicerItems("��").Selected = True
'        .SlicerItems("").Selected = False
'        .SlicerItems("��������").Selected = False
'        .SlicerItems("������").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    With ActiveWorkbook.SlicerCaches("����_type4")
'        .SlicerItems("KK").Selected = True
'        .SlicerItems("PK").Selected = True
'        .SlicerItems("(�����)").Selected = False
'    End With
'    With ActiveWorkbook.SlicerCaches("����_typeSeg4")
'        .SlicerItems("��������").Selected = True
'        .SlicerItems("����������").Selected = True
'        .SlicerItems("�������").Selected = True
'        .SlicerItems("��").Selected = True
'        .SlicerItems("").Selected = False
'        .SlicerItems("������").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    With ActiveWorkbook.SlicerCaches("����_typeSeg4")
'        .SlicerItems("��������").Selected = True
'        .SlicerItems("����������").Selected = True
'        .SlicerItems("������").Selected = True
'        .SlicerItems("�������").Selected = True
'        .SlicerItems("��").Selected = True
'        .SlicerItems("").Selected = False
'        .SlicerItems("(�����)").Selected = False
'    End With
'    ActiveWindow.SmallScroll Down:=33
'    Range("O76").Select
'    Selection.ShowDetail = True
' ����������� ������� ����1

  ' ������ �������
  Application.StatusBar = ""

End Sub

' �������� ����� � PA ��� ��������� "���������� �� ��������� ������ � PA"
Sub createBook_out_PA2(In_OutBookName)

    ' ����:
    
    Workbooks.Add
    ActiveWorkbook.SaveAs FileName:=In_OutBookName
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Activate
    
    ' �������������� �����
    field_Number = 0
    
    ' ����_��������
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "����_��������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 13
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ��_Retail
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "��_Retail"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 11
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ID_CRM
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "ID_CRM"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 11
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ���_�������
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "���_�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ������� (c �����2)
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ������� 2 (� �����1)
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "�������2"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ������� 3 (� �����2 - ���������/���)
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "�������3"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 10
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' cntProduct - �������� ����� ���������
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "cntProduct"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 9
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' PA_��
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "PA_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 8.29
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
 
    ' ������_PA_��
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "������_PA_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 15.86
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' PA_KK
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "PA_KK"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 8.14
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ������_��_��
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "������_��_��"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 15
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ���_���
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "���_���"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 11
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' �������
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "�������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 11
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft
    
    ' ������_��������� (���� �����������: ��������, ���� ������, ��������� � �.�.)
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "������_���������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 18
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft

    ' ����������� (������� �����������)
    field_Number = field_Number + 1
    field_Letter = ConvertToLetter(field_Number)
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).Value = "�����������"
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Columns(field_Letter + ":" + field_Letter).EntireColumn.ColumnWidth = 100
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Cells(1, field_Number).HorizontalAlignment = xlLeft

    ' ��������� ��������
    Workbooks(Dir(In_OutBookName)).Sheets("����1").Range("A1:" + field_Letter + "1").Select
    Selection.AutoFilter

End Sub


' ������ �������� ����� � ����� �������
Sub writeOffice_��_PA(In_officeNameInReport, In_i)
  
  ' �������� ����� �� �������� ����� i-1
  Call ��������_�����_��_��������_�����(In_i)
  
  ' ����� ������ �� ����� "�� PA"
  countRowNewLine_��_PA = countRowNewLine_��_PA + 1
  
  ' ���� i
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 1).Value = CStr(In_i)
  
  ' ���� ������������
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 2).Value = getNameOfficeByNumber(In_i)
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 2).HorizontalAlignment = xlLeft
  
  ' ���� ���� ������
  Call setColorCells(ThisWorkbook.Name, "��_PA", countRowNewLine_��_PA, 2, countRowNewLine_��_PA, 9)

  ' �������� ����������
  count�������_�_PA_�� = 0
  count_������_��_�� = 0
  
  count�������_�_PA_�� = 0
  count_�����_��_�� = 0

End Sub
        

' ������ ��� �� ���� ������ (���� ��� ���) �  ��������� �� ��� ������
Sub write���_��_PA(In_���_������, In_���_���, In_������_�_PA_��, In_�����_PA_��)
    
  ' ��������� ����� ������� ��� �� ���� "��_PA"
  row_��� = rowByValue(ThisWorkbook.Name, "��_PA", "#" + In_���_������, 100, 100)
  
  ' ���� ��� �� ������
  If row_��� = 0 Then
    ' ��������� ���
    countRowNewLine_��_PA = countRowNewLine_��_PA + 1
    row_��� = countRowNewLine_��_PA
    ' ��������
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 1).Value = "#" + In_���_������
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 1).NumberFormat = "@"
    ' ������ ����� � ������ ���������
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 1).Font.ThemeColor = xlThemeColorDark1
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 1).Font.TintAndShade = 0
    ' ���
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 2).Value = �������_�_���(In_���_���, 3)
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 2).NumberFormat = "@"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 2).HorizontalAlignment = xlRight
    ' �������
    ' ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 3).Value =
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 3).HorizontalAlignment = xlRight
    ' ������� � PA ��
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).Value = 0
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).HorizontalAlignment = xlRight
    ' ������ ��-��
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).Value = 0
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).HorizontalAlignment = xlRight
    ' ���������
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).Value = 0
    ' ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).NumberFormat = "0.0%"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).NumberFormat = "0%"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).HorizontalAlignment = xlRight
    
    ' *** �� ***
    ' ������� � PA ��
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 7).Value = 0
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 7).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 7).HorizontalAlignment = xlRight
    ' ����� �� ��
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 8).Value = 0
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 8).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 8).HorizontalAlignment = xlRight
    ' ���������
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 9).Value = 0
    ' ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 9).NumberFormat = "0.0%"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 9).NumberFormat = "0%"
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 9).HorizontalAlignment = xlRight

  End If
    
  ' ��������� �� ��� �����
  ' �������
  ' ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 3).Value =
  
  ' ������� � PA ��
  If In_������_�_PA_�� = "PK" Then
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).Value = ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).Value + 1
    count�������_�_PA_�� = count�������_�_PA_�� + 1
    count���_�������_�_PA_�� = count���_�������_�_PA_�� + 1
  End If
  
  ' ������ ��-��
  If In_�����_PA_�� = 1 Then
    ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).Value = ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).Value + 1
    count_������_��_�� = count_������_��_�� + 1
    count���_������_��_�� = count���_������_��_�� + 1
  End If
    
  ' ���������
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).Value = �����������(ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).Value, ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).Value, 3)
    
End Sub

' ������ ��� �� ���� ������ (���� ��� ���) �  ��������� �� ��� ������
Sub write���_��_PA_KK(In_���_������, In_���_���, In_������_�_PA_��, In_�������_PA_��)
    
  ' ��������� ����� ������� ��� �� ���� "��_PA"
  row_��� = rowByValue(ThisWorkbook.Name, "��_PA", "#" + In_���_������, 100, 100)
  
  If row_��� <> 0 Then
  
    ' ������� � PA ��
    If In_������_�_PA_�� = "KK" Then
      ThisWorkbook.Sheets("��_PA").Cells(row_���, 7).Value = ThisWorkbook.Sheets("��_PA").Cells(row_���, 7).Value + 1
      count�������_�_PA_�� = count�������_�_PA_�� + 1
      count���_�������_�_PA_�� = count���_�������_�_PA_�� + 1
    End If
  
    ' ����� �� ��
    If In_�������_PA_�� = 1 Then
      ThisWorkbook.Sheets("��_PA").Cells(row_���, 8).Value = ThisWorkbook.Sheets("��_PA").Cells(row_���, 8).Value + 1
      count_�����_��_�� = count_�����_��_�� + 1
      count���_�����_��_�� = count���_�����_��_�� + 1
    End If
    
    ' ���������
    ThisWorkbook.Sheets("��_PA").Cells(row_���, 9).Value = �����������(ThisWorkbook.Sheets("��_PA").Cells(row_���, 7).Value, ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 8).Value, 3)
    
  End If
    
End Sub

' ������� ���� ������ �� �����
Sub clear�ontents_��_PA()

  rowBegin = rowByValue(ThisWorkbook.Name, "��_PA", "�� ����������", 100, 100)
      
  If rowBegin = 0 Then
    rowBegin = 6
  End If
      
  rowEnd = rowByValue(ThisWorkbook.Name, "��_PA", "����� �� ���", 100, 100)
        
  If rowEnd = 0 Then
    rowEnd = 30
  End If
      
  Call clear�ontents2(ThisWorkbook.Name, "��_PA", "A" + CStr(rowBegin), "I" + CStr(rowEnd))
      
End Sub

' �������� ����� �� �������� ����� i-1
Sub ��������_�����_��_��������_�����(In_i)

  If (In_i - 1) > 0 Then
    
    rowPreviousOffice = rowByValue(ThisWorkbook.Name, "��_PA", getNameOfficeByNumber(In_i - 1), 100, 100)
    ' �������
    ' ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 3).Value =
    ' ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 3).HorizontalAlignment = xlRight
    ' ������� � PA ��
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 4).Value = count�������_�_PA_��
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 4).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 4).HorizontalAlignment = xlRight
    ' ������ ��-��
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 5).Value = count_������_��_��
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 5).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 5).HorizontalAlignment = xlRight
    ' ���������
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 6).Value = �����������(ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 4).Value, ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 5).Value, 3)
    ' ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 6).NumberFormat = "0.0%"
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 6).NumberFormat = "0%"
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 6).HorizontalAlignment = xlRight
    
    ' ��
    ' ������� � ��
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 7).Value = count�������_�_PA_��
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 7).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 7).HorizontalAlignment = xlRight
    ' ����� ��-��
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 8).Value = count_�����_��_��
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 8).NumberFormat = "#,##0"
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 8).HorizontalAlignment = xlRight
    ' ���������
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 9).Value = �����������(ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 7).Value, ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 8).Value, 3)
    ' ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 9).NumberFormat = "0.0%"
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 9).NumberFormat = "0%"
    ThisWorkbook.Sheets("��_PA").Cells(rowPreviousOffice, 9).HorizontalAlignment = xlRight


  End If

End Sub

' ���������� ������ ���
Sub ����_��_PA_�����_���()
    
  countRowNewLine_��_PA = countRowNewLine_��_PA + 1
    
  ' ������ �������������� ����� 2 (��������� ���������� �������� ������)
  Call gorizontalLineII(ThisWorkbook.Name, "��_PA", countRowNewLine_��_PA, 2, 9)
    
  ' ����� �� ���
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 2).Value = "����� �� ���"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 2).HorizontalAlignment = xlLeft
  ' �������
  ' ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 3).Value =
  ' ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 3).HorizontalAlignment = xlRight
  ' ������� � PA ��
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).Value = count���_�������_�_PA_��
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).HorizontalAlignment = xlRight
  ' ������ ��-��
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).Value = count���_������_��_��
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).HorizontalAlignment = xlRight
  ' ���������
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).Value = �����������(ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 4).Value, ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 5).Value, 3)
  ' ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).NumberFormat = "0.0%"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).NumberFormat = "0%"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 6).HorizontalAlignment = xlRight
  
  ' *** �� ***
  ' ������� � PA ��
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 7).Value = count���_�������_�_PA_��
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 7).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 7).HorizontalAlignment = xlRight
  ' ������ ��-��
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 8).Value = count���_�����_��_��
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 8).NumberFormat = "#,##0"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 8).HorizontalAlignment = xlRight
  ' ���������
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 9).Value = �����������(ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 7).Value, ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 8).Value, 3)
  ' ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 9).NumberFormat = "0.0%"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 9).NumberFormat = "0%"
  ThisWorkbook.Sheets("��_PA").Cells(countRowNewLine_��_PA, 9).HorizontalAlignment = xlRight
  
  
End Sub


' �������� typeSegDetal � �����1 �� �� �������
Function getDataFrom_����1(In_ReportName_String, In_Sheets, In_column_NK, In_��_Retail, In_columnNumber) As String
  
    getDataFrom_����1 = ""
  
    ������_������� = ConvertToLetter(In_column_NK)
  
    ' ��������� �����
    Set searchResults = Workbooks(In_ReportName_String).Sheets(In_Sheets).Columns(������_������� + ":" + ������_�������).Find(In_��_Retail, LookAt:=xlWhole)
  
    ' ��������� - ���� �� ����� ����, ���� ���, �� ���������
    If searchResults Is Nothing Then
      ' ���� �� �������
      
    Else
      ' ���� �������
      getDataFrom_����1 = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(searchResults.Row, In_columnNumber).Value
      
    End If

  
End Function


' ��������� �������� ��� ��_��
Sub setFilter_��_�����_�_��_��_���(In_ReportName_String, In_Sheets, In_����_typeSeg)

  ' ������ �������
  Application.StatusBar = "�������� ������ " + In_Sheets + "..."

  ' ������� �� ������� "CR ��-K� (���) ��������"
  Workbooks(In_ReportName_String).Sheets(In_Sheets).Activate
  
  ' ��������� ����� �������
  column_��_����� = ColumnByValue2(In_ReportName_String, In_Sheets, "��.�����", 1000, 1000, 1)
  
  ' ������ "��������� ��1"
  row_���������_��1 = rowByValue(In_ReportName_String, In_Sheets, "��������� ��1", 1000, 1000)

  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("��������").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("��").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("����������").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("������").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("�������").Selected = True
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("(�����)").Selected = False
  Workbooks(In_ReportName_String).SlicerCaches(In_����_typeSeg).SlicerItems("").Selected = False
  Workbooks(In_ReportName_String).ShowPivotTableFieldList = False
  ' ��������� ����� ����X
  Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(row_���������_��1, column_��_����� - 1).ShowDetail = True

  ' ����������� ������� ����1
    
  '  With ActiveWorkbook.SlicerCaches("����_typeSeg41")
  '      .SlicerItems("��������").Selected = True
  '      .SlicerItems("�������").Selected = True
  '      .SlicerItems("��").Selected = True
  '      .SlicerItems("").Selected = False
  '      .SlicerItems("����������").Selected = False
  '      .SlicerItems("������").Selected = False
  '      .SlicerItems("(�����)").Selected = False
  '  End With
  '  With ActiveWorkbook.SlicerCaches("����_typeSeg41")
  '      .SlicerItems("��������").Selected = True
  '      .SlicerItems("����������").Selected = True
  '      .SlicerItems("�������").Selected = True
  '      .SlicerItems("��").Selected = True
  '      .SlicerItems("").Selected = False
  '      .SlicerItems("������").Selected = False
  '      .SlicerItems("(�����)").Selected = False
  '  End With
  '  With ActiveWorkbook.SlicerCaches("����_typeSeg41")
  '      .SlicerItems("��������").Selected = True
  '      .SlicerItems("����������").Selected = True
  '      .SlicerItems("������").Selected = True
  '      .SlicerItems("�������").Selected = True
  '      .SlicerItems("��").Selected = True
  '      .SlicerItems("").Selected = False
  '      .SlicerItems("(�����)").Selected = False
  '  End With
  '  Range("O76").Select
  '  Selection.ShowDetail = True

End Sub

' ��������_Lotus_Notes_����6_Pre_Approved �������� ������: ��������� ������ ������ ���� ��� ����������� �������� � ���� ������ �� ��� ������:
Sub ��������_Lotus_Notes_������_PA_Pre_Approved()
Dim ����������, �����������, hashTag, attachmentFile As String
Dim i As Byte
  
  ' ������������
  If MsgBox("��������� ���� ������ ������ � ��������� Pre-Approved?", vbYesNo) = vbYes Then
    
    ' ��������� ������ ��� �������� (� "������ �����������:"):
    ThisWorkbook.Sheets("��_PA").Cells(rowByValue(ThisWorkbook.Name, "��_PA", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "��_PA", "������ �����������:", 100, 100) + 2).Value _
                     = getFromAddrBook("���2,���3,���4,���5,�������1,�������2,�������3,�������4,�������5,����,����", 2)
   
    ' ���� ������ - ����:
    ���������� = "������� � Pre-Approved �� " + Mid(ThisWorkbook.Sheets("��_PA").Range("O2").Value, 37, 10)

    ' hashTag - ������:
    hashTag = hashTagFromSheet("��_PA") + " #Pre-Approved"
    
    ' ����-�������� �� "��������2"
    attachmentFile = ThisWorkbook.Sheets("��_PA").Range("AO3").Value
 
    ' ����� ������
    ����������� = "" + Chr(13)
    ����������� = ����������� + "" + ThisWorkbook.Sheets("��_PA").Cells(rowByValue(ThisWorkbook.Name, "��_PA", "������ �����������:", 100, 100), ColumnByValue(ThisWorkbook.Name, "��_PA", "������ �����������:", 100, 100) + 2).Value + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "" + getFromAddrBook("��", 2) + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������������," + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "��������� ������ �������� � ���������� �������� ��������� �� �������������� � ��." + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ����������� = ����������� + "����� ������������ ��������� � ���� �� " + CStr(weekEndDate(Date) - 2) + " � ���������� �� ����� 20% " + Chr(13)
    ����������� = ����������� + "" + Chr(13)
    ' ������� (������� � ��., )
    ����������� = ����������� + ��������������()
    ' ������
    ����������� = ����������� + createBlankStr(20) + hashTag
    
    ' �����
    Call send_Lotus_Notes(����������, "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", "Sergey Fedorovich Proschaev/Tyumen/PSBank/Ru", �����������, attachmentFile)

    ' ���������
    MsgBox ("������ ����������!")
          
  End If
  
End Sub

            
' ��������� �� �� ������� ������� � ������� �� ������ �� ������� ����3, ���� ����, �� ������ � ���� "������_���������" (���� �����������: ��������, ���� ������, ��������� � �.�.)
' ��_RetailVar
Sub ��������_������������_�������(In_ReportName_String, In_Sheets, In_��_Retail)
Dim ��_Retail_Int As Long

  ' ������� "T" - "����� �������"
  ' ������� "Q" - "��������� �������"
  
  ' ���������� � ���������� ����������
  �����_��_�_���_��_������_�� = 0
  �����_��_�_���_��_������_�����_�������� = 0
  �����_��_�_���_��_������_�����_�������� = 0
  �����_��_�_���_��_������_����_�������� = ""
  ���_��_�����_��_�_���_��_������ = ""
  
  ' �����_��������
  �����_�������� = 0
  ' �����_��������
  �����_�������� = 0

  ' ������� ����
  ��_Retail_Int = CLng(In_��_Retail)

  ' ���������
  rowCount = 8 ' ������ � 8-�� ������
  Do While Not IsEmpty(Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, 20).Value)
  
    ' ���� ��� ������� ������
    If Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, 20).Value = CStr(��_Retail_Int) Then
      
      ' ���� ���. ������� (17) > 0
      If Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, 17).Value > 0 Then
        �����_�������� = �����_�������� + 1
        �����_�������� = �����_�������� + Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, 17).Value
        �����_��_�_���_��_������_����_�������� = �����_��_�_���_��_������_����_�������� + Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, 22).Value + " "
        
        ' ����� ��� ������� �� 21-�� ������� "�.�.�."
        ���_��_�����_��_�_���_��_������ = Workbooks(In_ReportName_String).Sheets(In_Sheets).Cells(rowCount, 21).Value
        
      End If
      
    End If
  
    ' ��������� ������
    rowCount = rowCount + 1
    Application.StatusBar = "�������� ������� ��������: " + CStr(rowCount) + "..."
    DoEventsInterval (rowCount)
  Loop
  
  ' ���������� � ���������� ����������
  If �����_�������� <> 0 Then
    �����_��_�_���_��_������_�� = In_��_Retail
    �����_��_�_���_��_������_�����_�������� = �����_��������
    �����_��_�_���_��_������_�����_�������� = �����_��������
  End If
  
End Sub

