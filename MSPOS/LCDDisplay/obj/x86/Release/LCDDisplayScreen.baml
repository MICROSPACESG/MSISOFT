   M S B A M L   `   `   `  ���� E  ALCDDisplay, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:DataGridNameSpaceDataGridNameSpace  M IWpfPageTransitions, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS<clr-namespace:WpfPageTransitions;assembly=WpfPageTransitionsWpfPageTransitions !    LCDDisplay.LCDDisplayScreen   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     1localclr-namespace:DataGridNameSpace     XpageTransitions<clr-namespace:WpfPageTransitions;assembly=WpfPageTransitions     -     � Title$  LCDDisplayScreen��$	��728��$
��1024�� � WindowStartupLocation$ CenterScreen=����#f68501 � WindowStyle$
 None=�$��14(�.���� .+��� $��20q�$	��970��$��Center=�$��Center=� �� Orientation$ 
Horizontal=�.+��� $	��350�����#f68501.+��  � Orientation$ Vertical=�$��Center=�$��Center=�.+��� -   $��lblCustomerName��$��Microspace Infotech��$	��350��$��20(�
�������
���  ��$��	ExtraBold"�$��Center=�$��Center=�$��Center=�$��50��$y�	Collapsed=��� -   $��imgCustomerLogo��$	��350��$��50��$5��//LCDDisplay;component/Images/LogoNew%20copy.png��$
��Fill=�$y�Hidden=��� .+��� -   $��lblAddress1��$?��947E6 /16,1st Floor, GSR Building, Bangalore Bye Pass Road��$	��350��$��12(�
�������
���  ��$��	ExtraBold"�$��Center=�$��Center=�$��Center=�$��25��$y�	Collapsed=��� -   $��lblAddress2��$��Hosur, Tamilnadu, India��$	��350��$��12(�
�������
���  ��$��	ExtraBold"�$��Center=�$��Center=�$��Center=�$��25��$y�	Collapsed=��� -   $��lblGridTitle��$1��+Name                        Qty   Rate  Amt��$	��350��$��20(����#0d13a5
�������$��	ExtraBold"�$��Center=�$��Center=�$��Center=�$��35��7  1System.Windows.Forms.Integration.WindowsFormsHost  -   $��windowsFormsHost1��$	��350��$	��435��   
Background
 �����   Child. "   DataGridNameSpace.MyDataGrid  -   	gridItems��[ WSystem.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'  !System.Windows.Forms.DataGridView   AutoGenerateColumns .    SelectionMode$ FullRowSelect=�	   EditMode$	 EditOnEnter=�
   RowHeadersBorderStyle$
 Single=�   BackgroundColorU QSystem.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a#  System.Drawing.ColorConverter$ White    	ForeColor$ Black    BorderStyle$
 None=�"  System.Windows.Forms.Control   TabIndex$ 5��   AllowUserToAddRows .     RowHeadersVisible .     ColumnHeadersVisible .     
ScrollBars$ Vertical=�   MultiSelect .  �� $ 
Horizontal=�$
��Left=�.+��� $��
Total Qty:��$��20(����#0d13a5
�������$��	ExtraBold"�$��50��$��Center=��� -	   $��	lblTotQty��$��1��$��65��$��20(����#0d13a5
�������$��	ExtraBold"�$��50��$��Center=��� $��Amount:��$��20(����#0d13a5
�������$��	ExtraBold"�$��50��$��Center=��� -
   $��
lblBillAmt��$
��0.00��$��90��$��20(����#0d13a5
�������$��	ExtraBold"�$��50��$��Right=�$��Center=��� -   $��	lblTender��$��Tendered : 100.00��$��20(����#f68501
�������$��	ExtraBold"�$��35��$��Center=�$��Center=�$	��350���� -   $��	lblRefund��$��Change Due : 0.00��$��16(����#f68501
�������$��	ExtraBold"�$��35��$��Center=�$��Center=�$	��350���� -   $��btnClose��$
��Left=�$��	0,-70,0,0q�
������ $��16(�
�������$��	ExtraBold"�$��Close��$��50��$��75���� .+��� $	��615�����#0d13a5$��70��$��Center=�.+��� -   $��canMain�� �� Left$ 0��}�. $	��615�����#0d13a5$��70��$��Center=�.+��� -   $��	tbmarquee��$
��auto��$��70��$��20(����#0d13a5
�������$��	ExtraBold"�$��Center=�$��Center=�$��Center=�$��Center=����� $��60�� �� TextAlignment$ Center=�$��Center=�$��WrapWithOverflow=�Today Offers'  !WpfPageTransitions.PageTransition  -   $��pageTransitionControl��$	��525��$��25q�   TransitionType$ SlideAndFade=��� $ 
Horizontal=�.+��� $ Vertical=�$��Center=�$��	0,-25,0,0q�.+��� $��POS Software Supported By��$	��355��$��20(�
�������$��	ExtraBold"�$��Center=�$��Center=�$��Center=�$��35���� $��www.microspacesoft.com��$	��285��$��20(�
�������$��	ExtraBold"�$��Center=�$��Center=�$��Center=�$��35���� $��	0,-25,0,0q�$	��270��$��50��$5��//LCDDisplay;component/Images/LogoNew%20copy.png��$
��Fill=�