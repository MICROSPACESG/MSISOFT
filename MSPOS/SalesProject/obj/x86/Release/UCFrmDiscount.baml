   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:SalesProjectSalesProject       SalesProject.UCFrmDiscount   !myclr-namespace:SalesProject  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     ���	#FF004040  � UseLayoutRounding  .  � 	Resources    ButtonStyle1 �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius J� SnapsToDevicePixels��%�   &	        �� " ��.���  � �� �� " ��.R��� $ Chrome��
�������$��2q�$ 2��#��z��._��� #��z��#��z����. # z #��z��.���� $	��620��$	��500��$��Center=�.+��� $��5q�	 �� Padding$	 5q�$ 10��$��1q�
������� . ���	#FF004040._��� $��5q����	#FF004040$��60��$��Center=�
 �� Orientation$
 
Horizontal=�$��Center=�.+��� -   $��label1��$��Discount��$��Center=�$��Center=�
�������$��32(�$��	ExtraBold"�$��Segoe UI Symbol)�
������ ���	#FF004040$��2q�$	��410���� $	 5q�$ 10��$��1q�
������� . ���	#FF004040._��� $
 
Horizontal=�$��Center=�$	��490��.+��� $
 Vertical=�$	��Top=����	#FF004040$	��515��.+�&    SalesProject.UCItemDisplayMaster  -     Name$ pnlDiscountList1��$	��467��
������ $	��208���� -   $��txtEnterDiscountValue��
�������$��Center=�
���   �$��	ExtraBold"�$��40��$��Center=�$	��Top=�$	��200�� �� TextAlignment$ Right=�$��20(� �� 	MaxLength$ 0��$	��0,5q�� $	��280��$	��Top=�.+��� -   $��btnOne��#���   
�������$��0q�$��1��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��4,3,0,0q�$��2���� -   $��btnTwo��#���   
�������$��0q�$��1��$��2��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��4,3,0,0q��� -   $��btnThree��#���   
�������$��0q�$��2��$��3��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2,3,0,0q��� -   $��btnFour��#���   
�������$��0q�$��4��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��4,4,0,0q�$��1��$��2���� -   $��btnFive��#���   
�������$��0q�$��1��$��5��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��3,4,0,0q�$��1��$��2���� -	   $��btnSix��#���   
�������$��0q�$��2��$��6��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��1��$��2,4,0,0q�$��2���� -
   $��btnSeven��#���   
�������$��0q�$��2��$��7��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��4,5,0,0q�$��2���� -   $��btnEight��#���   
�������$��0q�$��2��$��1��$��8��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��3,5,0,0q�$��2���� -   $��btnNine��#���   
�������$��0q�$��2��$��2��$��9��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2,5,0,0q�$��2���� -   $��btnDot��#���   
�������$��0q�$��3��$��.��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��4,5,0,0q�$��2���� -   $��btnZero��#���   
�������$��0q�$��3��$��1��$��0��$��98��$
��Left=�$	��Top=�$��90��$��50(�$��	ExtraBold"����	#FF004040$��2,5,0,0q�$��2���� -   $��btnBackspace��#���   
�������$��0q�$��4��$��Cancel��$��98��$
��Left=�$	��Top=�$��90��$��2,5,0,0q�$��2��$��23(�����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFF5E9E9�� � Offset$ 0Q�� $ Black��$ 0.738Q��� -   $��btnClear��#���   
�������$��0q�$��4��$��1��$��Clear��$��98��$
��Left=�$	��Top=�$��90��$��4,5,0,0q�$��2��$��23(����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFF5E9E9��$ 0Q�� $ 	#FFDB0E0E��$ 0.738Q��� -   $��btnEnter��#���   
�������$��0q�$��3��$��2��$��3��$��Enter��$��98��$
��Left=�$	��Top=�$	��180��$��2,5,0,0q�$��23(����� $ 0.5,1&�$ 0.5,0&�.��� $ 	#FFDAE2D6��$ 0Q�� $ 	#FF009600��$ 0.541Q�