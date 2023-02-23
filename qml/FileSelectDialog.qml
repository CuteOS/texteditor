/*
 * Copyright (C) 2022 CuteOS Team.
 *
 * Author:     TsukuyomiToki <huangzimocp@126.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import CuteUI 1.0 as CuteUI

CuteUI.Window {
    id: control

    property var contentWidth: _mainLayout.implicitWidth + CuteUI.Units.largeSpacing * 2
    property var contentHeight: _mainLayout.implicitHeight + header.height + CuteUI.Units.largeSpacing * 2
    property var fileUrl: ""
    property var displayText: ""

    flags: Qt.WindowStaysOnTopHint | Qt.Dialog | Qt.FramelessWindowHint
    modality: Qt.WindowModal
    visible: false

    width: contentWidth
    height: contentHeight
    minimumWidth: contentWidth
    minimumHeight: contentHeight
    maximumWidth: contentWidth
    maximumHeight: contentHeight
    minimizeButtonVisible: false

    background.color: CuteUI.Theme.secondBackgroundColor

    signal okBtnClicked

    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent
        spacing: CuteUI.Units.smallSpacing
        anchors.margins: CuteUI.Units.smallSpacing

        Label {
            text: displayText
        }
        ColumnLayout {
            spacing: CuteUI.Units.largeSpacing

            TextInput{
                id:textInput
                height: CuteUI.Units.largeSpacing
                width: parent.width
                activeFocusOnPress: true
                autoScroll: true
                selectByMouse: true
                horizontalAlignment: TextInput.AlignLeft
                text: fileUrl

                onAccepted: {
                    fileUrl = text
                    control.visible = false
                    control.okBtnClicked()
                }
            }

            RowLayout {
                spacing: CuteUI.Units.largeSpacing

                Button {
                    text: qsTr("OK")
                    Layout.fillWidth: true
                    flat: true

                    onClicked: {
                        fileUrl = textInput.text
                        control.visible = false
                        control.okBtnClicked()
                    }
                }

                Button {
                    text: qsTr("Cancel")
                    Layout.fillWidth: true
                    onClicked: control.visible = false
                }
            }
        }
    }
}
