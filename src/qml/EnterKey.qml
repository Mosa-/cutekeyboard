import CuteKeyboard 1.0
import QtQuick 2.0

Key {
    objectName: "enterKey"
    btnKey: Qt.Key_Enter
    repeatable: true
    showPreview: false
    btnBackground: InputPanel.btnSpecialBackgroundColor
    btnText: "\n"
    btnDisplayedText: InputPanel.enterIcon === "" && enabled ? "Enter" : ""
    btnIcon: InputPanel.enterIcon === "" && !enabled ? "" : InputPanel.enterIcon
    enabled: InputContext.inputItem ? InputPanel.enterKeyEnabled && InputContext.inputItem.EnterKeyAction.enabled : true
}
