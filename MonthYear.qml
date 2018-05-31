import QtQuick 2.0
import "functions.js" as JS

Rectangle {
    property int h:  undefined
    property int w:  undefined
    id: month_year; color: "black";
    property alias text: r2.text
    Rectangle {
        id: r1; color: "black"
        height: month_year.h
        width: month_year.h * 2
        Image {
            id: img_L
            source: "left.png"
            property int factor1: 20
            width: month_year.h; height: month_year.h
            anchors { verticalCenter: parent.verticalCenter; }
        }
        MouseArea {
            id: ma1;
            anchors.fill: r1
            onClicked: {
                if (JS.toShowMonth == 0){// get previous month and year
                    JS.toShowMonth = 11; --JS.toShowYear;}
                else
                    --JS.toShowMonth;
                if (JS.toShowFirstDay == 0)// get First and Last days in prev. month
                    JS.toShowLastDay = 6;
                else
                    JS.toShowLastDay = JS.toShowFirstDay - 1;
                JS.toShowFirstDay = JS.getFirstDayInMonthFromLast(JS.toShowLastDay);
                //console.log("LEFT year:" + JS.toShowYear + "  month:" + JS.toShowMonth);
                month_year.text = JS.months[JS.toShowMonth] + " " + JS.toShowYear
                // fill the boxes
                for (var i = 0; i < 42; i++) {
                    rep.itemAt(i).color = "black" // toShowFirstDay
                }
                for (var i = 0; i < JS.getNumberDaysInMonth(JS.toShowMonth + 1, JS.toShowYear); i++) {
                    rep.itemAt(i + JS.toShowFirstDay).color = "white"
                    rep.itemAt(i + JS.toShowFirstDay).text = i + 1
                }
                // show current days
                if (JS.toShowMonth == JS.mon && JS.toShowYear == JS.year){
                    rep.itemAt(JS.date + JS.toShowFirstDay - 1).color = "lightgreen"
                }
            }
        }//ma1
    }
    Rectangle {
        id: r2; color: "black"
        property alias text: t11.text
        anchors {left: r1.right; }
        height: month_year.h
        width: month_year.width - month_year.h * 4
        Text {
            id: t11
            font.family: "Helvetica"
            property string s: JS.months[JS.mon] + " " + JS.year
            font.pixelSize: month_year.h - 2
            anchors { verticalCenter: parent.verticalCenter;
                horizontalCenter: parent.horizontalCenter}
            color: "white"
            text: s
        }
    }
    Rectangle {
        id: r3; color: "black"
        height: month_year.h
        width: month_year.h * 2
        anchors { left: r2.right}
        Image {
            id: img_R
            source: "right.png"
            property int factor1: 20
            width: month_year.h; height: month_year.h
            anchors { verticalCenter: parent.verticalCenter; right: r3.right}
        }
        MouseArea {
            id: ma2;
            anchors.fill: r3
            onClicked: {
                if (JS.toShowMonth == 11){// get next month and year
                    JS.toShowMonth = 0; ++JS.toShowYear;}
                else
                    ++JS.toShowMonth;
                if (JS.toShowLastDay == 6)// get First and Last days in next month
                    JS.toShowFirstDay = 0;
                else
                    JS.toShowFirstDay = JS.toShowLastDay + 1;

                JS.toShowLastDay = JS.getLastDayInMonthFromFirst(JS.toShowFirstDay);
                //console.log("RIGHT year:" + JS.toShowYear + "  month:" + JS.toShowMonth);

                // fill month and year in top
                month_year.text = JS.months[JS.toShowMonth] + " " + JS.toShowYear
                // fill the boxes with dates
                for (var i = 0; i < 42; i++) {
                    rep.itemAt(i).color = "black" // toShowFirstDay
                }
                for (var i = 0; i < JS.getNumberDaysInMonth(JS.toShowMonth + 1, JS.toShowYear); i++) {
                    rep.itemAt(i + JS.toShowFirstDay).color = "white"
                    rep.itemAt(i + JS.toShowFirstDay).text = i + 1
                }
                // show current days
                if (JS.toShowMonth == JS.mon && JS.toShowYear == JS.year){
                    rep.itemAt(JS.date + JS.toShowFirstDay - 1).color = "lightgreen"
                }
            }
        }//ma1
    }
}
