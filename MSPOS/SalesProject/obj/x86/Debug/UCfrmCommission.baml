   M S B A M L   `   `   `  ����G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:SalesProjectSalesProject  5      "    SalesProject.UCfrmCommission   "my1clr-namespace:SalesProject  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -   5        $	��430��5      $	��700��6+   ���	#FF003636  � 	Resources  5         ButtonStyle1 �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius J� SnapsToDevicePixels  styleCalendar&   System.Windows.Controls.Calendar5  /System.Windows.Controls.Primitives.CalendarItem  Name��%5  &	        &	     �� 5   
   " ��6%   .�5	      ��  � �� 5
      �� 5      " ��6&   .R�5      �� $ Chrome��6!   
�������$��2q�6E   $ 2��6Y   #��z��6j   ._�5      �� #��z��6/   #��z��6r   ��. # z 6�   #��z��6�   5      5      5      5      �� 5   
   "  6&   .�5      ��  � �� 5      �� 5      "  6&   .R�5      (� $	��300��6"   $	��300��5      .��5        $ PART_CalendarItem��6+   #��z��5   #   #��z��5   #   #��z��5   #   5      5!      5#      5$      5%      .��5&      �� -   5        $��pnlGroupCommissionReport��5&   W   $	��top=�6   $	��420��6)   $	��690��65   $y�Visible=�6B   $��0,0,0,0q�6w   .+�5'   
   �� 	 �� Orientation$	 
Horizontal=�6   $��5,0,0,0q�6.   $	��410��6?   .+�5(      �� -   5        $��lblUser��5(      $	��225��6#   $��Center=�6/   $��Select User��6S   $��40��6i   $��0,0,0,0q�6u   
�������$
��Bold"�6�   $��25(�6�   �� 5)      -   5        $��cmbCounterUserName��5)      $��2,0,0,2q�62   $	��165��6C   $��40��6O   $��25(�6[   5*      �� 5+   
   $	 
Horizontal=�6   .+�5,      �� -   5        $��lblCommissionFromDate��5,   A   $
��From��6   $��30��6#   $��0,20,0,0q�6/   
�������$
��Bold"�6q   $��16(�6�   (  "System.Windows.Controls.DatePicker  5-      -   5        $��dpFromCommission��5-   �   
   CalendarStyle#
 [ 6   $��Center=�6H   $��45��6e   $��0,20,0,0q�6q   $	��165��6�   $��24(�6�   $��Normal&�6�   $��3q�6�   $��1��6�   5.      �� 5/      -   5        $��lblCommissionToDate��5/   ?   $��To��6   $��30��6!   $��0,20,0,0q�6-   
�������$
��Bold"�6m   $��16(�6     50      -   5        $��dpToCommission��50   f   #
 [ 6   $��45��6H   $��0,20,0,0q�6T   $	��165��6|   $��24(�6�   $��Normal&�6�   $��3q�6�    � ContextMenu 51      �� 52      54      55      �� 57   
   -	   5        $��btnCommissionReport��57   �   #��[  6   
������ $��0,20,0,0q�6P   
�������$��	ExtraBold"�6v   $��16(�6�   $��Commission Report��6�   $
��Left=�6�   $��60��6�   $	��200��6�   58      �� 59   
   -
   5        $��btnGroupCommissionRpt��59   �   #��[  6   
������ $��210,-60,0,0q�6P   
�������$��	ExtraBold"�6y   $��16(�6�   $��Groupwise Commission��6�   $
��Left=�6�   $��60��6�   $	��200��6�   5:      5;      5<      