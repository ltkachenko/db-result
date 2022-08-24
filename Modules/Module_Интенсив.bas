Attribute VB_Name = "Module_Интенсив"
' *** Лист Интенсив ***

' Обновление данных с Лист8
Sub Интенсив_Обновить_данные()
Attribute Интенсив_Обновить_данные.VB_ProcData.VB_Invoke_Func = " \n14"

  ' Обнулить значения в ячейках
  ' Цикл по 5-ти офисам
  ' Обработка отчета
  For i = 1 To 5
        
    ' Номера офисов от 1 до 5
    Select Case i
      Case 1 ' ОО «Тюменский»
        officeNameInReport = "Тюменский"
      Case 2 ' ОО «Сургутский»
        officeNameInReport = "Сургутский"
      Case 3 ' ОО «Нижневартовский»
        officeNameInReport = "Нижневартовский"
      Case 4 ' ОО «Новоуренгойский»
        officeNameInReport = "Новоуренгойский"
      Case 5 ' ОО «Тарко-Сале»
        officeNameInReport = "Тарко-Сале"
    End Select

    ' Выводим данные по офису
    офис = ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 2).Value
    План_ИСЖ = ThisWorkbook.Sheets("Лист8").Cells(getRowFromSheet8(офис, "Премия ИСЖ МАСС"), 5).Value
    План_НСЖ = ThisWorkbook.Sheets("Лист8").Cells(getRowFromSheet8(офис, "Премия НСЖ МАСС"), 5).Value
    '
    Факт_ИСЖ = ThisWorkbook.Sheets("Лист8").Cells(getRowFromSheet8(офис, "Премия ИСЖ МАСС"), 6).Value
    Факт_НСЖ = ThisWorkbook.Sheets("Лист8").Cells(getRowFromSheet8(офис, "Премия НСЖ МАСС"), 6).Value
    
    ' План
    ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 3).Value = План_ИСЖ + План_НСЖ
    ' Факт
    ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 4).Value = Факт_ИСЖ + Факт_НСЖ
    ' Итого Факт (Дашбоард+Продажи)
    Общий_факт = ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 4).Value + ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 5).Value
    ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 6).Value = Общий_факт
                
    ' Прогноз на текущую дату
    Дата_расчета = Date
    ' Делаем расчет прогноза между ДатаНачалаКвартала и ДатаКонцаКвартала
    ДатаНачалаКвартала = quarterStartDate(Дата_расчета)
    ДатаКонцаКвартала = Date_last_day_quarter(Дата_расчета)
    '
    Число_прошедших_раб_дней = Working_days_between_datesII(ДатаНачалаКвартала, Дата_расчета, 5)
    Число_раб_дней_квартал = Working_days_between_datesII(ДатаНачалаКвартала, ДатаКонцаКвартала, 5)
            
    Прогноз_квартал = (Общий_факт / Число_прошедших_раб_дней) * Число_раб_дней_квартал
    Прогноз_квартал_% = (План_ИСЖ + План_НСЖ) / Прогноз_квартал
    
    ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 7).Value = РассчетДоли((План_ИСЖ + План_НСЖ), Прогноз_квартал, 3)
            
                
    ' Прогноз на 11.03
    Дата_расчета = CDate("11.03.2021")
    ' Делаем расчет прогноза между ДатаНачалаКвартала и ДатаКонцаКвартала
    ДатаНачалаКвартала = quarterStartDate(Дата_расчета)
    ДатаКонцаКвартала = Date_last_day_quarter(Дата_расчета)
    '
    Число_прошедших_раб_дней = Working_days_between_datesII(ДатаНачалаКвартала, Дата_расчета, 5)
    Число_раб_дней_квартал = Working_days_between_datesII(ДатаНачалаКвартала, ДатаКонцаКвартала, 5)
            
    Прогноз_квартал = (Общий_факт / Число_прошедших_раб_дней) * Число_раб_дней_квартал
    Прогноз_квартал_% = (План_ИСЖ + План_НСЖ) / Прогноз_квартал
    
    ' ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 9).Value = РассчетДоли((План_ИСЖ + План_НСЖ), Прогноз_квартал, 3)
            
    
    ' Ожидаемый факт для прогноза 80%
    ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 8).Value = ((План_ИСЖ + План_НСЖ) * Число_прошедших_раб_дней) / (0.8 * Число_раб_дней_квартал)
            
    ' Расчет
    Прогноз_квартал = (ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 8).Value / Число_прошедших_раб_дней) * Число_раб_дней_квартал
    Прогноз_квартал_% = (План_ИСЖ + План_НСЖ) / Прогноз_квартал
    ThisWorkbook.Sheets("Интенсив").Cells(6 + i, 9).Value = Прогноз_квартал_%
                    
  Next i ' Следующий офис

End Sub