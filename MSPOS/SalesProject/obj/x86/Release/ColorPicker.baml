   M S B A M L   `   `   `  ����   SalesProject    SalesProject.ColorPicker   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     $	��328��$	��525��$	��305��$	��482��  � 	Resources     CheckerboardBrush j� Stretch j� TileMode j� 
AlignmentX j� 
AlignmentY j� Viewport j� ViewportUnits L� Drawing � Brush	 � Geometry
 �� Rect��%�   &	        L� $
 None=�$
 Tile=�$
 Left=�$	 Top=�$ 	0,0,10,10�$ Absolute=� I� .���  �	sc# 1,1,1	 �� $
 	0,0,10,10��  �sc# 0.5,0.5,0.5	 �� $
 0,0,5,5��  �sc# 0.5,0.5,0.5	 �� $
 5,5,5,5�.��� -   
�������$	��329��$	��479�� � RowDefinitions �� $��35 ��� $	��200 ��� $��64 ��� $��6* �.+��� $��0��$��35��$��Stretch=� �� Orientation$ 
Horizontal=�
���   �.+��� $��Pick swatch type��
�������$
��Bold"�$��Center=��� -    ��Name$ 
ImgSqaure1��$��20��$��20��$#��Images/ColorSwatchSquare1.png��$��45,0,0,0q� � ToolTip$ Color Swatch Square 1���� -   $ 
ImgSqaure2��$��20��$��20��$#��Images/ColorSwatchSquare2.png��$��5,0,0,0q�$ Color Swatch Square 2���� -   $ 
ImgCircle1��$��20��$��20��$"��Images/ColorSwatchCircle.png��$��5,0,0,0q�$ Color Swatch Circle��� -    �Name$ MainGrid��$��1��$��0,0,0,34q�$��2�� � ColumnDefinitions �� $	��170 ��� $	��164 ��� $	��176 �.+�� $��0��$��0��$��	10,30,0,0q�.+��� 
���   �$��2q�$��Center=�$	��Top=�
�������$	��154��$	��154���� -   $ 
ColorImage��$	��150��$	��150��$��Center=�$	��Top=�$��2q�$#��Images/ColorSwatchSquare1.png���� -    ��Name$ canvasImage��$	��150��$	��150��$��Center=�
������ $	��Top=�$��2q�.+�A� -    A�Name$ ellipsePixel��$��8��$��8��
���   �
������� �� Left$ 0��
 �� Top$ 0���� -	   $��1��$ Vertical=�$��2��$��	0,0,169,0q�.+��� $��Preview��$��5,0,0,0q�$
��Left=�
���   �$
��Bold"�$��Center=��� $��4,5,10,0q�$	��154��$	��154��$
��Left=�
���   �$��2q�#��[  ._��� -
   $��previewPresenter��$��0q�$	��150��$	��150�� �� Strokes$� �AOcBAxdIEESAgYAERYQBGwIAJAFGhAEbAgAkAQUBOBkgMgkA9P8CAekiOkUzCQD4nwIBWiA6RTgIAP4DAAAAgH8RAACAPx8JEQAAAAAAAPA/CpYBNIfm3uajgcQgUUiUkjUelEal0KkUBh0HichlM1mtJotZp9JodDl8jk8ZgcBiUOjUYl08m0+l0+lFCjksjESAh+kg6auNwaEwSBQiEQyLRKTRiVSiUSSORyLQ6JQSBIPFYnKZTL5fOZfMZXL4/H47DYLBYHFoJLIpEo9GgIP3OB5PlxLCJiZmU1MISSi4SJiS74+D4+4o���� $��2��$ Vertical=�$��0,0,28,0q�.+��� $ 
Horizontal=�$��0,30,0,0q�.+��� $��A��$��5,0,0,0q�$
��Left=�
���   �$
��Bold"�$��Center=���  �� CornerRadius$ 5��
���   �
�������$��2q�$��50��$��30��._��� -    ��Name$ txtAlpha��$��0q�
�������
������ $��5,1,5,1q� �� 
IsReadOnly .  �� TextAlignment$ Center=�$��0,5,0,0q���.  �� $ 5��
���   �
�������$��2q�$��10,0,0,0q�$��50��$��30��._��� -   $ txtAlphaHex��$��0q�
�������
������ $��5,1,5,1q� . $ Center=�$��0,5,0,0q���.  �� $ 
Horizontal=�$��0,5,0,0q�.+��� $��R��$��5,0,0,0q�$
��Left=�
���   �$
��Bold"�$��Center=��� $ 5��
���   �
�������$��2q�$��50��$��30��._��� -   $ txtRed��$��0q�
�������
������ $��5,1,5,1q� . $ Center=�$��0,5,0,0q���.  �� $ 5��
���   �
�������$��2q�$��10,0,0,0q�$��50��$��30��._��� -   $ 	txtRedHex��$��0q�
�������
������ $��5,1,5,1q� . $ Center=�$��0,5,0,0q���.  �� $ 
Horizontal=�$��0,5,0,0q�.+��� $��G��$��5,0,0,0q�$
��Left=�
���   �$
��Bold"�$��Center=��� $ 5��
���   �
�������$��2q�$��50��$��30��._��� -   $ txtGreen��$��0q�
�������
������ $��5,1,5,1q� . $ Center=�$��0,5,0,0q���.  �� $ 5��
���   �
�������$��2q�$��10,0,0,0q�$��50��$��30��._��� -   $ txtGreenHex��$��0q�
�������
������ $��5,1,5,1q� . $ Center=�$��0,5,0,0q���.  �� $ 
Horizontal=�$��0,5,0,0q�.+��� $��B��$��5,0,0,0q�$
��Left=�
���   �$
��Bold"�$��Center=��� $ 5��
���   �
�������$��2q�$��50��$��30��._��� -   $ txtBlue��$��0q�
�������
������ $��5,1,5,1q� . $ Center=�$��0,5,0,0q���.  �� $ 5��
���   �
�������$��2q�$��10,0,0,0q�$��50��$��30��._��� -   $ 
txtBlueHex��$��0q�
�������
������ $��5,1,5,1q� . $ Center=�$��0,5,0,0q���.  �� $ 
Horizontal=�$��0,5,0,0q�.+��� $ 5��$��22,0,0,0q�
�������
���   �$��2q�$	��112��$��30��._��� -   $ txtAll��$��0q�
�������
������ $��5,1,5,1q� . $ Center=�$��0,5,0,0q���.  �� -    ��Name$ AlphaBorder��$��2��$��2��
���   �$��40��$��2q�$ 5��$��	10,5,10,5q�._��� -    ��Name$ AlphaSlider�� �� Orientation$ 
Horizontal=� � Minimum$ 0Q� � Maximum$	 255Q� � SmallChange$ 1Q�  � LargeChange$  25Q�$��Center=�$��5q�! � Value$	! 255Q�