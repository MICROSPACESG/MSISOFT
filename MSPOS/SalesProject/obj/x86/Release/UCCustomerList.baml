   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:SalesProjectSalesProject  !    SalesProject.UCCustomerList   !myclr-namespace:SalesProject  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -   ���	#FF004040  � UseLayoutRounding  .  � 	Resources    ButtonStyle1 �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius J� SnapsToDevicePixels��%�   &	        �� " ��.���  � �� �� " ��.R��� $ Chrome��
�������$��2q�$ 2��#��z��._��� #��z��#��z����. # z #��z��.���� $	��620��$	��500��$��Center=�.+��� $��5q�	 �� Padding$	 5q�$ 10��$��1q�
������� . ���	#FF004040._��� $��5q����	#FF004040$��60��$��Center=�
 �� Orientation$
 
Horizontal=�$��Center=�.+��� -   $��label1��$��Customer List��$��Center=�$��Center=�
�������$��32(�$��	ExtraBold"�$��Segoe UI Symbol)�
������ ���	#FF004040$��2q�$	��410���� $	 5q�$ 10��$��1q�
������� . ���	#FF004040$	��490��._��� $
 
Horizontal=�$��Center=����	#FF004040$��Center=�$	��387��.+��� $	��350��$
 Vertical=�.+��� .+�� $	��380��$	��320�� � RowDefinitions �� $��45 ��� $	��285 ��� $��45 ��� .+��� -   #���   $	��314��$��40��$
��Left=�$	��0,2q�����  �� ImageSource$1 +/SalesProject;component/Images/upBtnNew.png���� -    ��Name$ svBtn��$	��0,5q�$��1��$	��314��$
��Left=�$��Hidden=�$��Hidden=�.���� -   $��pnlCustomerList��$
 Vertical=�$	��258��$	��298���� -   $��0,0,0,2q�#���   $��2��$	��314��$��40��$
��Left=����� $0 */SalesProject;component/Images/DownBtn.png���� $��3��$
 Vertical=�$��Center=��� $	��120��.+�� $	��443�� �� $��45 ��� $	��285 ��� $��45 ��� .+��� -   $��InitUp��#���   $��0��$	��110��$��40��$��Center=����� $1 +/SalesProject;component/Images/upBtnNew.png���� -   $ svBtn1��$��0,5,0,5q�$��1��$	��110��$
��Left=�$��Hidden=�$��Hidden=�.���� -	   $��pnlCustomerNameList��$��Center=�$
 Vertical=�$	��280���� -
   $��InitDown��#���   $��2��$	��110��$��40��$��Center=����� $0 */SalesProject;component/Images/DownBtn.png���� $��3��$��0,0,0,63q��� $	 5q�$ 10��$��1q�
������� . ���	#FF004040$	��490��$��55��._��� $��40��$
 
Horizontal=�.+��� -   $��txtCustomerName��$	��469��$��18(�
���   �$
��Bold"�$��Right=�$��Center=� �� TextAlignment$
 Left=��� $	 5q�$ 10��$��1q�
������� . ���	#FF004040$	��490��$��70��._��� $��60��$
 
Horizontal=�.+��� -   $��	btnSubmit��$��60��
�������$��Submit��$��26(�$
��Bold"�$��Normal$�
�������$	��240������  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFF5E9E9�� � Offset$ 0Q�� $ #006400��$ 0.738Q��� -   $��	btnCancel��$��60��
�������$��Cancel��$��26(�$
��Bold"�$��Normal$�
�������$	��240������ $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFF5E9E9��$ 0Q�� $ Black��$ 0.738Q�