createDialog "OT_dialog_confirm";

[
	{
		disableSerialization;
		params ["_text","_okButton","_cancelButton"];
		private _textCtrl = (findDisplay 8150) displayCtrl 1100;
		_textCtrl ctrlSetStructuredText parseText _text;
		
		private _okCtrl = (findDisplay 8150) displayCtrl 1600;
		_okCtrl ctrlSetStructuredText parseText _okButton;
		
		private _cancelCtrl = (findDisplay 8150) displayCtrl 1601;
		_cancelCtrl ctrlSetStructuredText parseText _cancelButton;
	},
	_this
] call CBA_fnc_waitAndExecute;