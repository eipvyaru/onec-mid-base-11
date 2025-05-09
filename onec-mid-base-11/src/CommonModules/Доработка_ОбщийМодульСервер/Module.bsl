Процедура ДобавитьПолеКонтактногоЛица(Форма) Экспорт 
	ЭлДоговор = Форма.Элементы.Найти("Договор");
	Если ЭлДоговор <> Неопределено  и ЭлДоговор.ПутьКДанным = "Объект.Договор" Тогда  
		Инд = ЭлДоговор.Родитель.ПодчиненныеЭлементы.Индекс(ЭлДоговор);
		Если  ЭлДоговор.Родитель.ПодчиненныеЭлементы.Количество()> Инд+1 Тогда 
			ПолеКЛ = Форма.Элементы.Вставить("пКонтактноеЛицо",Тип("ПолеФормы"),ЭлДоговор.Родитель, ЭлДоговор.Родитель.ПодчиненныеЭлементы[Инд+1]);
		Иначе 
			ПолеКЛ = Форма.Элементы.Вставить("пКонтактноеЛицо",Тип("ПолеФормы"),ЭлДоговор.Родитель);
		КонецЕсли;
		ПолеКЛ.ПутьКДанным = "Объект.Расш1_КонтактноеЛицо";
		ПолеКЛ.Вид = ВидПоляФормы.ПолеВвода;
		ПолеКЛ.Заголовок = "Контактное лицо";
	КонецЕсли;
КонецПроцедуры

Процедура ДобавитьПолеСогласованнаяСкидка(Форма) Экспорт 
	Элемент = Форма.Элементы.Найти("Организация");
	пГруппа = Форма.Элементы.Вставить("пГруппа",Тип("ГруппаФормы"),Элемент.Родитель); 
	пГруппа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	пГруппа.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяВсегда; 
	пГруппа.ОтображатьЗаголовок = Ложь; 
	
	ПолеКЛ = Форма.Элементы.Вставить("пСогласованнаяСкидка",Тип("ПолеФормы"),пГруппа);
	ПолеКЛ.ПутьКДанным = "Объект.Расш1_СогласованнаяСкидка";
	ПолеКЛ.Вид = ВидПоляФормы.ПолеВвода;
	ПолеКЛ.Заголовок = "Согласованная скидка";
	ПолеКЛ.УстановитьДействие("ПриИзменении","Расш1_ПересчитатьСоСкидкойВместо");
	
	Команда = Форма.Команды.Добавить("ПересчитатьСоСкидкой");
	Команда.Заголовок = "Пересчитать со скидкой";
	Команда.Действие = "Расш1_ПересчитатьСоСкидкойВместо"; 
	
	Кнопка = Форма.Элементы.Вставить("кПересчитатьСоСкидкой",Тип("КнопкаФормы"),пГруппа);
	Кнопка.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	Кнопка.ИмяКоманды = "ПересчитатьСоСкидкой";
КонецПроцедуры