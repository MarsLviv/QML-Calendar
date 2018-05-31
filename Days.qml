import QtQuick 2.0
import "functions.js" as JS

Rectangle {
    property int h:  undefined
    property int w:  undefined
    id: days; color: "black";
    //property alias rep: grid.rep
    Grid {
            x: Math.floor(days.w / 4); y: Math.floor(days.h / 4)
            width: days.width; height: h * 14
            rows: 6; columns: 7; spacing: Math.floor(days.w / 4) + 1
            id: grid
            //property alias rep: rep.id
            Repeater {
                model: parent.rows * parent.columns
                id: rep
                Rectangle {
                    property alias text: txt_i.text
                    width: days.w * 3
                    height: days.h * 2
                    color: "black"
                    Text {
                        id: txt_i
                        text: qsTr(" ")
                        font.pixelSize: days.h
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
                if (JS.toShowMonth == JS.mon){
                    rep.itemAt(JS.date + JS.toShowFirstDay - 1).color = "lightgreen"
                }
            }
        }// grid
}
