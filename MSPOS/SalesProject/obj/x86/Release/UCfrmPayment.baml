   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:DataGridNameSpaceDataGridNameSpace      SalesProject.UCfrmPayment   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     1localclr-namespace:DataGridNameSpace     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -   $��14(����	#FF003636  � 	Resources     
MyMinimize  ButtonStyle1 �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius J� SnapsToDevicePixels  styleCalendar&   System.Windows.Controls.Calendar5  /System.Windows.Controls.Primitives.CalendarItem  Name  styleDatePicker(  "System.Windows.Controls.DatePicker	 �Name
 � ColumnDefinitions��%�  &	        &	      &	 �     &	     �� �� " ��.���  � �� �� " ��.R��� $ Chrome��
�������$��2q�$ 2��#��z��._��� #��z��#��z����. # z #��z���� "  .���  � �� �� "  .R�(� $	��300��$	��300��.��  $ PART_CalendarItem��#��z��#��z��#��z���� "  .���  � �� �� "  .R�� $	 	PART_Root��
 �� $��* ��� $
��Auto � J� InputBindings �� 
 �� Key$	 F12�� �� Command# [  .����  �� Orientation$ Vertical=�$��Center=�.+��� -   $��lblPaymentTitle��$��House Account Payment��$��45��$��Center=�$��Center=�$��20(�$��	ExtraBold"�
��� � ��� 
�������$��2q�$	��880��$	��552��$��0,-5,0,0q�._��� $ 
Horizontal=�$��Center=�.+�� -   $��pnlCommonPayment��$	��480�� � Orientation$ Vertical=�$y�Visible=�.+��� -   $��pnlHouseACPayment��$ Vertical=�$y�	Collapsed=�$
��Left=�$	��480��.+��� $ 
Horizontal=�$��40��.+��� $��Account Name  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $��
txtHACName��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Account Code  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $��
txtHACCode��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� -   $��btnAccountCodeLoad��$
��Type��$��16(�$��
ExtraBlack"�
������ 
��� � �$��40��$��85���� $ 
Horizontal=�$��40��.+��� $��Payment Amount: ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $��txtHACPaymentAmt��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Account Limit  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -	   $��txtHACAccountLimit��
������ $��35��$	��200��{�.  �� 
IsReadOnly . 
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Balance Due  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -
   $��txtHACBalanceDue��
������ $��35��$	��200��{�.  . 
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� .+��� $��Available Credit  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� $��(INC Openning) ��$	��190��$��25��$��Center=�$��	0,-15,0,0q�$��10(�$��	ExtraBold"�
��������� -   $��txtHACAvailableCredit��
������ $��35��$	��200��{�.  . 
�������$��Center=�$��Center=�$��16(��� -   $��pnlSupplierPayment��$ Vertical=�$y�Hidden=�$��0,-200q�.+��� $ 
Horizontal=�$��40��.+��� $��Supplier Name: ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $��
txtSupName��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Supplier Code: ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $��
txtSupCode��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� -   $��btnSupplierCodeLoad��$
��Type��$��16(�$��
ExtraBlack"�
������ 
��� � �$��40��$��85���� $ 
Horizontal=�$��40��.+��� $��Payment Amount: ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $��txtSupplierPaymentAmt��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Balance Due  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $��txtSupplierBalanceDue��
������ $��35��$	��200��{�.  . 
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Balance Amount  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $ ��txtSupplierAvailableCredit��
������ $��35��$	��200��{�.  . 
�������$��Center=�$��Center=�$��16(��� -   $��pnlExpansesDisplay��$ Vertical=�$y�	Collapsed=�$	��380��$	��480��$��0,-240q�.+��� $ 
Horizontal=�$��40��.+��� $��Expencess Type  : ��$	��190��$��35��$
��Left=�$��Center=�$��20(�$��	ExtraBold"�
��������� -   $��
txtExpType��
������ $��35��$	��200��{�.  . 
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Amount              : ��$	��190��$��35��$
��Left=�$��Stretch=�$��20(�$��	ExtraBold"�
��������� -   $��
txtExptAmt��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $	��415��$	��185��$��Center=�.+��� $$��Counter Payment Amount Details��$��30��$��Center=�
���2�2�$��	ExtraBold"�$��15(��� $	��Top=�$
��Auto=�.���� -   $��listDisplay1��$��Center=�$��5,5,5,0q�$��18(�$
��auto������ 7  1System.Windows.Forms.Integration.WindowsFormsHost  -   $��windowsFormsHost2��$	��138��$	��Top=�$��Center=�$	��410��   TabIndex$ 17��   Child. "   DataGridNameSpace.MyDataGrid  -   gridPayment��[ WSystem.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'  !System.Windows.Forms.DataGridView   AutoGenerateColumns .    SelectionMode$ FullRowSelect=�   EditMode$ EditOnEnter=�   RowHeadersBorderStyle$ Single=�   BackgroundColorU QSystem.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a#  System.Drawing.ColorConverter$ White    	ForeColor$ Black    BorderStyle$
 None=�"  System.Windows.Forms.Control   TabIndex$ 5��   AllowUserToAddRows .     RowHeadersVisible .     
ScrollBars$ Vertical=�   MultiSelect .     CellBorderStyle$
 None=�    AutoSizeColumnsMode$
  Fill=�!   ReadOnly! . ]� $	��470��.+��� -   $��
btnHACPrev��$
��Left=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$
��PREV��$��70��$��60���� -   " ��Name$" svBtnHACLetter��$
��Left=�$��70��$	��345��$
��Left=�$��Hidden=�$��Hidden=�.���� -   $��pnlPaymentListLetter��$ 
Horizontal=��� -   $��
btnHACNext��$��Right=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$
��NEXT��$��70��$��60���� -   $��btnClose��#��[ ���	#FF003636$��2,0,0,0q�
�������$��	ExtraBold"�$��22(�$��Close��$��50��$	��470���� .+��� $ Vertical=�.+��� $ 
Horizontal=�.+��� .+��� -   $��btnPaymentIn��#��[ 
������ $��Center=�$��Center=�$��0��$��Heavy"�$��0��$��60��$	��125��$��20(�$��Center=�
�������$��9��.���� $
��Wrap=�# �� TextAlignment$# Center=�$��20(�
Payment IN�� -   $��btnPaymentOut��#��[ 
������ $��Center=�$��Center=�$��0��$��Heavy"�$��0��$��60��$	��125��$��20(�$��Center=�
�������$��9��.���� $
��Wrap=�$# Center=�$��20(�Payment Out�� -    $��btnExpenses��#��[ 
������ $��Center=�$��Center=�$��0��$��Heavy"�$��0��$��60��$	��125��$��20(�$��Center=�
�������$��9��.���� $
��Wrap=�$# Center=�$��20(�
Expenses�� -!   $��btnPaymentPrint��#��[ 
������ $��Center=�$��Center=�$��0��$��Heavy"�$��0��$��60��$	��125��$��20(�$��Center=�
�������$��9��.���� $
��Wrap=�$# Center=�$��20(�Print]� .+��� -"   $��btnHACUp��$	��Top=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$��Up��$��60��$	��260���� -#   $" svBtnHAC��$	��Top=�$��0,5,0,0q�$	��110��$
��Left=�$��Hidden=�$��Hidden=�.���� -$   $��pnlPaymentList��$ Vertical=��� -%   $��
btnHACDown��$��Bottom=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$
��Down��$��60��� $	��390�����	#FF003232
 �� �� �� �� $ � RowDefinitions$ �� �� �� �� .+��� -&   $��btnOne1��#��[ 
������ $��Center=�$��Stretch=�$��0��$��Heavy"�$��0��$��75��$��95��$��60(�$��1��$��Center=�
�������$��9���� -'   $��btnFour4��#��[ 
������ $��1��$��0��$��Center=�$��Heavy"�$��75��$��95��$��4��$��60(�$��Center=�
�������$��13���� -(   $��	btnSeven7��#��[ 
������ $��2��$��0��$��Center=�$��Heavy"�$��75��$��95��$��7��$��60(�
�������$��16���� -)   $��btnDot��#��[ 
������ $��3��$��0��$��Center=�$��Heavy"�$��75��$��95��$��.��$��60(�$��40,-40,32,0q�
�������$��19���� -*   $��btnTwo2��#��[ 
������ $��0��$��1��$��Center=�$��Heavy"�$��75��$��95��$��2��$��60(�
�������$��10���� -+   $
��Five��#��[ 
������ $��1��$��1��$��Center=�$��75��$��Heavy"�$��95��$��5��$��60(�
�������$��14���� -,   $��	btnEight8��#��[ 
������ $��2��$��1��$��Center=�$��75��$��Heavy"�$��95��$��8��$��60(�
�������$��17���� --   $��btnZero0��#��[ 
������ $��3��$��1��$��Center=�$��75��$��95��$��Heavy"�$��0��$��60(�
�������$��20���� -.   $��	btnThree3��#��[ 
������ $��0��$��2��$��Heavy"�$��Center=�$��75��$��95��$��3��$��60(�
�������$��12���� -/   $	��Six��#��[ 
������ $��1��$��2��$��Heavy"�$��Center=�$��75��$��95��$��6��$��60(�
�������$��15���� -0   $��btnNine9��#��[ 
������ $��2��$��2��$��Heavy"�$��Center=�$��75��$��95��$��9��$��60(�
�������$��18���� -1   $��btnClearCls��#��[ 
������ $��3��$��2��$��Heavy"�$��Center=�$��75��$��95��$��C��$��60(�
�������$��21���� -2   $��btnCash��#��[ 
������ $��0��$��3��$��Heavy"�$��2��$��Center=�$
��Left=�$��75��$��95��
�������$��24(�$
��Cash��$��25���� -3   $��btnNETS��#��[ 
������ $��1��$��3��$��Heavy"�$��2��$��Center=�$
��Left=�$��75��$��95��
�������$��24(�$
��NETS��$��26���� -4   $��btnCreditCard��#��[ 
������ $��2��$��3��$��Heavy"�$��3��$��Center=�$
��Left=�$��75��$��95��
�������$��24(�$��27��.���� $
��Wrap=�$# Center=�$��20(�Credit Card�� -5   $��btnHACEnter��#��[ $��3��
������ $��Heavy"�$��3��$��Center=�$
��Left=�$��75��$��95��
�������$��35(�$��Enter��{�. $y�Visible=�$��30��