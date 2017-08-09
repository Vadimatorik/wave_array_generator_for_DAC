Program Sin_wav;
Var Real_Data,
    PR: double;           //Периуд волны.
    samplerate: word;     //Частота сэмпла.
    wavefrequency: double;//Частота волны. 
    Loop: word;           //Счетчик.
    Name: string;         //Имя массива.
Begin
    write('Частота сэмпла: '); readln(samplerate);   //Получаем данные.
    write('Частота волны: ');  readln(wavefrequency);
    write('Имя массива:  ');   readln(Name);
    write('const uint16_t ', Name, '[', samplerate, '] = {');
    PR:=samplerate/2;                                //Вычисляем периуд.
    for Loop:=0 to samplerate-1 do                   //-1, т.к. считаем с 0.
    Begin
    Real_Data := 70*sin(Loop*pi/PR) + 2047;        //Вычисление sine-волны.
    //Т.к. мы не можем создать отрицательое напряжение - поднимим 0 до середины.
    //Таким образом 2048-1 (от 0 до 4095) = 0, а 2045 = -2.
    //2047 - половина разрешения нашего ЦАП. Половина +, половина -. И 0.
    write(Round(Real_Data));
    if (Loop<>samplerate-1) then write(', ');
    End;
    write('};')
End.