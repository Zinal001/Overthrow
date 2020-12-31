private _veh = _this select 0;

if (not isNull _veh) then
{
	_veh addAction [
		"Remove",
		{
			private _target = _this select 0;
			OT_RemContext = _target;
			
			private _actionId = _this select 2;
			OT_RemContext removeAction _actionId;
			
			private _targetType = typeOf OT_RemContext;
			private _dist = player distance2D OT_RemContext;
			
			private _conf = configOf OT_RemContext;
			
			private _displayName = getText (_conf >> "DisplayName");
			
			if (_displayName == "") then
			{
				_displayName = _targetType;
			};
			
			OT_confirmHandler = {
				private _btnClicked = _this select 1;
				if (_btnClicked == 1) then
				{
					deleteVehicle OT_RemContext;
				}
				else
				{
					[OT_RemContext] spawn OT_fnc_addRemoveMenu;
				};
			};
			
			[format ["Remove %1 (%2m away)?", _displayName, _dist toFixed 2], "Yes", "No"] call OT_fnc_confirmDialog;
			
		},
		nil,
		1.5,
		false,
		false,
		"",
		"true",
		10
	];
};