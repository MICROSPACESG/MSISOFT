   M S B A M L   `   `   `  ����E  ALCDDisplay, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:DataGridNameSpaceDataGridNameSpace  5   	   M IWpfPageTransitions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:WpfPageTransitions;assembly=WpfPageTransitionsWpfPageTransitions 5   	   !    LCDDisplay.LCDDisplayScreen   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   1localclr-namespace:DataGridNameSpace     5   	   XpageTransitions<clr-namespace:WpfPageTransitions;assembly=WpfPageTransitions     5   	   -   5          � Title$  LCDDisplayScreen��5   	   $	��728��6"   $
��1024��6/    � WindowStartupLocation$ CenterScreen=�5   	   ���#f68501 � WindowStyle$
 None=�5   	   $��14(�6   .��5	      �� .+�5
   
   �� $��20q�6   $	��970��6!   $��Center=�6-   $��Center=�6J    �� Orientation$ 
Horizontal=�6e   .+�5      �� $	��350��6   ���#f68501.+�5      �  � Orientation$ Vertical=�6   $��Center=�63   $��Center=�6N   .+�5      �� -   5        $��lblCustomerName��5   �   $��Microspace Infotech��6   $	��350��6;   $��20(�6G   
�������
���  ��$��	ExtraBold"�6y   $��Center=�6�   $��Center=�6�   $��Center=�6�   $��50��6�   $y�	Collapsed=�6  �� 5      -   5        $��imgCustomerLogo��5      $	��350��63   $��50��6?   $5��//LCDDisplay;component/Images/LogoNew%20copy.png��6K   $
��Fill=�6�   $y�Hidden=�6�   �� 5      .+�5      �� -   5        $��lblAddress1��5   "  $?��947E6 /16,1st Floor, GSR Building, Bangalore Bye Pass Road��6    $	��350��6e   $��12(�6q   
�������
���  ��$��	ExtraBold"�6�   $��Center=�6�   $��Center=�6�   $��Center=�6�   $��25��6  $y�	Collapsed=�65  �� 5      -   5        $��lblAddress2��5      $��Hosur, Tamilnadu, India��6    $	��350��6C   $��12(�6O   
�������
���  ��$��	ExtraBold"�6�   $��Center=�6�   $��Center=�6�   $��Center=�6�   $��25��6�   $y�	Collapsed=�6  5      �� 5      -   5        $��lblGridTitle��5     $1��+Name                        Qty   Rate  Amt��6   $	��350��6S   $��20(�6_   ���#0d13a5
�������$��	ExtraBold"�6�   $��Center=�6�   $��Center=�6�   $��Center=�6�   $��35��6  6  7  1System.Windows.Forms.Integration.WindowsFormsHost  5      -   5        $��windowsFormsHost1��5   (   $	��350��6A   $	��435��6M      
Background
 �����   Child. 5      "   DataGridNameSpace.MyDataGrid  -   5        	gridItems��[ WSystem.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'  !System.Windows.Forms.DataGridView   AutoGenerateColumns .    SelectionMode$ FullRowSelect=�5   Y   	   EditMode$	 EditOnEnter=�6x   
   RowHeadersBorderStyle$
 Single=�6�      BackgroundColorU QSystem.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a#  System.Drawing.ColorConverter$ White 6�      	ForeColor$ Black 6�      BorderStyle$
 None=�6�   "  System.Windows.Forms.Control   TabIndex$ 5��6�      AllowUserToAddRows .     RowHeadersVisible .     ColumnHeadersVisible .     
ScrollBars$ Vertical=�6M     MultiSelect .  5      5      �� 5      $ 
Horizontal=�6!   $
��Left=�6:   .+�5      �� $��
Total Qty:��6!   $��20(�68   ���#0d13a5
�������$��	ExtraBold"�6n   $��50��6�   $��Center=�6�   �� 5      -	   5        $��	lblTotQty��5   �   $��1��6!   $��65��6.   $��20(�69   ���#0d13a5
�������$��	ExtraBold"�6o   $��50��6�   $��Center=�6�   6�   �� 5      $��Amount:��6!   $��20(�65   ���#0d13a5
�������$��	ExtraBold"�6k   $��50��6�   $��Center=�6�   �� 5      -
   5        $��
lblBillAmt��5   �   $
��0.00��6!   $��90��61   $��20(�6<   ���#0d13a5
�������$��	ExtraBold"�6r   $��50��6�   $��Right=�6�   $��Center=�6�   6�   5       �� 5!      -   5        $��	lblTender��5!   �   $��Tendered : 100.00��6   $��20(�6;   ���#f68501
�������$��	ExtraBold"�6q   $��35��6�   $��Center=�6�   $��Center=�6�   $	��350��6�   6�   �� 5"      -   5        $��	lblRefund��5"   �   $��Change Due : 0.00��6   $��16(�6;   ���#f68501
�������$��	ExtraBold"�6q   $��35��6�   $��Center=�6�   $��Center=�6�   $	��350��6�   6�   �� 5#      -   5        $��btnClose��5#   �   $
��Left=�6   $��	0,-70,0,0q�68   
������ $��16(�6e   
�������$��	ExtraBold"�6�   $��Close��6�   $��50��6�   $��75��6�   6�   5$      5&      �� 5'      .+�5)      �� $	��615��6   ���#0d13a5$��70��6;   $��Center=�6G   .+�5*      �� -   5        $��canMain��5*   B    �� Left$ 0��6   }�. $	��615��6Q   ���#0d13a5$��70��6s   $��Center=�6   .+�5,      �� -   5        $��	tbmarquee��5,     $
��auto��6!   $��70��6.   $��20(�6;   ���#0d13a5
�������$��	ExtraBold"�6q   $��Center=�6�   $��Center=�6�   $��Center=�6�   $��Center=�6�   ��5-      �� 5.   "   $��60��6,    �� TextAlignment$ Center=�68   $��Center=�6O   $��WrapWithOverflow=�6j   Today Offers6�   50      51      53      '  !WpfPageTransitions.PageTransition  56      -   5        $��pageTransitionControl��56   1   $	��525��6N   $��25q�6[      TransitionType$ SlideAndFade=�6g   �� 57      $ 
Horizontal=�6   .+�58      �� $ Vertical=�6!   $��Center=�68   $��	0,-25,0,0q�6U   .+�59      �� $��POS Software Supported By��6   $	��355��6=   $��20(�6I   
�������$��	ExtraBold"�6k   $��Center=�6�   $��Center=�6�   $��Center=�6�   $��35��6�   �� 5:      $��www.microspacesoft.com��6    $	��285��6B   $��20(�6N   
�������$��	ExtraBold"�6p   $��Center=�6�   $��Center=�6�   $��Center=�6�   $��35��6�   5;      �� 5<      $��	0,-25,0,0q�6   $	��270��60   $��50��6<   $5��//LCDDisplay;component/Images/LogoNew%20copy.png��6H   $
��Fill=�6�   5=      5O      5P      5R      5S      