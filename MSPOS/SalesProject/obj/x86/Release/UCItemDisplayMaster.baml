   M S B A M L   `   `   `  ���� a  ]PresentationFramework.Aero, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35gJclr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.AeroMicrosoft.Windows.Themes   SalesProject&    SalesProject.UCItemDisplayMaster   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     \themeJclr-namespace:Microsoft.Windows.Themes;assembly=PresentationFramework.Aero       � 	Resources     ScrollBarButton �� 
TargetType �� Property �� Value �� 
TargetType F�Name �� Triggers+   %Microsoft.Windows.Themes.ScrollChrome P� Property P� Value	 �� 
TargetName  ScrollBarThumb
 �� CornerRadius ! HorizontalScrollBarPageButton  VerticalScrollBarPageButton ��Name J� Opacity J� SnapsToDevicePixels � RowDefinitions J� IsMouseOver �� LineUpCommand   ScrollGlyph �� LineDownCommand �� Triggers ]� 
Conditions �� Property �� Value ]� DecreaseRepeatButton �� PageUpCommand ]� IncreaseRepeatButton �� PageDownCommand ]� Thumb J� RenderTransformOrigin �� ScaleX �� ScaleY � ColumnDefinitions  �� LineLeftCommand! �� LineRightCommand" �� PageLeftCommand# �� PageRightCommand$ n�Name��%L  &	        &	 R    &	 �    &	 �    '�� 7    7   7   7  7  7  7   7   7   7   7  7  7  7   7   �� " ��.���  �@�OverridesDefaultStyle . ��  � |� .  ��  � �� .  ��  � �� �� " ��.R�F� $ Arrow��$��Center=�$��Center=�#��z�� P�  �@ ScrollGlyph$ UpArrow=�. ��� $	 Arrow�� � ��" ����-     р�[  z �     z 	P�  �@ ScrollGlyph$ 	DownArrow=�. ��� $	 Arrow�� � ��" ��        р�[     ���-  z 	P�  �@ ScrollGlyph$ 	LeftArrow=�. ��� $	 Arrow�� � ��" ��    ��- � z     � z ��[ 	P�  �@ ScrollGlyph$ 
RightArrow=�. ��� $	 Arrow�� � ��" ��        � z ��- �    ��[ 	�� " n�.���  �@�OverridesDefaultStyle . ��  � �� .  ��  � �� �� " n�.R��� ���	#FF777777$
 2���� " ��.���  �@�OverridesDefaultStyle . ��  � ��
 ���� ��  � |� .  ��  � �� .  ��  � �� �� " ��.R��� #��z��#��z��#��z���� " ��.���  �@�OverridesDefaultStyle . ��  � ��
 ���� ��  � |� .  ��  � �� .  ��  � �� �� " ��.R��� #��z��#��z��#��z���� " ��.���  � �� �	#FF979797��  �@��IsPressAndHoldEnabled .  ��  �@��IsFlicksEnabled .  ��  � ��# � ����  � ��# � r���  � ��# � r���  � ��$ 2q���  � �� �� " ��.R��� $ Bg��$
 2��$��2q�$
 0.75Q�#��z��$��Bottom=�._��  .  �� #��� q��� #��� q�.+��� 8��  ���	#FFCBCBCB#{�z #��Z $ UpArrow=�$	��0,4q��� 8�� ���	#FFCBCBCB$��1��#{�z #��Z $ 	DownArrow=�$	��0,4q� P�  � {� .  . ��� $	 Bg�� � y�$ Hidden=� ]�  ��  �@��Orientation$ Vertical=�/���  � ��$ 30����  � �� �� " ��.R��� $
 4��$��2q�$
 0.75Q�#��z��._��  .  �� $��0.00001* ��� #��� q��� #��� q�.+�]� $��
PART_Track��#{�z ��.  �� 8�� #��Z  �� 8�� #��Z  n� 8�� $ VerticalGripper=�$��2q��� 8�� ���	#FFFFFFFF$��1��#{�z #��Z $ UpArrow=�$ 0.5, 0.5&�z��� $	 1.5Q�$	 1.5Q��� 8�� ���	#FFFFFFFF$��2��#{�z #��Z $ 	DownArrow=�$ 0.5, 0.5&�z��� $	 1.5Q�$	 1.5Q�]�  ��  �@��Orientation$ 
Horizontal=�/���  � ��$
 Auto����  � ��$ 0����  � ��# � ����  � ��# � ����  � �� �� " ��.R��� $ Bg��$
 2��$��2q�$
 0.75Q�#��z��$��Right=�._��  .  �� #��� ���� #��� ��.+��� 8�� ���	#FFCBCBCB#{�z #��Z  $ 	LeftArrow=�$	��4,0q��� 8�� ���	#FFCBCBCB$��1��#{�z #��Z! $ 
RightArrow=�$	��4,0q� P�  � {� .  . ��� $	 Bg�� � y�$ Hidden=�]�  ��  �@��Orientation$ 
Horizontal=�/���  � ��$
 Auto����  � ��$ 0����  � ��# � ����  � ��# � ����  � ��$ 30����  � �� �� " ��.R��� $
 4��$��2q�$
 0.75Q�#��z��._��  .  �� $��0.00001* ��� #��� ���� #��� ��.+�]� $��
PART_Track��#{�z  �� 8��	 #��Z"  �� 8��
 #��Z#  n� $$ Thumb��8�� $ HorizontalGripper=�$��2q��� 8�� ���	#FFFFFFFF$��1��#{�z #��Z  $ 	LeftArrow=�$ 0.5, 0.5&�z��� $	 1.5Q�$	 1.5Q��� 8�� ���	#FFFFFFFF$��2��#{�z #��Z! $ 
RightArrow=�$ 0.5, 0.5&�z��� $	 1.5Q�$	 1.5Q�.���� $��Visible=�$��Hidden=�.��� -   $��UCPnlItemDisplay��$	��300��% � Orientation$% Vertical=�
�������$	��Top=�$
��Left=�