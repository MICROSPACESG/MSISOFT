   M S B A M L   `   `   `  ����   SalesProject"    SalesProject.frmHouseAccount   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     -     � Title$  FrmCreditCard��$	��550��$	��600�� � WindowStyle$
 None=� � WindowStartupLocation$ CenterScreen=�����  �� EndPoint$ 0.5,1&� �� 
StartPoint$ 0.5,0&�.���  � Color$ 	#FFCDD5DE�� � Offset$ 0.006Q�� $ 	#FF3B1183��$ 0.558Q� � 	Resources    ButtonStyle1 �� 
TargetType	 �� Property
 �� Value �� 
TargetType ��Name �� CornerRadius J� SnapsToDevicePixels��%�   &	        �� " ��.��� 	 � ��
 �� " ��.R��� $ Chrome��
�������$��2q�$ 2��#��z��._��� #��z��#��z����. # z #��z��.����  �� Orientation$ Vertical=����	#FF3B1183.+���  �� Padding$ 5q�$ 10��$��1q����	#FFF2F2F8 . ���	#FF3B1183._��� .+��� -   $��label1��$��House Account��$��40��$��Center=�
�������$��20(�$��	ExtraBold"�$��Italic$�$��Segoe UI Symbol)��� $ 5q�$ 10��$��1q����	#FFF2F2F8 . ���	#FF3B1183._��� $ 
Horizontal=�$��Center=����	#FF3B1183.+��� $ Vertical=����	#FF3B1183.+�� $	��443�� � RowDefinitions �� $��45 ��� $	��285 ��� $��45 ��� .+��� -   #���   $��0��$	��200��$��40��$
��Left=�����  �� ImageSource$1 +/SalesProject;component/Images/upBtnNew.png���� -    ��Name$ svBtn��$��0,5,0,5q�$��1��$	��200��$
��Left=�$��Hidden=�$��Hidden=�.���� -   $��pnlCreditCardList��$ Vertical=�$	��300���� -   $��0,0,0,2q�#���   $��2��$	��200��$��40��$
��Left=����� $0 */SalesProject;component/Images/DownBtn.png���� $��3��$ Vertical=�$��Center=�.+��� $��Customer Code��$��Center=�
�������$��16(�$��	ExtraBold"�$��Segoe UI Symbol)��� -   $��txtCustomerCode��$��2q����	#FF3B1183$��Center=�
�������$��	ExtraBold"�$��35��$��Center=�$��3��$	��Top=�$	��190�� �� TextAlignment$ Right=�$��20(� �� 	MaxLength$ 0���� $	��245��$	��440��$	��Top=�$ Vertical=�.+��� $ 
Horizontal=�$��Center=�.+��� -   $��btnOne��#���   
�������$��0q�$��0��$��0��$��1��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� -	   $��btnTwo��#���   
�������$��0q�$��2��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� -
   $��btnThree��#���   
�������$��0q�$��2��$��0��$��3��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� $ 
Horizontal=�$��Center=�.+��� -   $��btnFour��#���   
�������$��0q�$��1��$��0��$��4��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� -   $��btnFive��#���   
�������$��0q�$��1��$��1��$��5��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� -   $��btnSix��#���   
�������$��0q�$��1��$��2��$��6��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� $ 
Horizontal=�$��Center=�.+��� -   $��btnSeven��#���   
�������$��0q�$��2��$��0��$��7��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� -   $��btnEight��#���   
�������$��0q�$��2��$��1��$��8��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� -   $��btnNine��#���   
�������$��0q�$��2��$��2��$��9��$��80��$
��Left=�$	��Top=�$��80��$��50(�$��	ExtraBold"�
������ �� $ 
Horizontal=�$��Center=�.+��� -   $��btnDot��#���   
�������$��0q�$��3��$��0��$��.��$��80��$
��Left=�$	��Top=�$��80��$��3��$��50(�$��	ExtraBold"�
������ �� -   $��btnZero��#���   
�������$��0q�$��3��$��1��$��0��$��80��$
��Left=�$	��Top=�$��80��$��2��$��50(�$��	ExtraBold"�
������ $��0q��� -   $��btnClear��#���   
�������$��0q�$��3��$��2��$��Clear��$
��Bold"�$��23(�$��80��$
��Left=�$	��Top=�$��80��
������ �� $ 
Horizontal=�$��Center=�.+��� -   $��btnBackspace��#���   $��25(�
���  ��$��	ExtraBold"�$��0q�$��4��$��3��$��0��$��Close��$��80��$
��Left=�$	��Top=�$	��120��
������ �� -   $��btnEnter��#���   
���2�2�$��25(�$��	ExtraBold"�$��0q�$��4��$��3��$��0��$��Submit��$��80��$
��Left=�$	��Top=�$	��120��
������ �� $ 
Horizontal=�$��Center=�.+��� -   $��lblCustomerName��$��Select Customer��$��Center=�
�������$��16(�$��	ExtraBold"�$��Segoe UI Symbol)�� $	��443�� �� $��45 ��� $	��285 ��� $��45 ��� .+��� -   #���   $��0��$	��110��$��40��$��Center=����� $1 +/SalesProject;component/Images/upBtnNew.png���� -   $ svBtn1��$��0,5,0,5q�$��1��$	��110��$
��Left=�$��Hidden=�$��Hidden=�.���� -   $��pnlCreditCardHolderList��$��Center=�$ Vertical=�$	��280���� -   $��
btnHACDown��#���   $��2��$	��110��$��40��$��Center=����� $0 */SalesProject;component/Images/DownBtn.png���� $��3��.+��� $��Amount��$��Center=�
�������$��16(�$��	ExtraBold"�$��Segoe UI Symbol)��� -   $��txtEnterValue��$��2q����	#FF3B1183$��Center=�
�������$��	ExtraBold"�$��35��$��Center=�$	��Top=�$	��110��$ Right=�$��20(�$ 0��