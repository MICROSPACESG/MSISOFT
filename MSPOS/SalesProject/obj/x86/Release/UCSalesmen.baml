   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:SalesProjectSalesProject      SalesProject.UCSalesmen   !myclr-namespace:SalesProject  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     -   ���	#FF004040  � UseLayoutRounding  . .���� $	��620��$	��500��$��Center=�.+��� $��5q� �� Padding$ 5q� �� CornerRadius$ 10��$��1q�
������� J� SnapsToDevicePixels . ���	#FF004040._��� $��5q����	#FF004040$��60��$��Center=� �� Orientation$ 
Horizontal=�$��Center=�.+��� -   $��label1��$��Select Salesmen��$��Center=�$��Center=�
�������$��32(�$��	ExtraBold"�$��Segoe UI Symbol)�
������ ���	#FF004040$��2q�$	��410���� $ 5q�$ 10��$��1q�
������� . ���	#FF004040$	��490��._��� $ 
Horizontal=�$��Center=�$	��480��.+��� $ Vertical=�$	��Top=����	#FF004040$	��515��.+��� $ Vertical=�$	��Top=����	#FF004040$	��515��.+��� $	��370��$	��480��$ Vertical=�.+��� $��1q�
������� . $	��470��$	��368��._�&    SalesProject.UCItemDisplayMaster  -     Name$ pnlSalesmenList��$	��348��
������ $	��460��$��Center=�$��Center=�� $��Bottom=�$	��350�����	#FF003232$	��167�� � ColumnDefinitions �� ��  � RowDefinitions �� $��0* ��� $	��30* ��� $	��22* ��� $	��30* ��� $	��30* ��� $	��25* ��� $	��23* �.+��� -   $��lblCurrentBillTitle��$��1��$��0��$��Bill NO��$��30��$
��Left=�$��10,0,0,0q�$	��Top=�$��17(����	#FFADF213$	��145���� -   $��	lblBillNo��$��1��$��1��$
��0001��$��30��$
��Left=�$��2,0,0,0q�$	��Top=�$��17(����	#FFF2ECEC$	��143��$��2��$��Center=��� -   $��	lblTotQty��$��2��$��1��$
��0.00��$��30��$
��Left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��109���� -   $��label3��$��3��$��Gross Amt :��$��30��$
��Left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��182��$��2���� -   $��	lblTotAmt��$��3��$��1��$
��0.00��$��30��$
��left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��109���� -	   $��lblTax��$��4��$��0��$��Tax Amount :��$��30��$
��Left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��170���� -
   $��	lblTaxAmt��$��4��$��1��$
��0.00��$��30��$
��left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��109���� -   $��label5��$��5��$��Discount Amt :��$��30��$
��Left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��182��$��2���� -   $��lblDiscount��$��5��$��1��$
��0.00��$��30��$
��left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��109��{�.  �� -   $��label7��$��6��$��	Net Amt :��$��30��$
��Left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��174���� -   $��	lblNetAmt��$��6��$��1��$
��0.00��$��30��$
��left=�$��10,0,0,0q�$	��Top=�$��15(����	#FFF2ECEC$	��109���� $��1��$ 10��$��1q����	#FFF2F2F8 . ���	#FF313146$	��360��$	��163��$y�Hidden=��� $��89��$ Vertical=�.+��� $��1q�
������� . ���	#FF004040$	��470��$��91��._�� $	��461�� �� $��40 ��� $��40 � �� $��55 ��� $��45 ��� $	��306 ��� $	��55* �.+��� $��Salesmen��
�������$��18(�$
��Bold"�$��Center=�$��Center=�$��2��$	��5,3q��� -   $��txtSalesmen��$��2��$��2,2,0,2q�
���   �$��20(�$
��Bold"�$��Right=�$��Center=� �� 
IsReadOnly . 	 �� TextAlignment$
	 Left=�$��35���� $��1��$
��Note��
�������$��18(�$
��Bold"�$��Center=�$��Center=�$��2��$
��24,3q��� -   $��txtNote��$��1��$��2��$��2,2,0,2q�
���   �$��20(�$
��Bold"�$��Right=�$��Center=�$
	 Left=�$��35���� -   $��BtnKey��$��1��$��3��$��. . . ��
�������$��18(�$
��Bold"�$��Center=�$��Center=����	#FF004040���	#FF004040�� $��65��$ 
Horizontal=�$��Center=�$��Center=�.+��� -   $��	btnSubmit��$��60��
�������$��Submit��$��26(�$
��Bold"�$��Normal$�
�������$	��235������ 
 �� EndPoint$
 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFF5E9E9�� � Offset$ 0Q�� $ #006400��$ 0.738Q��� -   $��	btnCancel��$��60��
�������$��Cancel��$��26(�$
��Bold"�$��Normal$�
�������$	��235������ $
 0.5,1&�$ 0.5,0&�.��� $ 	#FFF5E9E9��$ 0Q�� $ Black��$ 0.738Q�