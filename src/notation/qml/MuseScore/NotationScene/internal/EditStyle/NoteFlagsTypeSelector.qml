/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-CLA-applies
 *
 * MuseScore
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore BVBA and others
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.15

import MuseScore.NotationScene 1.0
import MuseScore.UiComponents 1.0
import MuseScore.Ui 1.0

Rectangle {
    anchors.fill: parent
    color: ui.theme.backgroundPrimaryColor

    signal requestedUseStraightFlags(bool use)

    NoteFlagsTypeSelectorModel {
        id: selectorModel
    }

    Component.onCompleted: {
        selectorModel.load()
    }

    RadioButtonGroup {
        width: 224
        height: 70
        spacing: 12

        model: [
            { iconCode: IconCode.NOTEFLAGS_TRADITIONAL, text: qsTrc("notation", "Traditional"), value: false },
            { iconCode: IconCode.NOTEFLAGS_STRAIGHT, text: qsTrc("notation", "Straight"), value: true }
        ]

        delegate: FlatRadioButton {
            width: 106
            height: 70

            checked: modelData.value === selectorModel.useStraightNoteFlags

            Column {
                anchors.centerIn: parent
                height: childrenRect.height
                spacing: 8

                StyledIconLabel {
                    anchors.horizontalCenter: parent.horizontalCenter
                    iconCode: modelData.iconCode
                    font.pixelSize: 32
                }

                StyledTextLabel {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: modelData.text
                }
            }

            onToggled: {
                selectorModel.useStraightNoteFlags = modelData.value
            }
        }
    }
}
