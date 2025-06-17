import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    objectName: "hideKey"
    functionKey: true
    showPreview: false
    onClicked: Qt.inputMethod.hide()
    btnBackground: InputPanel.btnSpecialBackgroundColor
    btnIcon: InputPanel.hideKeyboardIcon
}
