   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:DataGridNameSpaceDataGridNameSpace  [ WSystem.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089Y@clr-namespace:System.Windows.Forms;assembly=System.Windows.FormsSystem.Windows.Forms     SalesProject.frmVoid   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     1localclr-namespace:DataGridNameSpace     Omy@clr-namespace:System.Windows.Forms;assembly=System.Windows.Forms     -     � Title$  frmVoid��$	��640��$
��1024�����	#373599B9 � WindowStyle$
 None=� � WindowStartupLocation$ CenterScreen=� � 	Resources    styleCalendar �� 
TargetType&   System.Windows.Controls.Calendar �� Property �� Value �� 
TargetType5  /System.Windows.Controls.Primitives.CalendarItem  Name  ButtonStyle1	 ��Name
 �� CornerRadius J� SnapsToDevicePixels��%  &	        &	 y     �� "  .���  � �� �� "  .R�(� $	��300��$	��300��.��  $ PART_CalendarItem��#��z��#��z��#��z���� " ��.���  � �� �� " ��.R��� $	 Chrome��
�������$��2q�$
 2��#��z��._��� #��z��#��z����. # z #��z��.����  �� Orientation$ 
Horizontal=����	#373599B9.+�]� $	��570�����	#FF003232.+��� $	��Top=�$ 
Horizontal=�$��Center=�.+��� -   $��label1��$��0,0,0,0q�$��LIST OF SALES��$��40��$
��Left=����	#FFADF213$��20(�$��	ExtraBold"�$��Segoe UI Symbol)�$
��Left=��� $��Date :��$��40��$
��Left=�
�������$��20(�$��	ExtraBold"�$��Segoe UI Symbol)�(  "System.Windows.Controls.DatePicker  -   $��dtpFrom��   CalendarStyle# [  $��Center=�$��Normal&�$��3q�$	��115���� $��-��$��40��$
��Left=�
�������$��20(�$��	ExtraBold"�$��Segoe UI Symbol)�  -   $��dtpTo��# [  $��Center=�$	��115���� -   $��btnLoad��#���  $��Center=�$��Heavy"�$��50��$	��100��$
��Load��$��22(�
�������$��10,0,0,0q�����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFA6C7C7�� � Offset$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��pnlGroupItem��$ Vertical=�$	��580��$	��570��$
��Left=����	#373599B9.+���  �� Padding$ 2q�$
 10��$��1q����	#FFF2F2F8 . ���	#FF313146$	��565��._�7  1System.Windows.Forms.Integration.WindowsFormsHost  -   $��windowsFormsHost1��$	��445��$	��Top=�$
��Left=�$	��560��   TabIndex$ 17��   Child. "   DataGridNameSpace.MyDataGrid  "   DataGridNameSpace.MyDataGrid   	CellClick$ gridDisplay_CellClick��-   gridDisplay��'  !System.Windows.Forms.DataGridView   AutoGenerateColumns .    EditMode$ EditOnEnter=�   RowHeadersBorderStyle$ Single=�   BackgroundColorU QSystem.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a#  System.Drawing.ColorConverter$ White    	ForeColor$ Black    BorderStyle$
 None=�"	  System.Windows.Forms.Control 	  TabIndex$ 5��   AllowUserToAddRows .     RowHeadersVisible .     
ScrollBars$ Vertical=�    MultiSelect  .  !   AutoSizeColumnsMode$
! Fill=�"   RowTemplate" *
  $System.Windows.Forms.DataGridViewRow
  # 
  Height$# 30��$ 
  ReadOnly$ . �� $ 
Horizontal=�$
��Left=�.+��� $��Reason to void:��$��28��$��16(�
��������� -	   $��	txtReason��$��30��$	��270��$�� ��$
��Left=�$��Center=�$��0,0,10,0q�% �� 
IsReadOnly% .  �� -
   $��label2��$��Total:��$��28��$��16(�
��������� -   $��txtTotal��$��30��$	��120��$
��0.00��$��Right=�$��Center=�$��0,0,10,0q�% . �� $��Bottom=�$ 
Horizontal=�$��Center=�.+��� -   $��btnCash��#���  $��Center=�$��Heavy"�$��85��$��80��$
��Cash��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnNETS��#���  $��Center=�$��Heavy"�$��85��$��80��$
��NETS��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnCreditCard��#���  $��Center=�$��Heavy"�$��85��$��80��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q����� $��Center=�.+��� -   $��label4��$��Center=�$��Credit��$��32��$��Heavy"�$��75��$��16(�
��������� -   $��label6��$��Center=�$��	0,-10,0,0q�$
��Card��$��32��$��Heavy"�$��75��$��16(�
��������� -   $��
btnHouseAC��#���  $��Heavy"�$��85��$��80��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q����� $��Center=�.+��� $��Center=�$��House��$��32��$��Heavy"�$��75��$��16(�
��������� $��Center=�$��	0,-10,0,0q�$��Account��$��32��$��Heavy"�$��75��$��16(�
��������� #���  $��Center=�$��Heavy"�$��85��$��80��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q����� $��Center=�.+��� $��Center=�$��Voucher��$��32��$��Heavy"�$��80��$��16(�
��������� -   $��btnVoid��#���  $��Center=�$��Heavy"�$��85��$��80��$
��Void��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnPrint��#���  $��Heavy"�$��85��$��80��$��Print��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� $ Vertical=�.+��� -   $��btnGo��#���  $��Center=�$��Heavy"�$��89��$��90��$��Go��$��22(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��	btnRemove��#���  $��Center=�$��Heavy"�$��89��$��90��$��Remove��$��22(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnUp��#���  $��Center=�$��Heavy"�$��89��$��90��$��Up��$��22(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnDown��#���  $��Center=�$��Heavy"�$��89��$��90��$
��Down��$��22(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnKey��#���  $��Center=�$��Heavy"�$��89��$��90��$	��Key��$��22(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnSave��#���  $��Center=�$��Heavy"�$��89��$��90��$��Return��$��22(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnExit��#���  $��Center=�$��Heavy"�$��89��$��90��$��Close��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFF5E9E9��$ 0Q�� $ 	#FFDB0E0E��$ 0.738Q��� $ 
Horizontal=�.+��� -   $��pnItem��$ Vertical=�$	��620��$	��345�����	#373599B9.+�� ���� & � RowDefinitions& �� �� ' � ColumnDefinitions' �� $��65 ��� $	��270 �.+��� -   $��label8��$��0��$��1��$
��Item��$��28��$
��Left=�$��10,5,0,0q�$	��Top=�$��16(�
��������� -   $��txtEnterValue��$��1��$��1��$��5,0,0,0q�$��28��$	��275���� $��0��$��0��$��Bill No��$��28��$
��Left=�$��10,0,0,0q�$	��Top=�$��16(�
��������� -   $��	txtBillNo��$��1��$��0��$��5,0,0,0q�$��28��$	��275���� $ 2q�$
 10��$��1q����	#FFF2F2F8 . ���	#FF313146._�  -   $��windowsFormsHost2��$	��350��$	��Top=�$
��Left=�$	��340��$ 17��.   -    	gridItems�� . $ EditOnEnter=�$ Single=�$ White $ Black $
 None=�$ 5�� .   .  $ Vertical=�  .  $
! Fill=�(   SelectionMode$( FullRowSelect=�" 
  $# 30��$ . �� .+��� $ 2q�$
 10��$��1q����	#FFF2F2F8 . ���	#FF003232._�� ���	#FF004040' �� �� �� �� & �� �� �� �� �� �� �� .+��� -!   $��lblDate��$��2��$��
DD/MM/YYYY��$��28��$
��left=�$	��Top=�$��15(����	#FFF2ECEC$��90��$��5q�$��3,0,0,0q��� -"   $��lblCurrentBillTitle��$��0��$��2��$��Bill No��$��28��$
��Left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFADF213$��80��$��5q��� -#   $��	lblBillNo��$��0��$��3��$
��0001��$��28��$
��Left=�$	��Top=�$��15(����	#FFF2ECEC$	��100��$��5q��� -$   $��labelnew��$��1��$��0��$��	Total Qty��$��28��$
��Left=�$	��Top=�$��15(����	#FFF2ECEC$��90��$��5q��� -%   $��	lblTotQty��$��1��$��1��$��0��$��28��$��Right=�$	��Top=�$��15(����	#FFF2ECEC$��80��$��5q��� -&   $��label3��$��2��$��	Gross Amt��$��28��$
��Left=�$��Bottom=�$��15(����	#FFF2ECEC$��90��$��5q��� -'   $��	lblTotAmt��$��2��$��1��$
��0.00��$��28��$��Right=�$	��Top=�$��15(����	#FFF2ECEC$��80��$��5q��� -(   $��lblTax��$��1��$��2��$��
Tax Amt   ��$��28��$
��Left=�$	��Top=�$��15(����	#FFF2ECEC$��90��$��5q��� -)   $��	lblTaxAmt��$��1��$��3��$
��0.00��$��28��$��Right=�$	��Top=�$��15(����	#FFF2ECEC$��80��$��5q��� -*   $��label5��$��2��$��2��$��	Disc. Amt��$��28��$
��Left=�$��Bottom=�$��15(����	#FFF2ECEC$��90��$��5q��� -+   $��lblDiscount��$��2��$��3��$
��0.00��$��28��$��Right=�$	��Top=�$��15(����	#FFF2ECEC$��80��{�.  $��5q��� -,   $��label7��$��3��$��2��$��0��$��Net Amount(R)    :��$��28��$
��Left=�$	��Top=�$��15(����	#FFF2ECEC$	��170��$��5q��� --   $��	lblNetAmt��$��3��$��2��$��2��$
��0.00��$��28��$��Right=�$	��Top=�$��15(����	#FFF2ECEC$	��150��$��5q��� -.   $��	lblRefund��$��3��$��2��$��2��$
��0.00��$��28��$��Right=�$y�Hidden=�$	��Top=�$��15(����	#FFF2ECEC$	��150��$��5q��� -/   $��btnReSettle��#���  $��Heavy"�$��85��$	��350��$��	Re-Settle��$��24(�
����������� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q�