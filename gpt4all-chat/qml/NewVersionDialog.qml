import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import download
import network
import llm

MyDialog {
    id: newVerionDialog
    anchors.centerIn: parent
    modal: true
    width: contentItem.width
    height: contentItem.height
    padding: 10

    Theme {
        id: theme
    }

    Item {
        id: contentItem
        width: childrenRect.width + 40
        height: childrenRect.height + 40

        Label {
            id: label
            anchors.top: parent.top
            anchors.left: parent.left
            topPadding: 20
            bottomPadding: 20
            text: qsTr("New version is available:")
            color: theme.textColor
        }

        MyButton {
            id: button
            anchors.left: label.right
            anchors.leftMargin: 10
            anchors.verticalCenter: label.verticalCenter
            padding: 20
            text: qsTr("Update")
            Accessible.description: qsTr("Update to new version")
            onClicked: {
                if (!LLM.checkForUpdates())
                    checkForUpdatesError.open()
            }
        }
    }
}
