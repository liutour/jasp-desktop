//
// Copyright (C) 2013-2018 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//

import QtQuick			2.11
import QtQuick.Controls 2.4
import JASP				1.0

JASPControl
{
	controlType:				JASPControlBase.Switch
	implicitWidth:				control.indicator.height + (4 * preferencesModel.uiScale)
	implicitHeight:				control.indicator.width + controlLabel.implicitWidth + control.spacing + (6 * preferencesModel.uiScale)
	innerControl:				control
	title:						label
	
	property alias control:		control
	property alias label:		control.text
	property alias checked:		control.checked
    signal clicked();
    
	Component.onCompleted: control.clicked.connect(clicked);
    
	Switch
	{
		id:				control
		anchors.fill:	parent

		indicator:	Rectangle
		{
			id:				switchHandle
			width:			jaspTheme.switchHeight * 2.2
			height:			jaspTheme.switchHeight
			radius:			jaspTheme.switchHeight / 2
			color:			jaspTheme.light
			border.color:	jaspTheme.borderColor
			anchors
			{
				left:		control.left
				leftMargin: 2 * preferencesModel.uiScale
				top:		control.top
				topMargin:	2 * preferencesModel.uiScale
			}
    
			Rectangle
			{
				id:				rectangle
				width:			jaspTheme.switchHeight
				height:			jaspTheme.switchHeight
				radius:			jaspTheme.switchHeight / 2
				color:			jaspTheme.light
				border.color:	jaspTheme.borderColor
            }
        }
        
		contentItem: Label
		{
			id:				controlLabel
			text:			control.text
			font:			jaspTheme.font
			color:			enabled ? jaspTheme.textEnabled : jaspTheme.textDisabled
			anchors
			{
				left:		control.indicator.right
				leftMargin: control.spacing
				top:		control.top
				topMargin:	2 * preferencesModel.uiScale
			}
        }
    }
}
