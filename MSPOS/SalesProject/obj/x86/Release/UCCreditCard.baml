   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:SalesProjectSalesProject      SalesProject.UCCreditCard   !myclr-namespace:SalesProject  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ���	#FF004040  � UseLayoutRounding  .  � 	Resources    ButtonStyle1 �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius J� SnapsToDevicePixels��%�   &	        �� " ��.���  � �� �� " ��.R��� $ Chrome��
�������$��2q�$ 2��#��z��._��� #��z��#��z����. # z #��z��.���� 	 �� Orientation$	 Vertical=����	#FF004040$	��620��$	��500��$��Center=�$��Center=�.+��� $
��0,30q�
 �� Padding$
 2q�$ 10��$��2q����	#FFF2F2F8 . ���	#FF004040$	��490��$��Center=�$��Center=�._��� $	 
Horizontal=�$��Center=����	#FF004040$	��485��$��Bottom=�.+��� $
 1q�$ 10��$	��1.5q�
������� . ���	#FF004040._��� $	 Vertical=����	#FF004040$��Center=�$��Center=�$	��540��$
��200 ��.+��� $	 Vertical=�$	��Top=����	#FF004040$	��540��.+�&    SalesProject.UCItemDisplayMaster  -     Name$ pnlCreditCardList��$	��490��
������ $	��200���� -   $��txtEnterValue��
�������$��Center=�
���   �$��	ExtraBold"�$��40��$��Center=�$	��Top=�$	��195�� �� TextAlignment$ Right=�$��20(� �� 	MaxLength$ 0��$	��0,5q��� ���	#FF004040$��Center=�$	��275��$	��550��.+��  � Orientation$ 
Horizontal=�$	��275��$	��545��$	��Top=�$��5,0,0,0q�.+��� $
 5q�$ 10��$��2q����	#FFF2F2F8 . ���	#FF004040$��65��$��Center=�$��Center=�$	��0,5q�._��� ���	#FF004040$	��255��.+��� -   $��label1��$��Credit Card��$��50��$��Center=�
�������$��26(�$��	ExtraBold"�$��Segoe UI Symbol)��� -   $��btnOne��#���   
�������$��0q�$��1��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��0,0,0,5q��� -   $��btnTwo��#���   
�������$��0q�$��2��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2��$��0,0,0,5q�$��2���� -   $��btnThree��#���   
�������$��0q�$��1��$��3��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2��$��2��$��0,0,0,5q��� -   $��btnFour��#���   
�������$��0q�$��4��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��3��$��0,0,0,5q��� -   $��btnFive��#���   
�������$��0q�$��5��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2��$��0,0,0,5q�$��3���� -	   $��btnSix��#���   
�������$��0q�$��1��$��6��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2��$��0,0,0,5q�$��3���� -
   $��btnSeven��#���   
�������$��0q�$��2��$��0��$��7��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��0,0,0,5q��� -   $��btnEight��#���   
�������$��0q�$��2��$��8��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2��$��0,0,0,5q�$��2���� -   $��btnNine��#���   
�������$��0q�$��2��$��1��$��9��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2��$��0,0,0,5q�$��2���� -   $��btnDot��#���   
�������$��0q�$��2��$��.��$��94��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��0,0,0,5q�$��3���� -   $��btnZero��#���   
�������$��0q�$��2��$��0��$��94��$
��Left=�$	��Top=�$��90��$��2��$��50(�$��	ExtraBold"����	#FF004040$��0,0,0,5q�$��3���� -   $��btnClear��#���   
�������$��0q�$��2��$��1��$��Clear��$��94��$
��Left=�$	��Top=�$��90��$
��Bold"�$��22(�
���  ��$��2��$��0,0,0,5q�$��3���� -   $��btnBackspace��#���   
�������$��0q�$��5��$��3��$��Cancel��$��70��$
��Left=�$	��Top=�$	��270��
�������$��30(�����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFF5E9E9�� � Offset$ 0Q�� $ Black��$ 0.738Q�