   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:SalesProjectSalesProject  5clr-namespace:DataGridNameSpaceDataGridNameSpace      SalesProject.UCMain   !myclr-namespace:SalesProject  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     1localclr-namespace:DataGridNameSpace     -   $��sales��$	��768��$
��1024��$��14(����	#FF05053B  � 	Resources     ButtonStyle2 �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius J� SnapsToDevicePixels  ImageButton �� BasedOn	 �� Padding
 �� Triggers P� Property P� Value��%�  &	        &	 �     7 ��� " ��.���  � �� �� " ��.R��� $ Chrome��
�������$��2q�$ 2��#��z��._��� $��15(�$
��Wrap=�#��z��#��z��# z #��z���� " ��8   .���  �@�FocusVisualStyle Z� ��  � �� �� " ��.R��� $��border��#��z��#	 z��#��z��$ 5��#��z��._��� $��Center=�$��Center=�
 P�  �@J�IsMouseOver . . ���  � ��
 �����P�  � {� .  . ���  �@J�Opacity$
 0.25Q���  � ��
 ���� .��]� .+��� $	��Top=�$��Center=�$
��1024��$��70��.+��� $��Center=�$��0,10,0,0q�$��70��$��Center=�
�������$��40(�$��
Retail POS��$��	ExtraBold"�����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFA6C7C7�� � Offset$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��pnlTableMain��$	��Top=�$	��610��$
��1024��$��Center=�$��Center=����	#FF004040$y�Hidden=�.+��� -   $��pnlTableList��$��0,39,0,0q� �� Orientation$ 
Horizontal=�$	��550��$	��800��$��Center=�$��Center=�$y�Visible=�.+��� $ Vertical=�.+��� $	 2q�$ 10��$��1q����	#FFF2F2F8 . ���	#FF004040._��� -   $��
btnManager��
�������$��0q�$	��177��$	��200��$��7��$��40(�$
��Bold"����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFDAE2D6��$ 0Q�� $ 	#FF009600��$ 0.541Q����� 
������ .+��� $1��+/SalesProject;component/Images/manager1.png��$	��100���� $��Manager��$��20(�
�������$	��100��$��Center=��� $	 2q�$ 10��$��1q����	#FFF2F2F8 . ���	#FF004040._��� -   $��btnBackOffice��
�������$��0q�$	��177��$	��200��$��7��$��40(�$
��Bold"����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFDAE2D6��$ 0Q�� $ 	#FF009600��$ 0.541Q����� 
������ .+��� $4��./SalesProject;component/Images/backOffice1.png��$	��100���� $��
Backoffice��$��20(�
�������$	��120��$��Center=��� $	 2q�$ 10��$��1q����	#FFF2F2F8 . ���	#FF004040._��� 
�������$��0q�$	��177��$	��200��$��7��$��40(�$
��Bold"����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFDAE2D6��$ 0Q�� $ 	#FF009600��$ 0.541Q����� 
������ .+��� $	��100��$-��'/SalesProject;component/Images/POS1.png���� $��System��$��20(�
�������$	��150��$��Center=��� $ Vertical=�.+��� -   $��pnlGroupItem��$��Center=�$ Vertical=�$	��445��$	��380�����	#373599B9$��Center=�.+�7  1System.Windows.Forms.Integration.WindowsFormsHost  -   $��windowsFormsHost1��$	��435��$��5q�$	��Top=�$
��Left=�$	��370��   
Background
 �����   TabIndex$ 17��   Child. "   DataGridNameSpace.MyDataGrid  -   gridDisplayMain��[ WSystem.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'  !System.Windows.Forms.DataGridView   AutoGenerateColumns .    SelectionMode$ FullRowSelect=�   RowHeadersBorderStyle$ Single=�   BackgroundColorU QSystem.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a#  System.Drawing.ColorConverter$ White    	ForeColor$ Black    BorderStyle$
 None=�"  System.Windows.Forms.Control   TabIndex$ 5��   AllowUserToAddRows .     RowHeadersVisible .     
ScrollBars$ Vertical=�   MultiSelect .      AutoSizeColumnsMode$
  Fill=��� $	 5q�$ 10��$��1q����	#FFF2F2F8 . ���	#373599B9._��� $	��370��$��92��$ 
Horizontal=�.+��� $	��270��$ Vertical=����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFC4C4EB��$ 0Q�� $ 	#FF1212B1��$ 0.663Q�.+��� $ 
Horizontal=�.+��� -	   $��label1��$��	Counter :��$
��Left=�$��Center=�$
��Bold"�$��40��$��20(�
�������$	��100���� -
   $��lblcounterName��$��Counter Name��$��Center=�$��Center=�$
��Bold"�$��40��$��16(�
��������� $ 
Horizontal=�$
��Left=�.+��� -   $��lblUser��$��User       :��$
��Left=�$��Center=�$
��Bold"�$��40��$��20(�
��������� -   $��lblUserName��$
��User��$
��Left=�$
��Left=�$��Center=�$
��Bold"�$��40��$��16(�
��������� -   $��	btnLogout��
�������$��0q�$��95��$	��100��$��40(�$
��Bold"����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFF5E9E9��$ 0Q�� $ 	#FFDB0E0E��$ 0.738Q����� 
������ .+��� $3��-/SalesProject;component/Images/LogOut1231.png��$��50���� $��Logout��$��20(�
�������$��95��$��Center=��� $ Vertical=�.+��� $	 2q�$ 10��$��1q����	#FFF2F2F8 . ���	#FF004040._��� -   $��	btnDineIn��
�������$��0q�$	��177��$	��200��$��7��$��40(�$
��Bold"����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFDAE2D6��$ 0Q�� $ 	#FF009600��$ 0.541Q����� 
������ .+��� $2��,/SalesProject;component/Images/DineInNew.png��$	��100���� $	��POS��$��20(�
�������$	��120��$��Center=��� $	 2q�$ 10��$��1q����	#FFF2F2F8 . ���	#FF004040._��� -   $��
btnTakeOut��
�������$��0q�$	��177��$	��200��$��7��$��40(�$
��Bold"����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFDAE2D6��$ 0Q�� $ 	#FF009600��$ 0.541Q����� 
������ .+��� $	��100��$7��1/SalesProject;component/Images/Branchtransfer.png���� $��Ticket Issue��$��20(�
�������$	��150��$��Center=��� $	 2q�$ 10��$��1q����	#FFF2F2F8 . ���	#FF004040._��� 
�������$��0q�$	��177��$	��200��$��7��$��40(�$
��Bold"����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFDAE2D6��$ 0Q�� $ 	#FF009600��$ 0.541Q����� 
������ .+��� $	��100��$8��2/SalesProject;component/Images/Synchronization.png���� $��Synchronize��$��20(�
�������$	��150��$��Center=�   SalesProject.UCFrmLogin  -   !  Name$! UCFrmLogin1��$	��Top=�$��Center=�$y�Visible=�$��
0,-610,0,0q�#   SalesProject.UCFrmManagerMain  -   "  Name$" UCFrmManagerMain��$	��Top=�$��Center=�$y�Hidden=�$��
0,-610,0,0q��� $��Bottom=�$��Center=�$
��1024��$��70��.+��� $��Center=�$��0,20,0,0q�$��40��$��Center=�
�������$��20(�$0��*MICROSPACE Tech Support Hotline : 66612345������ $ 0.5,1&�$ 0.5,0&�.��� $ 	#FF004040��$ 0.523Q�� $ 	#FFA6C7C7��$ 0Q�