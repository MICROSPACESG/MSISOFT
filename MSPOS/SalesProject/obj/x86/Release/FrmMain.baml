   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:DataGridNameSpaceDataGridNameSpace      SalesProject.FrmMain   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     1localclr-namespace:DataGridNameSpace     -     � Title$  FrmMain��$	��768��$
��1024�����	#FF004040 � WindowState$ 	Maximized=� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=� � Icon$0 */SalesProject;component/Images/fevicon.ico�� � 	Resources    ButtonStyle1 �� 
TargetType �� Property �� Value	 �� 
TargetType
 ��Name �� CornerRadius J� SnapsToDevicePixels  
MyMinimize��%�   &	        &	 �     �� " ��.���  � �� �� "	 ��.R��� $
 Chrome��
�������$��2q�$ 2��#��z��._��� #��z��#��z����. # z #��z����  J� CommandBindings )  #System.Windows.Input.CommandBinding  -      Command# [  J� InputBindings �� 
 �� Key$	 F12�� �� Command# [ .����  �� Orientation$ 
Horizontal=����	#FF004040$��Center=�$��Center=�.+�� ���	#ff004040 � ColumnDefinitions �� �� �� .+��� $	��745�� �� Padding$ 2q�$ 10��$��1q����	#FFF2F2F8 . ���	#373599B9._��� .+�� $��60��.+��� -   $��label1��$��	Counter :��$
��Left=�$��Center=�$
��Bold"�$��60��$��20(�
�������$	��100���� -   $��lblcounterName��$��Counter Name��$��Center=�$
��-100q�$��Center=�$
��Bold"�$��60��$��16(�
��������� -   $��lblUserName��$
��User��$��Right=�$��Center=�$
��-420q�$
��Bold"�$��60��$��16(�
��������� -   $��lblUser��$��:  User��$��Right=�$
��-490q�$��Center=�$
��Bold"�$��60��$��20(�
��������� $ 
Horizontal=�$��2�����	#373599B9.+�� $	��700��$	��740��$	��Top=�$��Center=����	#373599B9 �� �� ��  � RowDefinitions �� �� �� .+��� -   $��
btnManager��$��0��$��0��#���   
�������$��35(�$��Heavy"�$	��240��$
��Left=�$	��Top=�$	��235��$��Center=�$��1��.���� $ Vertical=�.+��� $��0q�
�������.��	Manager����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFA6C7C7�� � Offset$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnBackOffice��$��0��$��1��#���   
�������$��35(�$��Heavy"�$	��240��$
��Left=�$	��Top=�$	��235��$��2��.���� $ Vertical=�.+��� $��0q�
�������.��Back Office���� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -	   $��btnPOS��$��0��$��2��#���   
�������$��35(�$��Heavy"�$	��240��$
��Left=�$	��Top=�$	��235��$��3��.���� $ Vertical=�.+��� $��0q�
�������.��POS���� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -
   $��button4��#���   
�������$��35(�$��Heavy"�$	��240��$
��Left=�$	��Top=�$	��235��$��4��$��2��$��	0,239,0,0q�$��2��.���� $ Vertical=�.+��� $��0q�
�������$��32(�.��Branch TX/RX���� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��button5��$��1��#���   
�������$��35(�$��Heavy"�$	��240��$
��Left=�$	��Top=�$	��235��$��5��$��2��$��	0,239,0,0q�$��2��.���� $ Vertical=�.+��� $��0q�
�������.��System���� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��button6��$��2��#���   
�������$��35(�$��Heavy"�$	��240��$
��Left=�$	��Top=�$	��235��$��6��$��	0,239,0,0q�$��2��.���� $ Vertical=�.+��� $��0q�
�������$��32(�.��Synchronize���� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��btnClose��$��1��$��3��#���   
�������$��40(�$��Heavy"�$	��208��$
��Left=�$	��Top=�$	��705��$��7��$��	1,232,0,0q�$��2��.���� $ Vertical=�.+��� $��0q�
�������$��Logout������ $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFA6C7C7��$ 0Q�� $ 	#FF004040��$ 0.523Q��� -   $��pnlGroupItem��$	��Top=�$��Center=�$��0��$ Vertical=�$	��745��$	��310�����	#373599B9.+��� $ 5q�$ 10��$��1q����	#FFF2F2F8 . ���	#373599B9._�7  1System.Windows.Forms.Integration.WindowsFormsHost  -   $��windowsFormsHost1��$	��735��$	��Top=�$
��Left=�$	��300��   TabIndex$ 17��   Child. "   DataGridNameSpace.MyDataGrid  -   gridDisplay��[ WSystem.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'  !System.Windows.Forms.DataGridView   AutoGenerateColumns .    SelectionMode$ FullRowSelect=�   RowHeadersBorderStyle$ Single=�   BackgroundColorU QSystem.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a#  System.Drawing.ColorConverter$ White     	ForeColor$  Black !   BorderStyle$
! None=�"  System.Windows.Forms.Control"   TabIndex$" 5��#   AllowUserToAddRows# .  $   RowHeadersVisible$ .  %   
ScrollBars$% Vertical=�&   MultiSelect& .  '   AutoSizeColumnsMode$
' Fill=�