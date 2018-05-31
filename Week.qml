import QtQuick 2.0

Rectangle {
    property int h:  undefined
    property int w:  undefined
    id: week
        Row {
                id: row1
                property int factor1: 20
                Rectangle {
                    id: rec1; color: "black"
                    height: week.h
                    width: week.width / 7
                    //Component.onCompleted: {console.log("height: " + rec1.height)}
                    Text {
                        id: t1; color: "white"
                        anchors.centerIn: parent;
                        font.family: "Helvetica"; text: "Sun";
                        font.pixelSize: week.h - 2
                        width: parent.width; elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Rectangle {
                    id: rec2; color: "black"
                    height: week.h
                    width: week.width / 7
                    anchors {left: rec1.right; }
                    Text {
                        id: t2; color: "white"
                        anchors.centerIn: parent; font.family: "Helvetica"; text: "Mon";
                        font.pixelSize: week.h - 2
                        width: parent.width; elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Rectangle {
                    id: rec3; color: "black"
                    height: week.h
                    width: week.width / 7
                    anchors {left: rec2.right; }
                    Text {
                        id: t3; color: "white"
                        anchors.centerIn: parent; font.family: "Helvetica"; text: "Tue";
                        font.pixelSize: week.h - 2
                        width: parent.width; elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Rectangle {
                    id: rec4; color: "black"
                    height: week.h
                    width: week.width / 7
                    anchors {left: rec3.right; }
                    Text {
                        id: t4; color: "white"
                        anchors.centerIn: parent; font.family: "Helvetica"; text: "Wed";
                        font.pixelSize: week.h - 2
                        width: parent.width; elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Rectangle {
                    id: rec5; color: "black"
                    height: week.h
                    width: week.width / 7
                    anchors {left: rec4.right; }
                    Text {
                        id: t5; color: "white"
                        anchors.centerIn: parent; font.family: "Helvetica"; text: "Thu";
                        font.pixelSize: week.h - 2
                        width: parent.width; elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Rectangle {
                    id: rec6; color: "black"
                    height: week.h
                    width: week.width / 7
                    anchors {left: rec5.right; }
                    Text {
                        id: t6; color: "white"
                        anchors.centerIn: parent; font.family: "Helvetica"; text: "Fri";
                        font.pixelSize: week.h - 2
                        width: parent.width; elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                Rectangle {
                    id: rec7; color: "black"
                    height: week.h
                    width: week.width / 7
                    anchors {left: rec6.right; }
                    Text {
                        id: t7; color: "white"
                        anchors.centerIn: parent; font.family: "Helvetica"; text: "Sat";
                        font.pixelSize: week.h - 2
                        width: parent.width; elide: Text.ElideRight
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
    }
