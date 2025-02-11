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
.pragma library

function colorWithAlpha(color, alpha) {
    return Qt.rgba(color.r, color.g, color.b, alpha)
}

function colorToString(color) {
    var percentName = qsTrc("uicomponents", "percent")
    var colorValueToPercent = function(value) {
        return Math.floor(value * 100)
    }

    var colorValueTemplate = "%1 %2 %3 "
    var text = colorValueTemplate.arg(qsTrc("uicomponents", "Red")).arg(colorValueToPercent(color.r)).arg(percentName)
            + colorValueTemplate.arg(qsTrc("uicomponents", "Green")).arg(colorValueToPercent(color.g)).arg(percentName)
            + colorValueTemplate.arg(qsTrc("uicomponents", "Blue")).arg(colorValueToPercent(color.b)).arg(percentName)

    return text
}
