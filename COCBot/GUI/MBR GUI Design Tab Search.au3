; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GKevinOD (2014)
; Modified ......: DkEd, Hervidero (2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;~ -------------------------------------------------------------
;~ Search Tab
;~ -------------------------------------------------------------

$tabSearch = GUICtrlCreateTabItem(GetTranslated(2,1, "Search"))
	Local $x = 30, $y = 150
	$grpSearchMode = GUICtrlCreateGroup(GetTranslated(2,57,"Search Mode"), $x - 20, $y - 20, 225, 55) ;search mode
		$cmbSearchMode = GUICtrlCreateCombo("", $x , $y, 190, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(2,5, "Only Deadbases: full collectors. Most loot outside of village.") & @CRLF & GetTranslated(2,6,"Only LiveBases: full storages. Most loot inside of village.") & @CRLF & GetTranslated(2,7,"Dual Mode: Search for both, whatever comes first is attacked.")
			GUICtrlSetData(-1, GetTranslated(2,2, "Only DeadBases") & "|" & GetTranslated(2,3, "Only LiveBases") & "|" & GetTranslated(2,4, "Both DeadBases and LiveBases") , GetTranslated(2,2, "Only DeadBases"))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbSearchMode")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$x = 260
	$grpSearchOptions = GUICtrlCreateGroup( GetTranslated(2,8, "Search Options"), $x - 20, $y - 20, 220, 55);search options
		$chkAlertSearch = GUICtrlCreateCheckbox(GetTranslated(2,9, "Alert me when a Base is found."), $x, $y -8, -1, -1, $BS_MULTILINE)
			GUICtrlSetTip(-1, GetTranslated(2,10, "Check this if you want an Audio alarm & a Balloon Tip when a Base to attack is found."))
			GUICtrlSetState(-1, $GUI_CHECKED)
	$y +=11
		$chkRestartSearchLimit = GUICtrlCreateCheckbox( GetTranslated(2,11, "Restart every") & ":", $x, $y + 1, -1, -1)
			$txtTip = GetTranslated(2,12, "Return To Base after x searches and restart to search enemy villages.")
			GUICtrlSetTip(-1, $txtTip)
			 GUICtrlSetOnEvent(-1, "chkRestartSearchLimit")
		$txtRestartSearchlimit = GUICtrlCreateInput("15", $x + 86, $y + 2, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetState(-1, $GUI_DISABLE)
		$lblRestartSearchLimit = GUICtrlCreateLabel( GetTranslated(2,13,"searches."), $x + 117, $y + 5, -1, -1)


	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 210
	$grpDeadBaseConditions = GUICtrlCreateGroup(GetTranslated(2,14, "DeadBase Conditions  ( full collectors )"), $x - 20, $y - 20, 225, 255)
		$chkDBEnableAfter = GUICtrlCreateCheckbox(GetTranslated(2,15, "Delay Start"), $x, $y, -1, -1)
			$txtTip = GetTranslated(2,16, "Search for a Dead Base after this No. of searches, start searching for Live Bases first..")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkDBEnableAfter")
			GUICtrlSetState(-1, $GUI_HIDE)
		$txtDBEnableAfter = GUICtrlCreateInput("150", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,17, "No. of searches to wait before activating this mode.")
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetState(-1, $GUI_HIDE)
		$lblDBEnableAfter = GUICtrlCreateLabel(GetTranslated(2,18, "search(es)."), $x + 132, $y + 4, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
		$y += 21
		$cmbDBMeetGE = GUICtrlCreateCombo("", $x , $y + 10, 65, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(2,19, "Search for a base that meets the values set for Gold And/Or/Plus Elixir.") & @CRLF & GetTranslated(2,20, "AND: Both conditions must meet, Gold and Elixir.") & @CRLF & GetTranslated(2,21, "OR: One condition must meet, Gold or Elixir.") & @CRLF & GetTranslated(2,22, "+ (PLUS): Total amount of Gold + Elixir must meet.")
			GUICtrlSetData(-1, GetTranslated(2,23, "G And E") &"|" & GetTranslated(2,24, "G Or E") & "|" & GetTranslated(2,25, "G + E"), GetTranslated(2,23, "G And E"))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbDBGoldElixir")
		$txtDBMinGold = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,26, "Set the Min. amount of Gold to search for on a village to attack.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picDBMinGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$txtDBMinElixir = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,27, "Set the Min. amount of Elixir to search for on a village to attack.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picDBMinElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y -= 11
		$txtDBMinGoldPlusElixir = GUICtrlCreateInput("160000", $x + 80, $y, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,28, "Set the Min. amount of Gold + Elixir to search for on a village to attack.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picDBMinGPEGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$lblDBMinGPE = GUICtrlCreateLabel("+", $x + 147, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picDBMinGPEElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 153, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$y += 31
		$chkDBMeetDE = GUICtrlCreateCheckbox(GetTranslated(2,29, "Dark Elixir"), $x , $y, -1, -1)
			$txtTip = GetTranslated(2,30, "Search for a base that meets the value set for Min. Dark Elixir.")
			GUICtrlSetOnEvent(-1, "chkDBMeetDE")
			GUICtrlSetTip(-1, $txtTip)
		$txtDBMinDarkElixir = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,31, "Set the Min. amount of Dark Elixir to search for on a village to attack.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			_GUICtrlEdit_SetReadOnly(-1, True)
		$picDBMinDarkElixir = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkDBMeetTrophy = GUICtrlCreateCheckbox(GetTranslated(2,32, "Trophies"), $x, $y, -1, -1)
			$txtTip = GetTranslated(2,33, "Search for a base that meets the value set for Min. Trophies.")
			GUICtrlSetOnEvent(-1, "chkDBMeetTrophy")
			GUICtrlSetTip(-1, $txtTip)
		$txtDBMinTrophy = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,34, "Set the Min. amount of Trophies to search for on a village to attack.")
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetLimit(-1, 2)
		$picDBMinTrophies = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkDBMeetTH = GUICtrlCreateCheckbox(GetTranslated(2,35, "Townhall"), $x, $y, -1, -1)
			$txtTip = GetTranslated(2,36, "Search for a base that meets the value set for Max. Townhall Level.")
			GUICtrlSetOnEvent(-1, "chkDBMeetTH")
			GUICtrlSetTip(-1, $txtTip)
		$cmbDBTH = GUICtrlCreateCombo("", $x + 80, $y - 1, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(2,37, "Set the Max. level of the Townhall to search for on a village to attack.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetData(-1, "4-6|7|8|9|10|11", "4-6")
		$picDBMaxTH1 = GUICtrlCreateIcon($pIconLib, $eIcnTH1, $x + 131, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$lblDBMaxTH = GUICtrlCreateLabel("-", $x + 156, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
		$picDBMaxTH10 = GUICtrlCreateIcon($pIconLib, $eIcnTH10, $x + 160, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21





		$chkDBMeetTHLow = GUICtrlCreateCheckbox(GetTranslated(2,38, "TH Redux"), $x, $y, -1, -1)
			$txtTip = GetTranslated(2,39, "Define TH level exception for DE")

			GUICtrlSetOnEvent(-1, "chkDBMeetTHLow")


			GUICtrlSetTip(-1, $txtTip)



			GUICtrlSetState(-1, $GUI_CHECKED)
		$cmbDBTHLow = GUICtrlCreateCombo("", $x + 80, $y - 1, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(2,40, "Set the TH level that activates your DE exception")
			GUICtrlSetTip(-1, $txtTip)



			GUICtrlSetData(-1, "4-6|7|8|9|10|11", "8")
		$y += 22	
		$lblDBEMinDarkLow = GUICtrlCreateLabel(GetTranslated(2,41, "Min. DE"), $x + 30, $y + 5, -1, -1)
			GUICtrlSetTip(-1, $txtTip)



					
		$txtDBMinDarkElixirLow = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,42, "Set the Min. amount of Dark Elixir for TH Redux.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			_GUICtrlEdit_SetReadOnly(-1, True)			
		$y += 21			
		
		
		$chkDBMeetTHO = GUICtrlCreateCheckbox(GetTranslated(2,43, "Townhall Outside"), $x, $y, -1, -1)

			$txtTip = GetTranslated(2,44, "Search for a base that has an exposed Townhall. (Outside of Walls)")
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		
;		$chkDBWeakBase = GUICtrlCreateCheckbox(GetTranslated(2,40, "WeakBase"), $x, $y, -1, -1)
;			$txtTip = GetTranslated(2,41, "Search for a base that has low defences.")
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetOnEvent(-1, "chkDBWeakBase")
;		$cmbDBWeakMortar = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
;			$txtTip = GetTranslated(2,42, "Set the Max. level of the Mortar to search for on a village to attack.")
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7", "Lvl 5")
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$picDBWeakMortar = GUICtrlCreateIcon($pIconLib, $eIcnMortar, $x + 131, $y - 3, 24, 24)
;			GUICtrlSetTip(-1, $txtTip)
;		$y +=23
;		$cmbDBWeakWizTower = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
;			$txtTip = GetTranslated(2,43, "Set the Max. level of the Wizard Tower to search for on a village to attack.")
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 4")
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$picDBWeakWizTower = GUICtrlCreateIcon($pIconLib, $eIcnWizTower, $x + 131, $y - 2, 24, 24)
;			GUICtrlSetTip(-1, $txtTip)
;		$y += 21
;		$chkDBMeetOne = GUICtrlCreateCheckbox(GetTranslated(2,44, "Meet One Then Attack"), $x, $y, -1, -1)
;			$txtTip = GetTranslated(2,45, "Just meet only ONE of the above conditions, then Attack.")
;			GUICtrlSetTip(-1, $txtTip)
;		$y += 21
;       $btnConfigureCollectors = GUICtrlCreateButton(GetTranslated(2,100, "Configure Collectors..."), $x, $y, 180,20)
;			GUICtrlSetOnEvent(-1, "btnConfigureCollectors")
;	GUICtrlCreateGroup("", -99, -99, 1, 1)
	Local $x = 260, $y = 210
	$grpLiveBaseConditions = GUICtrlCreateGroup(GetTranslated(2,46,"LiveBase Conditions"), $x - 20, $y - 20, 220, 255)
		$chkABEnableAfter = GUICtrlCreateCheckbox(GetTranslated(2,15, -1), $x, $y, -1, -1)
			$txtTip = GetTranslated(2,58, "Search for a Live Base after this No. of searches, start searching for Dead Bases first..")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "chkABEnableAfter")
			GUICtrlSetState(-1, $GUI_HIDE)
		$txtABEnableAfter = GUICtrlCreateInput("150", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,17, -1)
			GUICtrlSetLimit(-1, 3)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetState(-1, $GUI_HIDE)
		$lblABEnableAfter = GUICtrlCreateLabel(GetTranslated(2,18, -1), $x + 132, $y + 4, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
		$y += 21
		$cmbABMeetGE = GUICtrlCreateCombo("", $x , $y + 10, 65, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(2,19, -1) & @CRLF & GetTranslated(2,20, -1) & @CRLF & GetTranslated(2,21, -1) & @CRLF & GetTranslated(2,22, -1)
			GUICtrlSetData(-1, GetTranslated(2,23, -1) & "|" & GetTranslated(2,24, -1) & "|" & GetTranslated(2,25, -1), GetTranslated(2,25, -1))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbABGoldElixir")
		$txtABMinGold = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,26, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$y += 21
		$txtABMinElixir = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,27, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$y -= 11
		$txtABMinGoldPlusElixir = GUICtrlCreateInput("160000", $x + 80, $y, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,28, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
		$picABMinGPEGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$lblABMinGPE = GUICtrlCreateLabel("+", $x + 147, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
		$picABMinGPEElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 153, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 31
		$chkABMeetDE = GUICtrlCreateCheckbox(GetTranslated(2,29, -1), $x , $y, -1, -1)
			$txtTip = GetTranslated(2,30, -1)
			GUICtrlSetOnEvent(-1, "chkABMeetDE")
			GUICtrlSetTip(-1, $txtTip)
		$txtABMinDarkElixir = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,31, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			_GUICtrlEdit_SetReadOnly(-1, True)
		$picABMinDarkElixir = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkABMeetTrophy = GUICtrlCreateCheckbox(GetTranslated(2,32, "Trophies"), $x, $y, -1, -1)
			$txtTip = GetTranslated(2,33, -1)
			GUICtrlSetOnEvent(-1, "chkABMeetTrophy")
			GUICtrlSetTip(-1, $txtTip)
		$txtABMinTrophy = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,34, -1)
			GUICtrlSetTip(-1, $txtTip)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetLimit(-1, 2)
		$picABMinTrophies = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$chkABMeetTH = GUICtrlCreateCheckbox(GetTranslated(2,35, -1), $x, $y, -1, -1)
			$txtTip = GetTranslated(2,36, -1)
			GUICtrlSetOnEvent(-1, "chkABMeetTH")
			GUICtrlSetTip(-1, $txtTip)
		$cmbABTH = GUICtrlCreateCombo("", $x + 80, $y - 1, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(2,37, -1)
			GUICtrlSetTip(-1, $txtTip)
			;GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetData(-1, "4-6|7|8|9|10|11", "4-6")
		$picABMaxTH1 = GUICtrlCreateIcon($pIconLib, $eIcnTH1, $x + 131, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$lblABMaxTH = GUICtrlCreateLabel("-", $x + 156, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
		$picABMaxTH10 = GUICtrlCreateIcon($pIconLib, $eIcnTH10, $x + 160, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$y += 22
		
		;Add options for TH Redux DE attack -n3vermind
		$chkABMeetTHLow = GUICtrlCreateCheckbox(GetTranslated(2,38, "TH Redux"), $x, $y, -1, -1)
			$txtTip = GetTranslated(2,39, "Define TH level exception for DE")
			GUICtrlSetOnEvent(-1, "chkABMeetTHLow")
			GUICtrlSetTip(-1, $txtTip)



			GUICtrlSetState(-1, $GUI_CHECKED)
		$cmbABTHLow = GUICtrlCreateCombo("", $x + 80, $y - 1, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = GetTranslated(2,40, "Set the TH level that activates your DE exception")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "4-6|7|8|9|10|11", "8")
		$y += 22	


		$lblABEMinDarkLow = GUICtrlCreateLabel(GetTranslated(2,41, "Min. DE"), $x + 30, $y + 5, -1, -1)
			GUICtrlSetTip(-1, $txtTip)



		$txtABMinDarkElixirLow = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,42, "Set the Min. amount of Dark Elixir for TH Redux.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			_GUICtrlEdit_SetReadOnly(-1, True)			
		$y += 21			
				
		
		
 		$chkABMeetTHO = GUICtrlCreateCheckbox(GetTranslated(2,43, -1), $x, $y, -1, -1)
 			$txtTip = GetTranslated(2,44, -1)
 			GUICtrlSetTip(-1, $txtTip)
		$y += 21
;		$chkABWeakBase = GUICtrlCreateCheckbox(GetTranslated(2,40, -1), $x, $y, -1, -1)
;			$txtTip = GetTranslated(2,41, -1)
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetOnEvent(-1, "chkABWeakBase")
;		$cmbABWeakMortar = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
;			$txtTip = GetTranslated(2,42, -1)
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7", "Lvl 5")
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$picABWeakMortar = GUICtrlCreateIcon($pIconLib, $eIcnMortar, $x + 131, $y - 3, 24, 24)
;			GUICtrlSetTip(-1, $txtTip)
;		$y +=23
;		$cmbABWeakWizTower = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
;			$txtTip = GetTranslated(2,43, -1)
;			GUICtrlSetTip(-1, $txtTip)
;			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 4")
;			GUICtrlSetState(-1, $GUI_DISABLE)
;		$picABWeakWizTower = GUICtrlCreateIcon($pIconLib, $eIcnWizTower, $x + 131, $y - 2, 24, 24)
;			GUICtrlSetTip(-1, $txtTip)
;		$y += 21
;		$chkABMeetOne = GUICtrlCreateCheckbox(GetTranslated(2,44, "Meet One Then Attack"), $x, $y, -1, -1)
;			$txtTip = GetTranslated(2,45, -1)
;			GUICtrlSetTip(-1, $txtTip)
;		For $i = $cmbABMeetGE To $chkABMeetOne
;			GUICtrlSetState($i, $GUI_DISABLE)
;		Next
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 30, $y = 470
	$grpSearchReduction = GUICtrlCreateGroup(GetTranslated(2,47, "Search Reduction"), $x - 20, $y - 20, 450, 55)
		$chkSearchReduction = GUICtrlCreateCheckbox(GetTranslated(2,48, "Lower Aim, Every") & ":", $x , $y, -1, -1)
			$txtTip = GetTranslated(2,49, "Check this if you want the search values to automatically be lowered after a certain amount of searches.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "chkSearchReduction")
		$txtSearchReduceCount = GUICtrlCreateInput("20", $x + 105, $y + 2, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = GetTranslated(2,50, "Enter the No. of searches to wait before each reduction occures.")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
		$lblSearchReduceCount = GUICtrlCreateLabel(GetTranslated(2,51, "search(es)."), $x + 145, $y + 3, -1, -1)
		$x += 210
		$y -= 9
		$lblSearchReduceGold = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
			$txtTip = GetTranslated(2,52, "Lower value for Gold by this amount on each step.")
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceGold = GUICtrlCreateInput("2000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
		$picSearchReduceGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 46, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$lblSearchReduceElixir = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
			$txtTip = GetTranslated(2,53, "Lower value for Elixir by this amount on each step.")
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceElixir = GUICtrlCreateInput("2000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
		$picSearchReduceElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 46, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$x += 70
		$y -= 10
		$lblSearchReduceGoldPlusElixir = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
			$txtTip = GetTranslated(2,54, "Lower total sum for G+E by this amount on each step.")
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceGoldPlusElixir = GUICtrlCreateInput("4000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
		$picSearchReduceGPEGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 46, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$lblSearchReduceGPE = GUICtrlCreateLabel("+", $x + 62, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
		$picSearchReduceGPEElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 68, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$x += 90
		$y -= 11
		$lblSearchReduceDark = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
			$txtTip = GetTranslated(2,55, "Lower value for Dark Elixir by this amount on each step.")
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceDark = GUICtrlCreateInput("100", $x + 5, $y, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
		$picSearchReduceDark = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 41, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
		$y += 21
		$lblSearchReduceTrophy = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
			$txtTip = GetTranslated(2,56, "Lower value for Trophies by this amount on each step.")
			GUICtrlSetTip(-1, $txtTip)
		$txtSearchReduceTrophy = GUICtrlCreateInput("2", $x + 5, $y, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 1)
		$picSearchReduceTrophy = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 41, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

