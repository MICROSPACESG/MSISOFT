   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:SalesProjectSalesProject      SalesProject.UCFrmSplit   !myclr-namespace:SalesProject  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -   ���	#FF004040  � UseLayoutRounding  .  � 	Resources  �� 
TargetType   ImageButton �� BasedOn �� Property �� Value �� 
TargetType �� Padding �� Triggers	 P� Property
 P� Value��%0  &	        7 ��� " ��8   .���  �@�FocusVisualStyle Z� ��  � �� �� " ��.R��� $��border��$��2q�# z��
�������#��z��._��� $��Center=�$��Center=� P� 	 �@J�IsMouseOver
 . . ���  � ��
 �����P� 	 � {�
 .  . ���  �@J�Opacity$
 0.25Q�.���� .+��� -   $��
pnlItemQty��$y�	Collapsed=�$	��625��$	��500�� �� Orientation$ Vertical=����	#FF004040$��Center=�$��Center=�.+��� $��68��$	��495��$��3q�.+��� $��66��$	��493��$��2q�
�������._��� -   $��lblSplit��$��SELECTED ITEM��$��50��$	��237��
�������$��26(�$��Black"�$��Center=��� -   $��
UCPnlSplit��$	��545��$	��495�����	#FF004040.+��� $	��545��$	��495��$��2q�
�������$��0,0,0,0q�._�� .+��� -   $��UCPnlSplitByEven1��$	��540��$	��490��$ Vertical=�$��0,0,0,0q�$��Center=�.+��� $ 
Horizontal=�$	��185��$	��480��$��0,3,0,8q�.+��� $	��155��$	��475�����	#FF004040$��1q�._��� $ 
Horizontal=�$	��130��$	��461��.+��� -   $��btnMinus��$��-��$��48(�$��Black"�
�������$	��100��$	��120��$��8q�#��[  $��Center=�
���� ���� -   $��txtEven��$��56(�$��Black"�
�������$	��100��$	��170��$��8q�$��2�����	#FF004040 �� TextAlignment$ Center=�$��Center=�
�������$	��1.5q�$��Center=� �� 
IsReadOnly . �� -   $��btnPlus��$��+��$��48(�$��Black"�
�������$	��100��$	��120��$��8q�#��[  $��Center=�
���� ���� $��80��$	��480��$��3q�.+��� -	   $��UCBtnRemoveItem��$��75��$��Remove Item��$��24(�
�������
��� � �$
��Bold"�$	��475��#��[  �� $��80��$	��480��$��3q�.+��� -
   $��UCBtnItemDiscount��$��75��$��Item Discount��$��24(�
�������
��� � �$
��Bold"�$	��475��#��[  �� $��80��$	��480��$��3q�.+��� -   $��UCBtnSubmitEven��$��75��$��Update Quantity��$��24(�
�������
��� � �$
��Bold"�$	��475��#��[  �� $��80��$	��480��$��3q�.+��� -   $��UCBtnCancelEven��$��75��$��Cancel��$��24(�
����������	#FFDB0E0E$
��Bold"�$	��475��#��[      SalesProject.UCFrmDiscount  -     Name$ UCFrmItemDiscount1��$y�	Collapsed=�