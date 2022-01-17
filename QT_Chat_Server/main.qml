import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QT Chat Server")

    Connections {
        target: Server
        function onNewMessage(ba) {
            listModelMessages.append({
                                        message: ba + " "
                                     })
        }
    }

    ColumnLayout {
        anchors.fill: parent
        ListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            model: ListModel {
                id: listModelMessages
                ListElement {
                    message: "Welcome to the Server!"
                }
            }
            delegate: ItemDelegate {
                text: message
            }
            ScrollBar.vertical: ScrollBar { }
        }
        RowLayout {
            TextField {
                id: textFieldMessage
                placeholderText: qsTr("Type your message...")
                Layout.fillWidth: true
                onAccepted: buttonSend.clicked()
            }
            Button {
                id: buttonSend
                text: qsTr("Send")
                onClicked: {
                    Server.sendMessage(textFieldMessage.text)
                    textFieldMessage.clear()
            }
        }

    }
}
}
