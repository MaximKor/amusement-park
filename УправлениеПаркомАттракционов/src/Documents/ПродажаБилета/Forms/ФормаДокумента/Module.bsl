

#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы


#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура НоменклатураПриИзменении(Элемент)
	Объект.СуммаДокумента = ПолучитьЦенуНоменклатуры(Объект.Номенклатура, Объект.Дата);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы //<ИмяТаблицыФормы>

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиКомандФормы

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервереБезКонтекста
Функция ПолучитьЦенуНоменклатуры(Знач Номенклатура, Знач Период)
	
	Цена = 0;
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ЦеныНоменклатурыСрезПоследних.Цена
		|ИЗ
		|	РегистрСведений.ЦеныНоменклатуры.СрезПоследних(&Период, Номенклатура = &Номенклатура) КАК
		|		ЦеныНоменклатурыСрезПоследних";
	
	Запрос.УстановитьПараметр("Номенклатура", Номенклатура);
	Запрос.УстановитьПараметр("Период", Период);
	
	РезультатЗапроса = Запрос.Выполнить().Выбрать();
	Если РезультатЗапроса.Следующий() Тогда
		Цена = РезультатЗапроса.Цена;		
	КонецЕсли;

	Возврат Цена;
КонецФункции

#КонецОбласти
