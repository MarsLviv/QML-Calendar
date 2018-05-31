/*  Version 1.0
    finished 2018.05.23
    This is lab. work from online Qt Training Course "Qt Quick & QML"
    https://www.qt.io/qt-training/
  */
import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1
import "functions.js" as JS

Window {
    visible: true
    width: 460
    height: 320
    color: "black"
    title: qsTr("Calendar")
    id: root
    property int factorW: 23
    property int w: Math.floor(width / factorW)
    property int factor1: 16
    property int h: Math.floor(height / factor1)// height of one text-row;  grid
    //property alias rep: days.rep                // 2*h - height of one day
    MonthYear {
         id: month_year; //color: "blue";
         x: 0; y: 0
         width: parent.width; height: h
         w: root.w
         h: root.h
    }

    Week {
        id: week; //color: "red";
        x: 0; y: month_year.height
        width: parent.width; height: h
        w: root.w
        h: root.h
    }

    Rectangle {
        id: days; color: "black";
        x: 0; y: month_year.height + week.height
        width: parent.width; height: h * 14
        Grid {
                x: Math.floor(root.w / 4); y: Math.floor(root.h / 4)
                width: parent.width; height: h * 14
                rows: 6; columns: 7; spacing: Math.floor(root.w / 4) + 1
                id: grid
                Repeater {
                    model: parent.rows * parent.columns
                    id: rep
                    Rectangle {
                        property alias text: txt_i.text
                        width: root.w * 3
                        height: root.h * 2
                        color: "black"
                        Text {
                            id: txt_i
                            text: qsTr(" ")
                            font.pixelSize: root.h
                            anchors.centerIn: parent;
                        }
                    }
                }// repeater
                Component.onCompleted: {
                    for (var i = 0; i < JS.getNumberDaysInMonth(JS.mon + 1, JS.year); i++) {
                        rep.itemAt(i + JS.getFirstDayInMonth()).color = "white"
                        rep.itemAt(i + JS.getFirstDayInMonth()).text = i + 1
                    }
                    // show current days
                    if (JS.toShowMonth == JS.mon && JS.toShowYear == JS.year){
                        rep.itemAt(JS.date + JS.toShowFirstDay - 1).color = "lightgreen"
                    }
                }
            }// grid
    }
}
