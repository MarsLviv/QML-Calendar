//
var months = ["January", "February", "March", "April", "May", "June"
        ,"July", "August", "September", "October", "November", "December"];
var d = new Date();
var year = d.getFullYear();
var mon = d.getMonth();//0-11
var day = d.getDay();// 0-6
var date = d.getDate();//1-31

function leapYear(year){
    return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
 }

function getNumberDaysInMonth(month, year) {// month 0-11
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8
            || month == 10 || month == 12)
        return 31;
    if (month == 4 || month == 6 || month == 9 || month == 11)
        return 30;
    if (month == 2 && leapYear(year))
        return 29;
    else
        return 28;
}

function getFirstDayInMonth() {// in current month
    var m_date = date;
    var FirstDayInMonth = day;
    while (m_date != 1){
        m_date--; FirstDayInMonth--;
        if (FirstDayInMonth == -1)
            FirstDayInMonth = 6;
    }
    return FirstDayInMonth; // return 0-6
}

function getLastDayInMonth() {  // in current month
    var first_day = getFirstDayInMonth();
    var daysInMonth = getNumberDaysInMonth(mon + 1, year);
    var LastDayInMonth = first_day + daysInMonth - 1;
    LastDayInMonth = LastDayInMonth % 7;
    return LastDayInMonth;              // return 0-6
}

function getFirstDayInMonthFromLast(last) { //  Need to handle prev. month
    var daysInMonth = getNumberDaysInMonth(toShowMonth + 1, toShowYear);
    var FirstDayInMonth = last;
    while (daysInMonth > 1){
        FirstDayInMonth--;
        daysInMonth--;
        if (FirstDayInMonth == -1)
            FirstDayInMonth = 6;
    }
    return FirstDayInMonth;             // return 0-6
}

function getLastDayInMonthFromFirst(first/* 0-6 */) { //  Need to handle next month
    var daysInMonth = getNumberDaysInMonth(toShowMonth + 1, toShowYear);
    var LastDayInMonth = first + daysInMonth - 1;
    LastDayInMonth = LastDayInMonth % 7;
    return LastDayInMonth;              // return 0-6
}

var toShowFirstDay = getFirstDayInMonth();
var toShowLastDay = getLastDayInMonth();
var toShowMonth = mon;
var toShowYear = year;
