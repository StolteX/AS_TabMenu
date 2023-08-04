B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=9.8
@EndOfDesignText@
'ASTabMenu
'Author: Alexander Stolte
'Version: 1.25

#If Documentation
ToDos:
	-BitmapCreator Effects
	-Add Badgets (with numbers, just colors)
	-Add Stretch underline animation

Updates:
V1.0
	-Release
V1.01
	-Add RemoveAt - Removes a tab by a given index
	-Add Property PartingLineVisible - shows an parting line between the tabs
		-Add get and set PartingLineColor
		-Add get and set PartingLineWidth
		-Add get and set PartingLineVisible
	-Add get and set UnderLineColor
	-Add get and set UnderLineHeight
	-Add getTabIcon -gets the icon of a given tab
	-Add setTabIcon -sets a new icon to a tab
	-Add getTabText -gets the text ov a given tab
	-Add setTabText -sets a new text to a tab
V1.02
	-Add getTabTag
	-Add setTabTag
V1.03
	-Add Property Orientation - indicates the mode in which the view is, horizontal or vertical
	-The menu can now be used vertical
	-Add Property CurrentTabUnderlineGravity - sets the underline gravity, on vertical mode = Top and Bottom and on horizontal mode = Left and Right
V1.04
	-Add getCurrentIndex - gets the current tab index
	-Add getTabBackgroundColor and setTabBackgroundColor - gets or sets the tab background color
V1.05
	-Adds a short description about a property
	-Add get and set Badge_Visible - shows or hide a badge on a tab
	-Add get and set Badge_Height - set the size of the badge
	-Add set Badge_Text - sets the badge number, set it to -1 to have only the color
	-Add get Badge_getLabel - gets the badge label, to modify it to your own
	-Add get and set Badge_Color - gets or sets a badge color
	-Add set Badge_setVisibleEasy - shows the badge with all important parameters to save lines of code
V1.06
	-Badge Bug Fixing
	-Add get and set Badge_Gravity
	-Add enums. for the Badge_Gravity
		-Badge_MIDDLERIGHT
		-Badge_MIDDLELEFT
		-Badge_TOPRIGHT
		-Badge_TOPMIDDLE
		-Badge_TOPLEFT
V1.07
	-Icon Size is now smaller
	-Badge Bug Fixing
V1.08
	-Add Commit Mode Designer Property
	-Add CommitChanges Property
V1.09
	-Add Public Variable: text_font - change the font of the text
V1.10
	-TabClick Bug Fix if withHalo = false
V1.11
	-Add TextIcon_Padding public variable - if you need more space between text and icon
V1.12
	-B4I Underline Bug Fix
V1.13
	-Add VisibleAt -Shows or Hide a tab
	-Add Support for Icons or Text mixed
	-Add TabStripMode - if true, then the underline width/height is the full tab
V1.14
	-Add ViewEnable - enable or disable the view
V1.15
	-B4A only - BugFix if the text is too long
	-B4A only - new dependency "Reflection"
	-B4I only - ViewEnable BugFix
V1.16
	-Add RemoveAllTabs
V1.17
	-Add get/set HaloDuration
V1.18
	-Add setBadge_setLeftPadding
V1.19
	-B4I Better handling of icons - looks now better
V1.20
	-B4A and B4J The view can now also have round corners - added SetCircleClip
		-on B4J you need to set setCornerRadius
	-B4A and B4I New Icon Tint Function, the quality of icons with a new color is now better
	-B4A and B4I BitmapCreator is no longer required
V1.21
	-BugFixes
V1.22
	-Add BorderPadding - if you want a border, then set the BorderWidth here for the padding
V1.23
	-Add BeginUpdate - Call this if you remove or add tabs, no events or animations during this
	-Add EndUpdate - Call this if you finished adding or removing tabs
	-BugFixes
V1.24
	-core IIF is now used
V1.25
	-BugFix Orientation = Horizontal was Vertical
V1.26
	-Badges display now the 9+ after 99 -> 9+
V1.27
	-TextIconPadding can now be changed for each tab
V1.28
	-TextIcon_Padding is now more logical
		-+1dip and the icon goes up
		--1dip and the icon goes down
V1.29
	-BaseResize is now Public
V1.30
	-Add Event TabLongClick
V1.31
	-Add InternAddTab - You fill manual the Tabs properties 
	-Add GetTabProperties - Change the tab properties for with a index
V1.32
	-BugFixes
V1.33
	-text_font renamed to TextFont
	-BugFixes
V1.34
	-Add Badge_setTopPadding
	-Add Badge_setTextColor
V1.35
	-B4I BugFix
#End If
#DesignerProperty: Key: CommitMode, DisplayName: Commit Mode, FieldType: String, DefaultValue: Automatic, List: Automatic|Manually, Description: set it to automatic, to commit changes automatically. If you set it to Manually then call .CommitChanges after you make changes
#DesignerProperty: Key: Orientation, DisplayName: Orientation, FieldType: String, DefaultValue: Automatic, List: Automatic|Horizontal|Vertical , Description: use the menu vertical or horizontal. Or detect it automatically based on the length and height of the view
'Tab
#DesignerProperty: Key: TabStyle, DisplayName: Tab Style, FieldType: String, DefaultValue: Text, List: Text|Icon|TextIcon , Description: do you want to show only text or only icons or both together
#DesignerProperty: Key: TabTextColor, DisplayName: Tab Text Color, FieldType: Color, DefaultValue: 0xFF121212, Description: The color of the text and/or icon
#DesignerProperty: Key: PartingLineVisible, DisplayName: Parting Line Visible, FieldType: Boolean, DefaultValue: False

'Underline
#DesignerProperty: Key: CurrentTabUnderline, DisplayName: Current Tab Underline, FieldType: Boolean, DefaultValue: True, Description: Click on a other tab, slides the underline to this tab
#DesignerProperty: Key: CurrentTabUnderlineAnimation, DisplayName: Current Tab Underline Animation, FieldType: String, DefaultValue: Normal, List: Normal , Description: Normal: Normal slide animation to the next tab Stretch: A stretch animation to the next tab 
#DesignerProperty: Key: CurrentTabUnderlineAnimationDuration, DisplayName: Current TabUnderline Animation Duration, FieldType: Int, DefaultValue: 250, MinRange: 0, Description: The duration of the slider animation
#DesignerProperty: Key: CurrentTabUnderlineGravity, DisplayName: Current Tab Underline Gravity, FieldType: String, DefaultValue: BottomRight, List: TopLeft|BottomRight, Description: sets the underline gravity on vertical mode = Top and Bottom and on orizontal mode = Left and Right
'Stretch
'Click Colors
#DesignerProperty: Key: EnableSelectedTabTextColor, DisplayName: Enable Selected Tab Text Color, FieldType: Boolean, DefaultValue: True, Description: If True then the icon and/or text will change the color on the current tab
#DesignerProperty: Key: SelectedTabTextColor, DisplayName: Selected Tab Text Color, FieldType: Color, DefaultValue: 0xFFFFFFFF, Description: The color of the icon and/or text of the current tab

'Background
#DesignerProperty: Key: TabClickColor, DisplayName: Page Click Color, FieldType: Color, DefaultValue: 0xFF7F8C8D, Description: The color of halo effect during page click.

#Event: TabClick(index as int)
#Event: TabLongClick(index as int)

Sub Class_Globals
	Private mEventName As String 'ignore
	Private mCallBack As Object 'ignore
	Private mBase As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Private underlinewidthbyonlyicon As Int = 20dip
	Private txt_height As Float = 22dip
	Private icon_height As Float = 25dip
	Private badge_height As Float = 15dip
	Public TextIcon_Padding As Float = 0
	Private m_TextFont As B4XFont
	
    Type Tabs(TabText As String,Icon As B4XBitmap,Tag As Object,Index As Int,BadgeVisible As Boolean,Visible As Boolean,TextIconPadding As Float,xFont As B4XFont,BackgroundColor As Int,TextColor As Int)

	Private g_Tabs As Tabs

	'Properties
	Private CurrenIndex As Int = 0
	
	'PartingLine
	Private pl_clr As Int = xui.Color_White
	Private pl_width As Float = 2dip
	
	'Underline
	Private ul_clr As Int = xui.Color_White
	Private ul_height As Float = 2dip
	
	Private g_badge_gravity As String = "Middle_Right"
	'Designer Props
	Private g_commitmode As String
	Private g_orientation As String
	
	Private g_TabStyle As String
	Private g_TabTextColor As Int
	Private g_PartingLineVisible As Boolean
	
	Private g_CurrentTabUnderline As Boolean
	Private g_CurrentTabUnderlineAnimation As String
	Private g_CurrentTabUnderlineAnimationDuration As Int
	Private g_CurrentTabUnderlineGravity As String
	
	Private g_EnableSelectedTabTextColor As Boolean
	Private g_SelectedTabTextColor As Int
	
	Private g_TabClickColor As Int
	
	Private g_TabStripMode As Boolean = False
	Private g_HaloDuration As Int = 1000
	
	Private g_BadgeLeftPadding As Float = 0
	Private g_BadgeTopPadding As Float = 0
	
	Private g_isInUpdate As Boolean = False
	
	'Views
	Private xpnl_tabbase As B4XView
	Private xpnl_underline As B4XView
	
	Public BorderPadding As Float = 0
	#If B4J
	Private LongClickTime as long
	#End If
End Sub

#Region Initialize

Public Sub Initialize (Callback As Object, EventName As String)
	mEventName = EventName
	mCallBack = Callback
	m_TextFont = xui.CreateDefaultFont(15)
End Sub

'Base type must be Object
Public Sub DesignerCreateView (Base As Object, Lbl As Label, Props As Map)
	mBase = Base
	ini_props(Props)
	
	xpnl_tabbase = xui.CreatePanel("")
	xpnl_underline = xui.CreatePanel("")
	
	
	mBase.AddView(xpnl_tabbase,0,0,0,0)
	mBase.AddView(xpnl_underline,0,0,0,0)
	
	#If B4A
	Base_Resize(mBase.Width,mBase.Height)
	#End If
	
End Sub

Private Sub ini_props(Props As Map)
	g_commitmode = Props.Get("CommitMode")
	g_orientation = Props.Get("Orientation")
	
	g_TabStyle = Props.Get("TabStyle")
	g_TabTextColor = xui.PaintOrColorToColor(Props.Get("TabTextColor"))
	g_PartingLineVisible = Props.Get("PartingLineVisible")
	
	g_CurrentTabUnderline = Props.Get("CurrentTabUnderline")
	g_CurrentTabUnderlineAnimation = Props.Get("CurrentTabUnderlineAnimation")
	g_CurrentTabUnderlineAnimationDuration = Props.Get("CurrentTabUnderlineAnimationDuration")
	g_CurrentTabUnderlineGravity = Props.Get("CurrentTabUnderlineGravity")
	
	g_EnableSelectedTabTextColor = Props.Get("EnableSelectedTabTextColor")
	g_SelectedTabTextColor = xui.PaintOrColorToColor(Props.Get("SelectedTabTextColor"))
	
	g_TabClickColor = xui.PaintOrColorToColor(Props.Get("TabClickColor"))

	g_Tabs = CreateTabs("",Null,Null,-1,False,True,TextIcon_Padding,m_TextFont,xui.Color_Black,g_TabTextColor)

End Sub

#End Region

Public Sub Base_Resize (Width As Double, Height As Double)
	Dim scale As Float = 1
	#If B4I
	scale= GetDeviceLayoutValues.NonnormalizedScale
	#End If
	If Width > Height Then
		#IF B4A OR B4I
		SetCircleClip(mBase,Height/2)
		SetCircleClip(xpnl_tabbase,Height/2)
		#End If
	Else
		#IF B4A OR B4I
		SetCircleClip(mBase,Width/2)
		SetCircleClip(xpnl_tabbase,Width/2)
		#End If
	End If
	xpnl_tabbase.SetLayoutAnimated(0,0 + BorderPadding,0 + BorderPadding,Width - BorderPadding*2,Height - BorderPadding*2)
	
	Dim isHorizontal As Boolean = False
	If GetOrientation(g_orientation) = getOrientation_HORIZONTAL Then
		isHorizontal = True
	End If
	
	xpnl_underline.Visible = g_CurrentTabUnderline

	'count all visible items
	Dim tmp_counter As Int = 0
	Dim tmp_TextIconCenter As Boolean = False
	For i = 0 To xpnl_tabbase.NumberOfViews -1
		Dim tmp_tab As Tabs = xpnl_tabbase.GetView(i).Tag
		If tmp_tab.Visible = True Then
			tmp_counter = tmp_counter +1
		End If
		If g_TabStyle = "TextIcon" And (tmp_tab.Icon.IsInitialized = False Or tmp_tab.TabText = "") Then
			tmp_TextIconCenter = True
		End If
	Next
	'Log(tmp_counter)
	'Log(xpnl_tabbase.NumberOfViews)
	Dim tmp_index As Int = -1
	For i = 0 To xpnl_tabbase.NumberOfViews -1
		Dim xpnl_base As B4XView = xpnl_tabbase.GetView(i)
		
		Dim tmp_tab As Tabs = xpnl_base.Tag
		Dim xlbl_text As B4XView = xpnl_base.GetView(0)
		Dim ximg_icon As B4XView = xpnl_base.GetView(1)
		
		xpnl_base.Color =tmp_tab.BackgroundColor
		
		If tmp_tab.Visible = True Then
			tmp_index = tmp_index +1
			If isHorizontal = True Then
'			xpnl_base.SetLayoutAnimated(0,(xpnl_tabbase.Width/xpnl_tabbase.NumberOfViews) * (tmp_tab.index),0,xpnl_tabbase.Width/xpnl_tabbase.NumberOfViews,xpnl_tabbase.Height)'quick maths :P
				xpnl_base.SetLayoutAnimated(0,(xpnl_tabbase.Width/tmp_counter) * tmp_index,0,Ceil(xpnl_tabbase.Width/tmp_counter),xpnl_tabbase.Height)
			Else
				'xpnl_base.SetLayoutAnimated(0,0,(xpnl_tabbase.Height/xpnl_tabbase.NumberOfViews) * (tmp_tab.index),xpnl_tabbase.Width,xpnl_tabbase.Height/xpnl_tabbase.NumberOfViews)
				xpnl_base.SetLayoutAnimated(0,0,(xpnl_tabbase.Height/tmp_counter) * tmp_index,xpnl_tabbase.Width,Ceil(xpnl_tabbase.Height/tmp_counter))
			End If
		Else
			xpnl_base.Width = 0
		End If
		
		mBase.GetView(tmp_tab.index + 2).Visible = g_PartingLineVisible
		If g_PartingLineVisible = True  Then
			Dim xpnl_partingline As B4XView = mBase.GetView(tmp_tab.index + 2)
			
			If isHorizontal = True Then
				xpnl_partingline.SetLayoutAnimated(0,xpnl_base.Left + xpnl_base.Width - pl_width/2,xpnl_base.Height/2 - xpnl_base.Height/4,pl_width,xpnl_base.Height/2)
			Else
				xpnl_partingline.SetLayoutAnimated(0,xpnl_base.Width/2 - xpnl_base.Width/4,xpnl_base.Top + xpnl_base.Height - pl_width/2,xpnl_base.Width/2,pl_width)
			End If
				
			xpnl_partingline.SetColorAndBorder(pl_clr,0,0,xpnl_partingline.Height/2)
			If tmp_tab.index = xpnl_tabbase.NumberOfViews -1 Then
				xpnl_partingline.Visible = False
			End If
		End If
		
		Dim xlbl_badge As B4XView = xpnl_base.GetView(2)
		xlbl_badge.Visible = tmp_tab.badgevisible
		
		If g_TabStyle = "Text" Then 'only Text
						
			xlbl_text.Visible = True
			ximg_icon.Visible = False
			
			xlbl_text.Text = tmp_tab.TabText
			xlbl_text.SetTextAlignment("CENTER","CENTER")
			If CurrenIndex = tmp_tab.index Then
				xlbl_text.TextColor = g_SelectedTabTextColor
			Else
				xlbl_text.TextColor = tmp_tab.TextColor
			End If
			
			xlbl_text.Font = tmp_tab.xFont
			
			xlbl_text.SetLayoutAnimated(0,0,xpnl_base.Height/2 - txt_height/2,xpnl_base.Width,txt_height)
			
			
			If tmp_tab.badgevisible = True Then
				If g_CurrentTabUnderlineGravity = getCurrentTabUnderlineGravity_TOPLEFT And GetOrientation(g_orientation) = getOrientation_HORIZONTAL Then
					xlbl_badge.SetLayoutAnimated(0,xlbl_text.Width/2 - badge_height/2 + g_BadgeLeftPadding,xlbl_text.Top + xlbl_text.Height + g_BadgeTopPadding,badge_height,badge_height)
				Else
					xlbl_badge.SetLayoutAnimated(0,xlbl_text.Width/2 - badge_height/2 + g_BadgeLeftPadding,xlbl_text.Top - badge_height + g_BadgeTopPadding,badge_height,badge_height)
				End If
			End If
			
		Else If g_TabStyle = "Icon" Then 'only Icon
				
			xlbl_text.Visible = False
			ximg_icon.Visible = True
			
			ximg_icon.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/2,xpnl_base.Height/2 - icon_height/2,icon_height,icon_height)
			'ximg_icon.SetBitmap(tmp_tab.Icon.Resize(ximg_icon.Width,ximg_icon.Height,True))
				
			If CurrenIndex = tmp_tab.index Then
				'If tmp_tab.Icon.IsInitialized Then ximg_icon.SetBitmap(ChangeColorBasedOnAlphaLevel(tmp_tab.Icon,g_SelectedTabTextColor).Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				If tmp_tab.Icon.IsInitialized Then ximg_icon.SetBitmap(tmp_tab.Icon.Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				TintBmp(ximg_icon,g_SelectedTabTextColor)
			Else
				'If tmp_tab.Icon.IsInitialized Then ximg_icon.SetBitmap(ChangeColorBasedOnAlphaLevel(tmp_tab.Icon,g_TabTextColor).Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				If tmp_tab.Icon.IsInitialized Then ximg_icon.SetBitmap(tmp_tab.Icon.Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				TintBmp(ximg_icon,g_TabTextColor)
			End If
			
			If tmp_tab.badgevisible = True Then
				If g_badge_gravity = getBadge_MIDDLELEFT Then
					xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/1.2 + g_BadgeLeftPadding,xpnl_base.Height/2 + g_BadgeTopPadding,badge_height,badge_height)
				else If g_badge_gravity = getBadge_TOPLEFT Then
					xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/1.2 + g_BadgeLeftPadding,ximg_icon.top - badge_height/2 + g_BadgeTopPadding,badge_height,badge_height)
				else If g_badge_gravity = getBadge_TOPMIDDLE Then
					xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - badge_height/2 + g_BadgeLeftPadding,ximg_icon.top - badge_height/2 + g_BadgeTopPadding,badge_height,badge_height)
				else If g_badge_gravity = getBadge_TOPRIGHT Then
					xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 + icon_height/1.2 - badge_height + g_BadgeLeftPadding,ximg_icon.top - badge_height/2 + g_BadgeTopPadding,badge_height,badge_height)
				Else 'Middle_Right
					xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 + icon_height/1.2 - badge_height + g_BadgeLeftPadding,xpnl_base.Height/2 + g_BadgeTopPadding,badge_height,badge_height)
				End If
			
			End If
				
		Else If g_TabStyle = "TextIcon" Then 'text and icon
				
			xlbl_text.Visible = True
			ximg_icon.Visible = True
			
			xlbl_text.Text = tmp_tab.TabText
			xlbl_text.SetTextAlignment("TOP","CENTER")
			xlbl_text.Font = tmp_tab.xFont
			
			If tmp_TextIconCenter = False Then
				If isHorizontal = True Then
					xlbl_text.SetLayoutAnimated(0,0,xpnl_base.Height/2,xpnl_base.Width,txt_height)
					ximg_icon.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/2 ,xpnl_base.Height/2 - icon_height - tmp_tab.TextIconPadding,icon_height,icon_height)
				Else
					xlbl_text.SetLayoutAnimated(0,0,xpnl_base.Height/2,xpnl_base.Width,txt_height)
					ximg_icon.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/2 ,xpnl_base.Height/2 - icon_height - tmp_tab.TextIconPadding,icon_height,icon_height)
				End If
			Else
				If isHorizontal = True Then
					xlbl_text.SetLayoutAnimated(0,0,xpnl_base.Height/2 - txt_height/2,xpnl_base.Width,txt_height)
					ximg_icon.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/2 ,xpnl_base.Height/2 - icon_height/2,icon_height,icon_height)
				Else
					xlbl_text.SetLayoutAnimated(0,0,xpnl_base.Height/2 - txt_height/2,xpnl_base.Width,txt_height)
					ximg_icon.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/2 ,xpnl_base.Height/2 - icon_height/2,icon_height,icon_height)
				End If
			End If
			
			If CurrenIndex = tmp_tab.index Then
				xlbl_text.TextColor = g_SelectedTabTextColor
				'If tmp_tab.Icon.IsInitialized Then ximg_icon.SetBitmap(ChangeColorBasedOnAlphaLevel(tmp_tab.Icon,g_SelectedTabTextColor).Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				If tmp_tab.Icon.IsInitialized Then ximg_icon.SetBitmap(tmp_tab.Icon.Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				TintBmp(ximg_icon,g_SelectedTabTextColor)
			Else
				xlbl_text.TextColor = tmp_tab.TextColor
				'If tmp_tab.Icon.IsInitialized Then ximg_icon.SetBitmap(ChangeColorBasedOnAlphaLevel(tmp_tab.Icon,g_TabTextColor).Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				If tmp_tab.Icon.IsInitialized Then ximg_icon.SetBitmap(tmp_tab.Icon.Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				TintBmp(ximg_icon,g_TabTextColor)
			End If
				
			If tmp_TextIconCenter = False Then 'Icons or Text is centered
				If tmp_tab.badgevisible = True Then
					If g_badge_gravity = getBadge_MIDDLELEFT Then
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/1.2 + g_BadgeLeftPadding,xpnl_base.Height/2.7 + g_BadgeTopPadding,badge_height,badge_height)
					else If g_badge_gravity = getBadge_TOPLEFT Then
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/1.2 + g_BadgeLeftPadding,xpnl_base.Height/2 - icon_height + g_BadgeTopPadding,badge_height,badge_height)
					else If g_badge_gravity = getBadge_TOPMIDDLE Then
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - badge_height/2 + g_BadgeLeftPadding,xpnl_base.Height/2 - icon_height + g_BadgeTopPadding,badge_height,badge_height)
					else If g_badge_gravity = getBadge_TOPRIGHT Then
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 + icon_height/1.2 - badge_height + g_BadgeLeftPadding,xpnl_base.Height/2 - icon_height + g_BadgeTopPadding,badge_height,badge_height)
					Else 'Middle_Right
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 + icon_height/1.2 - badge_height + g_BadgeLeftPadding,xpnl_base.Height/2.7 + g_BadgeTopPadding,badge_height,badge_height)
					End If
				End If
			
			Else
				If tmp_tab.Icon.IsInitialized = True Then
					If g_badge_gravity = getBadge_MIDDLELEFT Then
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/1.2 + g_BadgeLeftPadding,xpnl_base.Height/2.7 + g_BadgeTopPadding,badge_height,badge_height)
					else If g_badge_gravity = getBadge_TOPLEFT Then
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - icon_height/1.2 + g_BadgeLeftPadding,xpnl_base.Height/2 - icon_height + g_BadgeTopPadding,badge_height,badge_height)
					else If g_badge_gravity = getBadge_TOPMIDDLE Then
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 - badge_height/2 + g_BadgeLeftPadding,xpnl_base.Height/2 - icon_height + g_BadgeTopPadding,badge_height,badge_height)
					else If g_badge_gravity = getBadge_TOPRIGHT Then
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 + icon_height/1.2 - badge_height + g_BadgeLeftPadding,xpnl_base.Height/2 - icon_height + g_BadgeTopPadding,badge_height,badge_height)
					Else 'Middle_Right
						xlbl_badge.SetLayoutAnimated(0,xpnl_base.Width/2 + icon_height/1.2 - badge_height + g_BadgeLeftPadding,xpnl_base.Height/2.7 + g_BadgeTopPadding,badge_height,badge_height)
					End If
				Else
					If g_CurrentTabUnderlineGravity = getCurrentTabUnderlineGravity_TOPLEFT And GetOrientation(g_orientation) = getOrientation_HORIZONTAL Then
						xlbl_badge.SetLayoutAnimated(0,xlbl_text.Width/2 - badge_height/2 + g_BadgeLeftPadding,xlbl_text.Top + xlbl_text.Height + g_BadgeTopPadding,badge_height,badge_height)
					Else
						xlbl_badge.SetLayoutAnimated(0,xlbl_text.Width/2 - badge_height/2 + g_BadgeLeftPadding,xlbl_text.Top - badge_height + g_BadgeTopPadding,badge_height,badge_height)
					End If
				End If
			End If

			
			'ximg_icon.SetLayoutAnimated(0,xpnl_base.Width/2 - (xpnl_base.Height/2)/2 ,xpnl_base.Height/2 - GetImage(ximg_icon).Height,xpnl_base.Height/2,GetImage(ximg_icon).Height)
		Else
			xlbl_text.Visible = False
			ximg_icon.Visible = False
		End If
		
	Next
  
End Sub

Public Sub setBadge_setLeftPadding(padding As Float)
	g_BadgeLeftPadding = padding
End Sub

Public Sub setBadge_setTopPadding(padding As Float)
	g_BadgeTopPadding = padding
End Sub

Private Sub GetOrientation(Orientation As String) As String
	If Orientation = getOrientation_AUTOMATIC Then		
		If mBase.Width >= mBase.Height Then
			Return getOrientation_HORIZONTAL
		Else
			Return getOrientation_VERTICAL
		End If	
	else if Orientation = getOrientation_HORIZONTAL Then
		Return getOrientation_HORIZONTAL
	Else
		Return getOrientation_VERTICAL
	End If	
End Sub

'Refresh the view and commit changes to the view
Public Sub CommitChanges
	Base_Resize(mBase.Width,mBase.Height)
End Sub

Private Sub SetUnderline2NewPos
	Dim CurrentTabUnderlineAnimationDuration As Int = IIf(g_isInUpdate = False,g_CurrentTabUnderlineAnimationDuration,0)
	
	If CurrenIndex >= xpnl_tabbase.NumberOfViews Then
		CurrenIndex = 0
		TabClick(xpnl_tabbase.GetView(0),True,g_EnableSelectedTabTextColor,False)
	End If
	Dim xpnl_targettab As B4XView = xpnl_tabbase.GetView(CurrenIndex)
	'Dim tmp_tab As Tabs = xpnl_targettab.Tag
	
	Dim xlbl_text As B4XView = xpnl_targettab.GetView(0)
	'Dim ximg_icon As B4XView = xpnl_targettab.GetView(1)
	
	If g_CurrentTabUnderlineAnimation = "Normal" Then
		
		If GetOrientation(g_orientation) = getOrientation_HORIZONTAL Then
		
			If g_TabStripMode = False Then
		
				Dim tmp_top As Float = xlbl_text.Top + xlbl_text.Height
				If g_TabStyle = "Text" Or g_TabStyle = "TextIcon" Then 'only Text or text and icons
					Dim textwidth As Int =  Max(1dip,MeasureTextWidth(xlbl_text.Text,xlbl_text.Font))
			
					If g_CurrentTabUnderlineGravity <> getCurrentTabUnderlineGravity_BOTTOMRIGHT Then
						If g_TabStyle = "TextIcon" Then
							tmp_top = xpnl_targettab.Height/2 - icon_height/2
						Else
							tmp_top = xpnl_targettab.Height/2 - xlbl_text.Height/2
						End If
					End If
			
					xpnl_underline.SetLayoutAnimated(CurrentTabUnderlineAnimationDuration,xpnl_targettab.Left + xpnl_targettab.Width/2 - textwidth/2,tmp_top,textwidth,ul_height)
				Else If g_TabStyle = "Icon" Then 'only Icon
					If g_CurrentTabUnderlineGravity = getCurrentTabUnderlineGravity_BOTTOMRIGHT Then
						tmp_top = xpnl_tabbase.Height/2 + 15dip
					Else
						tmp_top = xpnl_tabbase.Height/2 - icon_height/2.5
					End If
					xpnl_underline.SetLayoutAnimated(CurrentTabUnderlineAnimationDuration,xpnl_targettab.Left + xpnl_targettab.Width/2 - underlinewidthbyonlyicon/2,tmp_top,underlinewidthbyonlyicon,ul_height)
				End If
		
			Else
			
				Dim tmp_top As Float = 0
				If g_CurrentTabUnderlineGravity <> getCurrentTabUnderlineGravity_TOPLEFT Then
					tmp_top = xpnl_targettab.Height - ul_height
				End If
				xpnl_underline.SetLayoutAnimated(CurrentTabUnderlineAnimationDuration,xpnl_targettab.Left,tmp_top,xpnl_targettab.Width,ul_height)
			End If
		
		Else
			Dim tmp_left As Float = 0
			If g_CurrentTabUnderlineGravity = getCurrentTabUnderlineGravity_BOTTOMRIGHT Then
				tmp_left = xpnl_targettab.Width - ul_height
			End If
			If g_TabStripMode = False Then
			
				xpnl_underline.SetLayoutAnimated(CurrentTabUnderlineAnimationDuration,tmp_left,xpnl_targettab.Top + xpnl_targettab.Height/4,ul_height,xpnl_targettab.Height/2)
			Else
				xpnl_underline.SetLayoutAnimated(CurrentTabUnderlineAnimationDuration,tmp_left,xpnl_targettab.Top,ul_height,xpnl_targettab.Height)
				
			End If
						
		End If
		
'	Else
'		'Stretch				
'		If g_TabStyle = "Text" Or g_TabStyle = "TextIcon" Then 'only Text or text and icons
'			Dim textwidth As Int =  Max(1dip,MeasureTextWidth(xlbl_text.Text,xlbl_text.Font))
'		
'		
'			If xpnl_targettab.Left < xpnl_underline.Left Then 'to left
'	
'	
'	
'			Else 'to right
'			
'				xpnl_underline.SetLayoutAnimated(CurrentTabUnderlineAnimationDuration,xpnl_underline.Left,xlbl_text.Top + xlbl_text.Height,(xpnl_underline.Width  + textwidth/2) + (xpnl_targettab.Left - xpnl_underline.Left),2dip)
'				'Sleep(CurrentTabUnderlineAnimationDuration)
'				'xpnl_underline.SetLayoutAnimated(5000,xpnl_targettab.Left + xpnl_targettab.Width/2 - textwidth/2,xlbl_text.Top + xlbl_text.Height,textwidth,2dip)
'			End If
'		
'		
'		
'		
'		Else If g_TabStyle = "Icon" Then 'only Icon
'			xpnl_underline.SetLayoutAnimated(CurrentTabUnderlineAnimationDuration,xpnl_targettab.Left + xpnl_targettab.Width/2 - underlinewidthbyonlyicon/2,xpnl_tabbase.Height/2 + 15dip,underlinewidthbyonlyicon,2dip)
'		End If
			
	End If
	If GetOrientation(g_orientation) = getOrientation_HORIZONTAL Then
		xpnl_underline.SetColorAndBorder(ul_clr,0,0,xpnl_underline.Height/2)
	Else
		xpnl_underline.SetColorAndBorder(ul_clr,0,0,xpnl_underline.Width/2)
	End If

End Sub

#Region Enumerations

Public Sub getCommitMode_MANUALLY As String
	Return "Manually"
End Sub

Public Sub getCommitMode_AUTOMATIC As String
	Return "Automatic"
End Sub

Public Sub getBadge_MIDDLERIGHT As String
	Return "MiddleRight"
End Sub

Public Sub getBadge_MIDDLELEFT As String
	Return "MiddleLeft"
End Sub

Public Sub getBadge_TOPRIGHT As String
	Return "TopRight"
End Sub

Public Sub getBadge_TOPMIDDLE As String
	Return "TopMiddle"
End Sub

Public Sub getBadge_TOPLEFT As String
	Return "TopLeft"
End Sub

Public Sub getCurrentTabUnderlineGravity_TOPLEFT As String
	Return "TopLeft"
End Sub
Public Sub getCurrentTabUnderlineGravity_BOTTOMRIGHT As String
	Return "BottomRight"
End Sub
Public Sub getOrientation_AUTOMATIC As String
	Return "Automatic"
End Sub
Public Sub getOrientation_HORIZONTAL As String
	Return "Horizontal"
End Sub
Public Sub getOrientation_VERTICAL As String
	Return "Vertical"
End Sub

Public Sub getTabStyle_TEXT As String
	Return "Text"
End Sub
Public Sub getTabStyle_ICON As String
	Return "Icon"
End Sub
Public Sub getTabStyle_TEXTICON As String
	Return "TextIcon"
End Sub
Public Sub getCurrentTabUnderlineAnimation_NORMAL As String
	Return "Normal"
End Sub
'Public Sub getCurrentTabUnderlineAnimation_STRETCH As String
'	Return "Stretch"
'End Sub
#End Region

#Region Properties

Public Sub getTextFont As B4XFont
	Return m_TextFont
End Sub

Public Sub setTextFont(xFont As B4XFont)
	m_TextFont = xFont
	g_Tabs.xFont = xFont
End Sub

Public Sub getHaloDuration As Int
	Return g_HaloDuration
End Sub
Public Sub setHaloDuration(duration As Int)
	g_HaloDuration = duration
End Sub
'sets or gets the TabStripMode, if true the underline width is the full tab
Public Sub getTabStripMode As Boolean
	Return g_TabStripMode
End Sub

Public Sub setTabStripMode(enable As Boolean)
	g_TabStripMode = enable
	SetUnderline2NewPos
End Sub

Public Sub setCommitMode(commit_mode As String)
	g_commitmode = commit_mode
End Sub

Public Sub getCommitMode As String
	Return g_commitmode
End Sub

'for example take this enum for parameter: Badge_MIDDLERIGHT
'Has no effect with only Text
Public Sub setBadge_Gravity(badge_gravity As String)
	g_badge_gravity = badge_gravity
	If g_commitmode = getCommitMode_AUTOMATIC Then Base_Resize(mBase.Width,mBase.Height)
End Sub

Public Sub getBadge_Gravity As String
	Return g_badge_gravity
End Sub

'shows the badge with all important settings to save lines of code
Public Sub Badge_setVisibleEasy(index As Int,number As Int,color As Int)
	Badge_setColor(index,color)
	Badge_setText(index,number)
	Badge_setVisible(index,True)
End Sub

'gets or sets the badge color
Public Sub Badge_setColor(index As Int,color As Int)
	Dim tmp_base As B4XView = xpnl_tabbase.GetView(index)
	Dim xlbl_badge As B4XView = tmp_base.GetView(2)
	xlbl_badge.Color = color
End Sub

Public Sub Badge_setTextColor(index As Int,color As Int)
	Dim tmp_base As B4XView = xpnl_tabbase.GetView(index)
	Dim xlbl_badge As B4XView = tmp_base.GetView(2)
	xlbl_badge.TextColor = color
End Sub

Public Sub Badge_getColor(index As Int) As Int
	Return xpnl_tabbase.GetView(index).GetView(2).Color
End Sub

'gets the badge label, to modify it to your own
Public Sub Badge_getLabel(index As Int) As B4XView
	Return xpnl_tabbase.GetView(index).GetView(2)	
End Sub

'returns the base panel with the tabs
Public Sub getTabBase As B4XView
	Return xpnl_tabbase
End Sub

'sets the badge number, set it to -1 to have only the color
Public Sub Badge_setText(index As Int,number As Int)
	Dim tmp_base As B4XView = xpnl_tabbase.GetView(index)
	Dim xlbl_badge As B4XView = tmp_base.GetView(2)
	If number < 0 Then
		xlbl_badge.Text = ""
		Else If number > 99 Then
		xlbl_badge.Text = "9+"
		Else
		xlbl_badge.Text = number
	End If	
End Sub

'gets or sets the badge height, per default it is 15dip
Public Sub Badge_setHeight(size As Float)
	badge_height = size	
	If g_commitmode = getCommitMode_AUTOMATIC Then Base_Resize(mBase.Width,mBase.Height)
End Sub

Public Sub Badge_getHeight As Float
	Return badge_height
End Sub

'show or hide the badge on a tab
Public Sub Badge_setVisible(index As Int,visible As Boolean)
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	tmp_tab.badgevisible = visible
	xpnl_tabbase.GetView(index).Tag = tmp_tab
	If g_commitmode = getCommitMode_AUTOMATIC Then Base_Resize(mBase.Width,mBase.Height)
End Sub

Public Sub Badge_getVisible(index As Int) As Boolean
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	Return tmp_tab.badgevisible
End Sub

'sets or gets the background color of a tab 
Public Sub setTabBackgroundColor (index As Int, colour As Int)
	Dim tmp_tab As B4XView = xpnl_tabbase.GetView(index)
	tmp_tab.Color = colour
End Sub

Public Sub getTabBackgroundColor(index As Int) As Int
	Dim tmp_tab As B4XView = xpnl_tabbase.GetView(index)
	Return tmp_tab.Color
End Sub

'gets the current tab index
Public Sub getCurrentIndex As Int
	Return CurrenIndex
End Sub

'gets or sets the gravity of the underline
Public Sub getCurrentTabUnderlineGravity As String
	Return g_CurrentTabUnderlineGravity
End Sub

Public Sub setCurrentTabUnderlineGravity(underline_gravity As String)
	g_CurrentTabUnderlineGravity = underline_gravity
	SetUnderline2NewPos
	If g_commitmode = getCommitMode_AUTOMATIC Then Base_Resize(mBase.Width,mBase.Height)
End Sub
'Call CommitChanges if you change something
Public Sub GetTabProperties(Index As Int) As Tabs
	Return xpnl_tabbase.GetView(Index).Tag
End Sub

'gets or sets the tag of a tab
Public Sub getTabTag(index As Int) As Object
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	Return tmp_tab.Tag
End Sub

Public Sub setTabTag(index As Int,tag As Object)
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	tmp_tab.Tag = tag
	xpnl_tabbase.GetView(index).Tag = tmp_tab
End Sub

'gets or sets the text of a tab
Public Sub getTabText(index As Int) As String
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	Return tmp_tab.TabText
End Sub

Public Sub setTabText(index As Int,text As String)
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	tmp_tab.TabText = text
	xpnl_tabbase.GetView(index).Tag = tmp_tab
	If g_commitmode = getCommitMode_AUTOMATIC Then Base_Resize(mBase.Width,mBase.Height)
End Sub

'gets or sets the icon of a tab
Public Sub getTabIcon(index As Int) As B4XBitmap
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	Return tmp_tab.Icon
End Sub

Public Sub setTabIcon(index As Int,icon As B4XBitmap)
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	tmp_tab.Icon = icon
	xpnl_tabbase.GetView(index).Tag = tmp_tab
	If g_commitmode = getCommitMode_AUTOMATIC Then Base_Resize(mBase.Width,mBase.Height)
End Sub

'gets or sets the color of the underline
Public Sub getUnderLineColor As Int
	Return ul_clr
End Sub

Public Sub setUnderLineColor(clr As Int)
	ul_clr = clr
	Base_Resize(mBase.Width,mBase.Height)
End Sub

'gets or sets the thickness of the underline
Public Sub getUnderLineHeight As Float
	Return ul_height
End Sub

Public Sub setUnderLineHeight(height As Float)
	ul_height = height
	SetUnderline2NewPos
	Base_Resize(mBase.Width,mBase.Height)
End Sub

'gets or sets the color of the parting line
Public Sub getPartingLineColor As Int
	Return pl_clr
End Sub

Public Sub setPartingLineColor(clr As Int)
	pl_clr = clr
	Base_Resize(mBase.Width,mBase.Height)
End Sub

'gets or sets the thickness of the parting line
Public Sub getPartingLineWidth As Float
	Return pl_width
End Sub

Public Sub setPartingLineWidth(width As Float)
	pl_width = width
	Base_Resize(mBase.Width,mBase.Height)
End Sub

'show or hide the parting line
Public Sub getPartingLineVisible As Boolean
	Return g_PartingLineVisible
End Sub

Public Sub setPartingLineVisible(visible As Boolean)
	g_PartingLineVisible = visible
	If g_commitmode = getCommitMode_AUTOMATIC Then Base_Resize(mBase.Width,mBase.Height)
End Sub

'gets the mbase
Public Sub getBaseView As B4XView
	Return mBase
End Sub

'gets or sets the tab click color
Public Sub getTabClickColor As Int
	Return g_TabClickColor
End Sub

Public Sub setTabClickColor(color As Int)
	g_TabClickColor = color
End Sub

'gets or sets the text color of the selected tab
Public Sub getSelectedTabTextColor As Int
	Return g_SelectedTabTextColor
End Sub

Public Sub setSelectedTabTextColor(color As Int)
	g_SelectedTabTextColor = color
End Sub

'enable or disable the tab text color on clicking on a tab
Public Sub getEnableSelectedTabTextColor As Boolean
	Return g_EnableSelectedTabTextColor
End Sub

Public Sub setEnableSelectedTabTextColor(enable As Boolean)
	g_EnableSelectedTabTextColor = enable
End Sub

'gets or sets the duration of the underline animation
Public Sub getCurrentTabUnderlineAnimationDuration As Int
	Return g_CurrentTabUnderlineAnimationDuration
End Sub

Public Sub setCurrentTabUnderlineAnimationDuration(duration As Int)
	g_CurrentTabUnderlineAnimationDuration = duration
End Sub

'gets or sets the underline animation
Public Sub getCurrentTabUnderlineAnimation As String
	Return g_CurrentTabUnderlineAnimation
End Sub

Public Sub setCurrentTabUnderlineAnimation(animation As String)
	g_CurrentTabUnderlineAnimation = animation
End Sub

'hide or shows the underline
Public Sub getCurrentTabUnderline As Boolean
	Return g_CurrentTabUnderline
End Sub

Public Sub setCurrentTabUnderline(show As Boolean)
	g_CurrentTabUnderline = show
	xpnl_underline.Visible = show
	SetUnderline2NewPos
End Sub

'gets or sets the tab style
Public Sub getTabStyle As String
	Return g_TabStyle
End Sub

Public Sub setTabStyle(style As String)
	g_TabStyle = style
	Base_Resize(xpnl_tabbase.Width,xpnl_tabbase.Height)
	SetUnderline2NewPos
End Sub

'gets or sets the non selected tab text color
Public Sub setTabTextColor(color As Int)
	g_TabTextColor = color
	If g_commitmode = getCommitMode_AUTOMATIC Then Base_Resize(xpnl_tabbase.Width,xpnl_tabbase.Height)
	SetUnderline2NewPos
End Sub

Public Sub getTabTextColor As Int
	Return g_TabTextColor
End Sub

'Gets the Number of Tabs
Public Sub getTabSize As Int
	Return xpnl_tabbase.NumberOfViews
End Sub

Public Sub ViewEnable(enable As Boolean)
	For i = 0 To xpnl_tabbase.NumberOfViews -1		
		#If B4I
		Dim tmp_pnl As Panel = xpnl_tabbase.GetView(i)
		tmp_pnl.UserInteractionEnabled = enable
		#Else
		xpnl_tabbase.GetView(i).Enabled = enable
		#End If
	Next
End Sub

#If B4J
Public Sub setCornerRadius(radius As Int)
	SetCircleClip(mBase,radius)
	SetCircleClip(xpnl_tabbase,radius)
End Sub
#End If

'adds a new tab
Public Sub AddTab(BackgroundColor As Int,Text As String,Icon As B4XBitmap,Tag As Object)
	InternAddTab(CreateTabs(Text,Icon,Tag,xpnl_tabbase.NumberOfViews,False,True,TextIcon_Padding,g_Tabs.xFont,BackgroundColor,g_Tabs.TextColor))
End Sub

Public Sub AddTab2(TabProperties As Tabs)
	TabProperties.Index = xpnl_tabbase.NumberOfViews
	InternAddTab(TabProperties)
End Sub

Private Sub InternAddTab(TabProperties As Tabs)
	Dim xpnl_base As B4XView = xui.CreatePanel("xpnl_base")
	xpnl_base.Color = TabProperties.BackgroundColor
	
	Dim xlbl_text As B4XView = CreateLabel("")
	Dim ximg_icon As B4XView = CreateImageView("")
	Dim xlbl_badge As B4XView = CreateLabel("")
	
	xpnl_base.AddView(xlbl_text,0,0,0,0)
	xpnl_base.AddView(ximg_icon,0,0,0,0)
	xpnl_base.AddView(xlbl_badge,0,0,0,0)
		
	xlbl_badge.SetColorAndBorder(xlbl_badge.Color,0,0,badge_height/2)
	xlbl_badge.SetTextAlignment("CENTER","CENTER")
	xlbl_badge.Font = TabProperties.xFont
	xlbl_badge.TextColor = TabProperties.TextColor
		
	xpnl_base.Tag = CreateTabs(TabProperties.TabText,TabProperties.Icon,TabProperties.Tag,xpnl_tabbase.NumberOfViews,False,True,TextIcon_Padding,g_Tabs.xFont,TabProperties.BackgroundColor,g_Tabs.TextColor)
	
	xpnl_tabbase.AddView(xpnl_base,0,0,0,0)
	
	Dim xpnl_partingline As B4XView = xui.CreatePanel("")
	mBase.AddView(xpnl_partingline,0,0,0,0)
	
	Base_Resize(xpnl_tabbase.Width,xpnl_tabbase.Height)
	
'	If xpnl_tabbase.NumberOfViews = 1 Then
'		SetTab(0,False,False)
'	End If
	SetUnderline2NewPos
End Sub

'sets the selected tab
Public Sub SetTab(index As Int,withClickEvent As Boolean,withHalo As Boolean)
	TabClick(xpnl_tabbase.GetView(index),withClickEvent,withHalo,False)
End Sub

'Removes the tab on the given index, if the current index is higher then the number of views, then the current index is set to 0 and the first tab is clicked
Public Sub RemoveAt(index As Int)	
	xpnl_tabbase.GetView(index).RemoveViewFromParent
	mBase.GetView(index + 2).RemoveViewFromParent
	For i = 0 To xpnl_tabbase.NumberOfViews -1
		
		Dim tmp_base As B4XView = xpnl_tabbase.GetView(i)
		Dim tmp_tabs As Tabs = tmp_base.Tag
		tmp_tabs.index = i
		tmp_base.Tag = tmp_tabs
	Next
	Base_Resize(mBase.Width,mBase.Height)
	setCurrentTabUnderline(g_CurrentTabUnderline)
End Sub

Public Sub RemoveAllTabs
	xpnl_tabbase.RemoveAllViews
End Sub

Public Sub VisibleAt(index As Int,visible As Boolean)
	Dim tmp_tab As Tabs = xpnl_tabbase.GetView(index).Tag
	tmp_tab.Visible = visible
	xpnl_tabbase.GetView(index).Tag = tmp_tab
	Base_Resize(mBase.Width,mBase.Height)
	setCurrentTabUnderline(g_CurrentTabUnderline)
End Sub
'Call this if you remove or add tabs, no events or animations during this
Public Sub BeginUpdate
	g_isInUpdate = True
End Sub
'Call this if you finished adding or removing tabs
Public Sub EndUpdate
	g_isInUpdate = False
End Sub

#End Region

#Region Events

#If B4J
Private Sub xpnl_base_MouseClicked (EventData As MouseEvent)
#Else
Private Sub xpnl_base_Click
#End If	
	TabClick(Sender,True,g_EnableSelectedTabTextColor,False)
End Sub
'TabLongClick

#If B4J
Private Sub xpnl_base_MouseEntered (EventData As MouseEvent)
	LongClickTime = DateTime.Now
End Sub
Private Sub xpnl_base_MouseReleased (EventData As MouseEvent)
	If (DateTime.Now - LongClickTime) > 1000 Then
		TabClick(Sender,True,g_EnableSelectedTabTextColor,True)
	End If
End Sub
#Else
Private Sub xpnl_base_LongClick
	TabClick(Sender,True,g_EnableSelectedTabTextColor,True)
End Sub
#End If	

Private Sub TabClick(xpnl_base As B4XView,withEvent As Boolean,withHalo As Boolean,LongClick As Boolean)
	Dim scale As Float = 1
	#If B4I
	scale= GetDeviceLayoutValues.NonnormalizedScale
	#End If
	
	Dim tmp_tab As Tabs = xpnl_base.Tag
	CurrenIndex = tmp_tab.index
	If withHalo = True And g_isInUpdate = False Then CreateHaloEffect(xpnl_base, xpnl_base.Width/2, xpnl_base.Height/2, g_TabClickColor)
	
	For i = 0 To xpnl_tabbase.NumberOfViews -1
		Dim tmp_base As B4XView = xpnl_tabbase.GetView(i)
		Dim tmp_tabs As Tabs = tmp_base.Tag
		
		Dim xlbl_text As B4XView = tmp_base.GetView(0)
		Dim ximg_icon As B4XView = tmp_base.GetView(1)
		
		If tmp_tabs.index <> tmp_tab.index Then
			xlbl_text.TextColor = g_TabTextColor
			If g_TabStyle = "Icon" Or g_TabStyle = "TextIcon" Then
				'If tmp_tabs.Icon.IsInitialized Then	ximg_icon.SetBitmap(ChangeColorBasedOnAlphaLevel(tmp_tabs.Icon,g_TabTextColor).Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				If tmp_tabs.Icon.IsInitialized Then	ximg_icon.SetBitmap(tmp_tabs.Icon.Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				TintBmp(ximg_icon,g_TabTextColor)
			End If
		Else
			xlbl_text.TextColor = g_SelectedTabTextColor
			If g_TabStyle = "Icon" Or g_TabStyle = "TextIcon" Then
				'If tmp_tabs.Icon.IsInitialized Then	ximg_icon.SetBitmap(ChangeColorBasedOnAlphaLevel(tmp_tabs.Icon,g_SelectedTabTextColor).Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				If tmp_tabs.Icon.IsInitialized Then	ximg_icon.SetBitmap(tmp_tabs.Icon.Resize(ximg_icon.Width * scale,ximg_icon.Height * scale,True))
				TintBmp(ximg_icon,g_SelectedTabTextColor)
			End If
		End If
	Next
	
	SetUnderline2NewPos
	
	If withEvent = True And g_isInUpdate = False Then
		If LongClick = False Then
			If xui.SubExists(mCallBack, mEventName & "_TabClick",1) Then
				CallSub2(mCallBack, mEventName & "_TabClick",tmp_tab.index)
			End If
		Else
			If xui.SubExists(mCallBack, mEventName & "_TabLongClick",1) Then
				CallSub2(mCallBack, mEventName & "_TabLongClick",tmp_tab.index)
			End If
		End If
	End If
End Sub

#End Region

#Region Functions
'https://www.b4x.com/android/forum/threads/fontawesome-to-bitmap.95155/post-603250
Public Sub FontToBitmap (text As String, IsMaterialIcons As Boolean, FontSize As Float, color As Int) As B4XBitmap
	Dim xui As XUI
	Dim p As B4XView = xui.CreatePanel("")
	p.SetLayoutAnimated(0, 0, 0, 32dip, 32dip)
	Dim cvs1 As B4XCanvas
	cvs1.Initialize(p)
	Dim fnt As B4XFont
	If IsMaterialIcons Then fnt = xui.CreateMaterialIcons(FontSize) Else fnt = xui.CreateFontAwesome(FontSize)
	Dim r As B4XRect = cvs1.MeasureText(text, fnt)
	Dim BaseLine As Int = cvs1.TargetRect.CenterY - r.Height / 2 - r.Top
	cvs1.DrawText(text, cvs1.TargetRect.CenterX, BaseLine, fnt, color, "CENTER")
	Dim b As B4XBitmap = cvs1.CreateBitmap
	cvs1.Release
	Return b
End Sub

'TextIconPadding - Default is 0
Public Sub CreateTabs (TabText As String, Icon As B4XBitmap, Tag As Object, Index As Int, BadgeVisible As Boolean, Visible As Boolean, TextIconPadding As Float, xFont As B4XFont, BackgroundColor As Int, TextColor As Int) As Tabs
	Dim t1 As Tabs
	t1.Initialize
	t1.TabText = TabText
	t1.Icon = Icon
	t1.Tag = Tag
	t1.Index = Index
	t1.BadgeVisible = BadgeVisible
	t1.Visible = Visible
	t1.TextIconPadding = TextIconPadding
	t1.xFont = xFont
	t1.BackgroundColor = BackgroundColor
	t1.TextColor = TextColor
	Return t1
End Sub

Private Sub CreateLabel(EventName As String) As B4XView	
	Dim tmp_lbl As Label
	tmp_lbl.Initialize(EventName)
	#If B4A
	Dim r As Reflector
	r.Target = tmp_lbl
	r.RunMethod2("setSingleLine", True, "java.lang.boolean")
	r.RunMethod2("setEllipsize", "END", "android.text.TextUtils$TruncateAt")
	#End If
	Return tmp_lbl	
End Sub

Private Sub CreateImageView(EventName As String) As B4XView	
	Dim tmp_imageview As ImageView
	tmp_imageview.Initialize(EventName)	
	Return tmp_imageview
End Sub

'https://www.b4x.com/android/forum/threads/b4x-xui-simple-halo-animation.80267/#content
Private Sub CreateHaloEffect (Parent As B4XView, x As Int, y As Int, clr As Int)
	Dim cvs As B4XCanvas
	Dim p As B4XView = xui.CreatePanel("")
	Dim radius As Int = 150dip
	p.SetLayoutAnimated(0, 0, 0, radius * 2, radius * 2)
	cvs.Initialize(p)
	cvs.DrawCircle(cvs.TargetRect.CenterX, cvs.TargetRect.CenterY, cvs.TargetRect.Width / 2, clr, True, 0)
	Dim bmp As B4XBitmap = cvs.CreateBitmap
	CreateHaloEffectHelper(Parent,bmp, x, y, radius)
End Sub

Private Sub CreateHaloEffectHelper (Parent As B4XView,bmp As B4XBitmap, x As Int, y As Int, radius As Int)
	Dim iv As ImageView
	iv.Initialize("")
	Dim p As B4XView = iv
	p.SetBitmap(bmp)
	Parent.AddView(p, x, y, 0, 0)
	Dim duration As Int = g_HaloDuration
	p.SetLayoutAnimated(duration, x - radius, y - radius, 2 * radius, 2 * radius)
	p.SetVisibleAnimated(duration, False)
	Sleep(duration)
	p.RemoveViewFromParent
End Sub

'https://www.b4x.com/android/forum/threads/b4x-xui-add-measuretextwidth-and-measuretextheight-to-b4xcanvas.91865/post-580637
Private Sub MeasureTextWidth(Text As String, Font1 As B4XFont) As Int
#If B4A
	Private bmp As Bitmap
	bmp.InitializeMutable(2dip, 2dip)
	Private cvs As Canvas
	cvs.Initialize2(bmp)
	Return cvs.MeasureStringWidth(Text, Font1.ToNativeFont, Font1.Size)
#Else If B4i
    Return Text.MeasureWidth(Font1.ToNativeFont)
#Else If B4J
    Dim jo As JavaObject
    jo.InitializeNewInstance("javafx.scene.text.Text", Array(Text))
    jo.RunMethod("setFont",Array(Font1.ToNativeFont))
    jo.RunMethod("setLineSpacing",Array(0.0))
    jo.RunMethod("setWrappingWidth",Array(0.0))
    Dim Bounds As JavaObject = jo.RunMethod("getLayoutBounds",Null)
    Return Bounds.RunMethod("getWidth",Null)
#End If
End Sub

Private Sub SetCircleClip (pnl As B4XView,radius As Int)'ignore
#if B4J
Dim jo As JavaObject = pnl
Dim shape As JavaObject
Dim cx As Double = pnl.Width
Dim cy As Double = pnl.Height
shape.InitializeNewInstance("javafx.scene.shape.Rectangle", Array(cx, cy))
If radius > 0 Then
	Dim d As Double = radius
	shape.RunMethod("setArcHeight", Array(d))
	shape.RunMethod("setArcWidth", Array(d))
End If
jo.RunMethod("setClip", Array(shape))
#else if B4A
	Dim jo As JavaObject = pnl
	jo.RunMethod("setClipToOutline", Array(True))
#end if
End Sub

'int ot argb
Private Sub GetARGB(Color As Int) As Int()'ignore
	Private res(4) As Int
	res(0) = Bit.UnsignedShiftRight(Bit.And(Color, 0xff000000), 24)
	res(1) = Bit.UnsignedShiftRight(Bit.And(Color, 0xff0000), 16)
	res(2) = Bit.UnsignedShiftRight(Bit.And(Color, 0xff00), 8)
	res(3) = Bit.And(Color, 0xff)
	Return res
End Sub

Private Sub TintBmp(img As ImageView, color As Int)
	#If B4I
	Dim NaObj As NativeObject = Me
	NaObj.RunMethod("BmpColor::",Array(img,NaObj.ColorToUIColor(color)))
	#Else if B4J
	img.SetImage(ChangeColorBasedOnAlphaLevel(img.GetImage,color).Resize(img.Width,img.Height,True))
	#Else If B4A
	Dim jo As JavaObject=img
	jo.RunMethod("setImageBitmap",Array(img.Bitmap))
	'jo.RunMethod("setColorFilter",Array(Colors.Transparent))
	jo.RunMethod("setColorFilter",Array(Colors.rgb(GetARGB(color)(1),GetARGB(color)(2),GetARGB(color)(3))))
	
	#End If

	
End Sub

#If OBJC
- (void)BmpColor: (UIImageView*) theImageView :(UIColor*) Color{
theImageView.image = [theImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
[theImageView setTintColor:Color];
}
#end if

#End Region

#If B4J
'https://www.b4x.com/android/forum/threads/b4x-bitmapcreator-change-color-of-bitmap.95518/post-603416
Private Sub ChangeColorBasedOnAlphaLevel(bmp As B4XBitmap, NewColor As Int) As B4XBitmap
	Dim bc As BitmapCreator
	bc.Initialize(bmp.Width, bmp.Height)
	bc.CopyPixelsFromBitmap(bmp)
	Dim a1, a2 As ARGBColor
	bc.ColorToARGB(NewColor, a1)
	For y = 0 To bc.mHeight - 1
		For x = 0 To bc.mWidth - 1
			bc.GetARGB(x, y, a2)
			If a2.a > 0 Then
				a2.r = a1.r
				a2.g = a1.g
				a2.b = a1.b
				bc.SetARGB(x, y, a2)
			End If
		Next
	Next
	Return bc.Bitmap
End Sub
#End If

