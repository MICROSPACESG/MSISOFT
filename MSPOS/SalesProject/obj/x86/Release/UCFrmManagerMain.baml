   M S B A M L   `   `   `  ���� G  CSalesProject, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null+clr-namespace:SalesProjectSalesProject  5clr-namespace:DataGridNameSpaceDataGridNameSpace  #    SalesProject.UCFrmManagerMain   "my1clr-namespace:SalesProject  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     1localclr-namespace:DataGridNameSpace     -   $	��628��$
��1024��$��14(����	#FF003636  � 	Resources     
MyMinimize  ButtonStyle1 �� 
TargetType �� Property �� Value �� 
TargetType ��Name �� CornerRadius J� SnapsToDevicePixels  styleCalendar&   System.Windows.Controls.Calendar5  /System.Windows.Controls.Primitives.CalendarItem  Name  styleDatePicker(  "System.Windows.Controls.DatePicker	 �Name
 � ColumnDefinitions��%�  &	        &	      &	 �     &	     �� �� " ��.���  � �� �� " ��.R��� $ Chrome��
�������$��2q�$ 2��#��z��._��� #��z��#��z����. # z #��z���� "  .���  � �� �� "  .R�(� $	��300��$	��300��.��  $ PART_CalendarItem��#��z��#��z��#��z���� "  .���  � �� �� "  .R�� $	 	PART_Root��
 �� $��* ��� $
��Auto � J� CommandBindings )  #System.Windows.Input.CommandBinding  -      Command# [   J� InputBindings �� 
 �� Key$	 F12�� �� Command# [  .����  �� Orientation$ 
Horizontal=�$��Center=�$��Center=�.+��� $ Vertical=����	#FF004040$	��150��$��Center=�.+��� -   $��btnCashDrawer��#��[ 
������ $��5q�
�������$��	ExtraBold"�$��20(�$��Cash Drawers��$��80��$	��140�� � UseLayoutRounding .   K� ZIndex$ 15�� � DataContext �� �� -   $��btnEndOfDay��#��[ 
������ $��5,0,5,5q�
�������$��	ExtraBold"�$��20(�$��
End Of Day��$��80��$	��140���� -   $��	btnReport��#��[ 
������ $��5,0,5,5q�
�������$��	ExtraBold"�$��20(�$��80��$	��140������ $ Vertical=�$��Center=�.+��� $��Center=�
�������$��	ExtraBold"�$��18(�$	��All���� $��Center=�
�������$��	ExtraBold"�$��18(�$��Report���� -   $��btnProfitReport��#��[ 
������ $��5,0,5,5q�
�������$��	ExtraBold"�$��20(�$��80��$	��140������ $ Vertical=�$��Center=�.+��� $��Center=�
�������$��	ExtraBold"�$��18(�$��Datewise���� $��Center=�
�������$��	ExtraBold"�$��18(�$��Report���� -   $��btnIndividualReport��#��[ 
������ $��5,0,5,5q�
�������$��	ExtraBold"�$��20(�$��80��$	��140������ $ Vertical=�$��Center=�.+��� $��Center=�
�������$��	ExtraBold"�$��18(�$��
Individual���� $��Center=�
�������$��	ExtraBold"�$��18(�$��Report���� -   $��btnPaymentReport��#��[ 
������ $��5,0,5,5q�
�������$��	ExtraBold"�$��20(�$��80��$	��140������ $ Vertical=�$��Center=�.+��� $��Center=�
�������$��	ExtraBold"�$��18(�$��Payment���� -	   $��btnFinished��#��[ 
������ $��5,0,5,5q�
�������$��	ExtraBold"�$��20(�$��Finished��$��80��$	��140��]� .+��� $��5q�$	��top=�$
��Left=�
�������$��1,0,0,1q�$ 15��
�������$	��Top=�$	��840��._��� $	��Top=�$
��Left=�$��35��$	��835��.+��� -
   $��lblTitle��$ ��Microspace POS Version 1.0��$��Center=�$��Center=�$��35��$��5q�$��20(�$	��840���� -   $��	pnlCommon��$y�	Collapsed=�$ 
Horizontal=�$	��840��$	��Top=�$
��Left=�.+��� $	��Top=�$ Vertical=�.+��� $��5,0,5,5q�
�������$��1,0,0,1q�$ 20��
�������$	��Top=�._��� $	��415��$	��535��$��Center=�.+��� $	��Top=�$
��Auto=�.���� -   $��listDisplay��$��Center=�$��5,5,5,0q�$��18(�$
��auto������ 7  1System.Windows.Forms.Integration.WindowsFormsHost  -   $��windowsFormsHost1��$	��470��$	��Top=�$��Right=�$	��410��   TabIndex$ 17��   Child. "   DataGridNameSpace.MyDataGrid  -   gridItemsManager��[ WSystem.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'  !System.Windows.Forms.DataGridView   AutoGenerateColumns .    SelectionMode$ FullRowSelect=�   EditMode$ EditOnEnter=�   RowHeadersBorderStyle$ Single=�   BackgroundColorU QSystem.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a#  System.Drawing.ColorConverter$ White    	ForeColor$ Black    BorderStyle$
 None=�"	  System.Windows.Forms.Control 	  TabIndex$ 5��   AllowUserToAddRows .     RowHeadersVisible .      
ScrollBars$  Vertical=�!   MultiSelect! .  "   CellBorderStyle$
" None=��� -   $��btnPrint��#��[ 
��� � �$��Bottom=�$��	ExtraBold"�$��40(�$��	5,-60,5,5q�$��65��$	��420��.���� $ 
Horizontal=�.+��� $5��//SalesProject;component/Images/IconPrinter1.png���� $��0q�
�������.��Print]� -   $��pnlCashDrawer��$	��Top=�$	��415��$	��535��$y�Hidden=�.+��� $	��Top=�
�������$��1,0,0,1q�$ 20��$��30��
�������$	��Top=�$��5,0,5,0q�$	��400��._��� $��25��$	��330��.+��� $ ��CURRENT POS STATION DRAWER��$��30��$��16(�$	��Top=�$	��Top=�$��Center=�
���   ��� $	��Top=�$	��Top=�$��Center=�$	��355��$	��100��.+�� $��95��# � RowDefinitions# �� �� �� 
 �� �� .+��� $��Start Amount��$��Italic$�$��0��$��2q�$��16(�
�������$	��200��$��30��$��0q��� $��Cash In Drawer��$��Italic$�$��1��$��0��$��2q�$��16(�$	��200��
�������$��30��$��0q��� $��
Last Reset��$��Italic$�$��2��$��0��$��16(�$��2q�$	��200��
�������$��30��$��0q��� -   $��lblStartAmt��$
��0.00��$��0��$��1��$��0q�$��2q�$��16(�
�������$��30���� -   $��lblCashInDrawer��$
��0.00��$��1��$��1��$��0q�$��2q�$��16(�
�������$��30���� -   $��lblLastReset��$
��0.00��$��2��$��1��$��0q�$��2q�$��16(�
�������$��30���� $	��Top=�
�������$��1,0,0,1q�$ 20��$��35��
�������$	��Top=�$��5,0,5,0q�$	��405��._��� $��25��$	��395��.+��� $��CURRENT POS STATIONS��$��30��$��16(�$	��Top=�$	��Top=�$��Center=�
���   ��� $	��Top=�$	��Top=�$��Center=�$	��355��$	��160��$ Vertical=�.+�� $	��150��$��0,10,0,0q�# �� �� �� �� �� �� .+��� $��Cash Sales Total��$��Italic$�$��2q�$��16(�
�������$	��170��$��30��$��	4,0,181,0q��� -   $��lblCCashSalesTotal��$
��0.00��$��2q�$��16(�
�������$��30��$��	178,0,0,0q��� $��NETS Sales Total��$��Italic$�$��1��$��2q�$��16(�$	��170��
�������$��30��$��	4,0,181,0q��� -   $��lblCNETSSalesTotal��$
��0.00��$��1��$��
178,0,63,0q�$��2q�$��16(�
�������$��30���� $��Credit Card Sales��$��Italic$�$��2��$��2q�$��16(�$	��170��
�������$��30��$��	4,0,181,0q��� -   $��lblCCreditCardSalesTotal��$
��0.00��$��2��$��
178,0,63,0q�$��2q�$��15(�
�������$��30���� $��House Account Total��$��Italic$�$��3��$��2q�$��16(�$	��170��
�������$��30��$��	4,0,181,0q��� -   $��lblCHouseACSalesTotal��$
��0.00��$��3��$��
178,0,63,0q�$��2q�$��16(�
�������$��30���� $��Voucher Total��$��Italic$�$��4��$��2q�$��16(�$	��170��
�������$��30��$��	4,0,181,0q��� -   $��lblCVoucherSalesTotal��$
��0.00��$��4��$��
178,0,63,0q�$��2q�$��16(�
�������$��30���� $��Salesmen Total��$��Italic$�$��5��$��2q�$��16(�$	��170��
�������$��30��$��	4,0,181,0q��� -   $��lblCSalesmenTotal��$
��0.00��$��5��$��
178,0,63,0q�$��2q�$��16(�
�������$��30���� $	��Top=�$��Center=�$��Bottom=�.+��� -   $��btnBeginCashDrawer��#��[ 
������ $��50��$��20(�
�������$��BEGIN CASH DRAWER��$	��400��$��0,5,0,0q��� -   $��btnCounterSettle��{�.  #��[ 
������ $��50��$��20(�
�������$��SETTLE COUNTER��$	��400��$��0,5,0,0q�� -   $��	pnlReport��$	��top=�$	��420��$	��690��$y�Hidden=�.+��� $ 
Horizontal=�.+��� -   $��cmbCounterName��$��2,0,0,2q�$	��200��$��40��$��25(�  -   $��
dpBillDate��$   CalendarStyle#$ [ $��Center=�$��40��$��10,0,0,2q�$	��195��$��24(�$��Normal&�$��3q�$��1���� -   $��btnCashReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��Cash Report��$��60��$	��200���� -    $��btnNETSReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��NETS Report��$��60��$	��200���� -!   $��btnItemReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��Item Report��$��60��$	��200���� -"   $��btnGroupReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��Group Report��$��60��$	��200���� -#   $��btnDrawerReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��Drawer Start Report��$��60��$	��200���� -$   $��btnEndOfDayReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��EOD Drawer Report��$��60��$	��200���� -%   $��btnVoidReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��Void Report��$��60��$	��200���� -&   $��btnReturnReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��Return Item Report��$��60��$	��200���� -'   $��btnPaymentCollectionRpt��$��2q�$��Payment Collection��
������ $��20(�$��	ExtraBold"�
�������$��60��#��[ $	��200���� -(   $��btnItemExcelExportRpt��$��2q�$��Item Excel Export��
������ $��20(�$��	ExtraBold"�
�������$��60��#��[ $	��200��$y�Visible=��� -)   $��btnEODExcelExportRpt��$��2q�$��EOD Excel Export��
������ $��20(�$��	ExtraBold"�
�������$��60��#��[ $	��200��$y�Visible=��� -*   $��btnTaxReport��$��2q�$��Sales Tax Report��
������ $��20(�$��	ExtraBold"�
�������$��60��#��[ $	��200��$y�Visible=��� -+   $��btnFreeItemReport��$��2q�$��Discount Report��
������ $��20(�$��	ExtraBold"�
�������$��60��#��[ $	��200��$y�Visible=��� -,   $��btnMixedSettlementReport��$��2q�$��Mixed Settlement��
������ $��20(�$��	ExtraBold"�
�������$��60��#��[ $	��200��$y�Visible=��� --   $��btnSalesmenReport��#��[ 
������ $��2q�
�������$��	ExtraBold"�$��20(�$��Salesmen Report��$��60��$	��200��$y�Visible=�� -.   $��pnlProfitReport��$	��top=�$	��420��$	��690��$y�Hidden=�.+��� $ 
Horizontal=�.+��� -/   $��lblFromDate��$
��From��$��30��$��0,20,0,0q�
�������$
��Bold"�$��16(�  -0   $��dpFrom��#$ [ $��Center=�$��45��$��0,20,0,0q�$	��165��$��24(�$��Normal&�$��3q�$��1���� -1   $��	lblToDate��$��To��$��30��$��0,20,0,0q�
�������$
��Bold"�$��16(�  -2   $
��dpTo��#$ [ $��45��$��0,20,0,0q�$	��165��$��24(�$��Normal&�$��3q�% � ContextMenu% �� �� $ 
Horizontal=�.+��� -3   $��lblCashType��$��	Cash Type��$��30��$��0,20,0,0q�
�������$
��Bold"�$��16(��� -4   $��	ComboCash��$��30��& �� SelectedIndex$& 0��$	��130��$��18(�$��0,20,0,0q�.@��� .��ALL�� .��Cash�� .��Nets�� .��House Account�� -5   $��
lblCounter��$��Counter��$��30��$��0,20,0,0q�
�������$
��Bold"�$��16(��� -6   $��ComboCounter��$��30��$	��130��$��18(�$��0,20,0,0q��� -7   $��btnItem��#��[ 
������ $��0,20,0,0q�
�������$��	ExtraBold"�$��16(�$��Itemwise Profit��$��60��$	��200���� -8   $��btnGroup��#��[ 
������ $��0,20,0,0q�
�������$��	ExtraBold"�$��16(�$��Groupwise Profit��$��60��$	��200���� -9   $��btnItemPDFExport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Item PDF Export��$��60��$	��200���� -:   $��btnItemExcelExport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Item Excel Export��$��60��$	��200���� -;   $��btnSalesTaxReport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Sales Tax Report��$��60��$	��200���� -<   $��btnItemwiseTaxReport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Itemwise Tax Report��$��60��$	��200���� -=   $��btnGroupwiseTaxReport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Groupwise Tax Report��$��60��$	��200���� ->   $��btnTotalSalesReport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Total Sales Report��$��60��$	��200���� -?   $��btnItemSalesReport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Sold Item Report��$��60��$	��200���� -@   $��btnGroupWiseReport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Sold Group Report��$��60��$	��200���� -A   $��btnCommissionDetailAll��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Commission Detail��$��60��$	��200���� -B   $��btnHouseAccountDetail��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��House Account Detail��$��60��$	��200���� -C   $��btnCNHReport��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Cash-Nets-HA Report��$��60��$	��200���� -D   $��pnlEndOfDay��$ Vertical=�$��Center=�.+�� $	��450��$	��355��$��Center=�$��Center=�# �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� 
 �� $	��225 ��� $��* �.+��� $��Last End Of Day��$��Italic$�$��0��$��0��
�������$��15(�$��27���� -E   $��lblLastEndOfDay��$��01-01-2014 12:00 AM��$��1��
�������$��15(�$��2��$��27���� $��Cash Sales Count��$��Italic$�$��1��$��0��
�������$��15(�$��27���� -F   $��lblSalesCount��$��0��$��1��$��1��
�������$��15(�$��2��$��27���� $��Cash Sales Total��$��Italic$�$��2��$��0��
�������$��15(�$��27���� -G   $��lblSalesTotal��$
��0.00��$��2��$��1��
�������$��15(�$��2��$��27���� $��NETS Sales Count��$��Italic$�$��3��$��0��
�������$��15(�$��27���� -H   $��lblNetSalesCount��$��0��$��3��$��1��
�������$��15(�$��2��$��27���� $��NETS Sales Total��$��Italic$�$��4��$��0��
�������$��15(�$��27���� -I   $��lblNetSalesTotal��$
��0.00��$��4��$��1��
�������$��15(�$��2��$��27���� $��Credit Card Sales Count��$��Italic$�$��5��$��0��
�������$��15(�$��27���� -J   $��lblCreditCardSalesCount��$��0��$��5��$��1��
�������$��15(�$��2��$��27���� $��Credit Card Sales Total��$��Italic$�$��6��$��0��
�������$��15(�$��27���� -K   $��lblCreditCardSalesTotal��$
��0.00��$��6��$��1��
�������$��15(�$��2��$��27���� $��House Account Sales Count��$��Italic$�$��7��$��0��
�������$��15(�$��27���� -L   $��lblHouseACSalesCount��$��0��$��7��$��1��
�������$��15(�$��2��$��27���� $��House Account Sales Total��$��Italic$�$��8��$��0��
�������$��15(�$��27���� -M   $��lblHouseACSalesTotal��$
��0.00��$��8��$��1��
�������$��15(�$��2��$��27���� $��Voucher Sales Count��$��Italic$�$��9��$��0��
�������$��15(�$��27���� -N   $��lblVoucherSalesCount��$��0��$��9��$��1��
�������$��15(�$��2��$��27���� $��Voucher Sales Total��$��Italic$�$��10��$��0��
�������$��15(�$��27���� -O   $��lblVoucherSalesTotal��$
��0.00��$��10��$��1��
�������$��15(�$��2��$��27���� $��Salesmen Count��$��Italic$�$��11��$��0��
�������$��15(�$��27���� -P   $��lblSalesmenCount��$
��0.00��$��11��$��1��
�������$��15(�$��2��$��27���� $��Salesmen Total��$��Italic$�$��12��$��0��
�������$��15(�$��27���� -Q   $��lblSalesmenTotal��$
��0.00��$��12��$��1��
�������$��15(�$��2��$��27���� $��Transaction Count��$��Italic$�$��13��$��0��
�������$��15(�$��27���� -R   $��lblTransCount��$��0��$��13��$��1��
�������$��15(�$��2��$��27���� $��Subtotal��$��Italic$�$��14��$��0��
�������$��15(�$��27���� -S   $��	lblSubTot��$
��0.00��$��14��$��1��
�������$��15(�$��2��$��27���� $��Discount��$��Italic$�$��15��$��0��
�������$��15(�$��27���� -T   $��lblDiscount��$
��0.00��$��15��$��1��
�������$��15(�$��2��$��27���� $��30��$	��410��
��� � �$��Center=�$ 
Horizontal=�.+��� $��Grand Total��$��Italic$�$��15(�
�������$	��225��$��27��$��Right=�$��Right=��� -U   $��lblGrandTot��$
��0.00��$��15(�
�������$	��150��$��27���� $��60��$��Bottom=�$
��Left=�.+��� -V   $��btnEndOfDayDrawer��#��[ 
���  ��{�. $��60��$
��Left=�$��Bottom=�$��20(�
�������$��RUN END OF DAY��$	��410��� -W   $��pnlIndividualReport��$	��top=�$	��420��$	��690��$y�Hidden=�.+��� $ 
Horizontal=�$��Center=�$��55��.+��� $
��From��$��30��
�������$
��Bold"�$��16(�  -X   $��dtpFrom��#$ [ $��Center=�$��45��$	��165��$��24(�$��Normal&�$��3q�$��1���� $��To��$��30��
�������$
��Bold"�$��16(�  -Y   $��dtpTo��#$ [ $��45��$	��165��$��24(�$��Normal&�$��3q�% �� �� $ 
Horizontal=�.+��� -Z   $��btnCreditCardView��#��[ 
������ $��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$��Credit Card��$��60��$	��132���� -[   $��btnHouseACView��#��[ 
������ $��5,0,0,0q�
�������$��	ExtraBold"�$��16(�$��House Account��$��60��$	��132���� -\   $��btnHACPaymentINDetailRpt��#��[ 
������ $��5,0,0,0q�
�������$��	ExtraBold"�$��16(�$��
Payment-In��$��60��$	��132���� $ 
Horizontal=�.+��� -]   $��btnPaymentOutDetailRptt��#��[ 
������ $��2,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Payment-Out��$��60��$	��132���� -^   $��btnExpenseDetailRpt��#��[ 
������ $��5,2,0,0q�
�������$��	ExtraBold"�$��16(�$��Expenses��$��60��$	��132��]� .+��� -_   $��btnUp��$	��Top=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$��Up��$��60���� -`   ' ��Name$' svBtn��$	��Top=�$��0,5,0,0q�$	��240��$
��Left=�$��Hidden=�$��Hidden=�.���� -a   $��pnlCreditCardList��$ Vertical=��� -b   $��btnDown��$��Bottom=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$
��Down��$��60��$	��400���� -c   $��pnlCounterBtn��
������ $ Vertical=�$	��Top=�$y�	Collapsed=�.+��� $ 
Horizontal=�
������ .+��� $	��420��$ Vertical=�.+�� # �� �� .+��� $��	10,0,10,5q�
������ $��40��$��0��$��Center=�.+��� -d   $��label1��$��5q�
�������$��	ExtraBold"�$��20(�$��ENTER THE COIN TOTAL��$��Center=�$��Center=�$��40���� $��	10,0,10,5q�
������ $��50��$��1��$
��Left=�$��Center=�$ 
Horizontal=�.+��� $��5q�( �� Padding$( 2q�
�������$��1,0,0,1q�$ 15��
�������$	��Top=�$	��300��._��� -e   $��txtCurrency��$��35��$	��290��$��Center=�$��Center=�$��25(�
����  ��� -f   $��btnClear��#��[ 
�������
���  ��$��0,0,5,0q�$��Clear��$��40��$��90���� .+�� $��
10,10,10,0q�# �� �� �� �� 
 �� �� �� .+��� -g   $��btnOne��
������ #��[ $��0��$��0��$��5q�
�������$��	ExtraBold"�$��50(�$��1��$��90��$	��120���� -h   $��btnTwo��
������ #��[ $��1��$��0��$��5q�
�������$��	ExtraBold"�$��50(�$��2��$��90��$	��120���� -i   $��btnThree��#��[ 
������ $��2��$��0��$��5q�
�������$��	ExtraBold"�$��50(�$��3��$��90��$	��120���� -j   $��btnFour��#��[ 
������ $��0��$��1��$��5q�
�������$��	ExtraBold"�$��50(�$��4��$��90��$	��120���� -k   $��btnFive��#��[ 
������ $��1��$��1��$��5q�
�������$��	ExtraBold"�$��50(�$��5��$��90��$	��120���� -l   $��btnSix��#��[ 
������ $��2��$��1��$��5q�
�������$��	ExtraBold"�$��50(�$��6��$��90��$	��120���� -m   $��btnSeven��#��[ 
������ $��0��$��2��$��5q�
�������$��	ExtraBold"�$��50(�$��7��$��90��$	��120���� -n   $��btnEight��#��[ 
������ $��1��$��2��$��5q�
�������$��	ExtraBold"�$��50(�$��8��$��90��$	��120���� -o   $��btnNine��#��[ 
������ $��2��$��2��$��5q�
�������$��	ExtraBold"�$��50(�$��9��$��90��$	��120���� -p   $��btnZero��#��[ 
������ $��0��$��3��$��5q�
�������$��	ExtraBold"�$��50(�$��0��$��90��$	��120���� -q   $��btnEnter��#��[ 
������ $��1��$��3��$��2��$��5q�
�������$��	ExtraBold"�$��50(�$��Enter��$��90��$	��255���� $	��425��$
��Left=�
������ .+��� $	��Top=�
�������$��1,0,0,1q�$ 15��$��30��
�������$	��Top=�$��5,5,10,0q�$	��410��._��� $��25��$	��350��.+��� -r   $��lblCounterTitle��$��RESET DRAWER��$��30��$��16(�$	��Top=�$	��Top=�$��Center=�
���   �� 
 �� $	��130 ��� $	��130 ��� $��* �# �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� .+��� -s   $��lblCashTitle��$��Cash/Coin ($)��$
��Bold"�$��0��$��0��$��28��$��Center=�$��10,5,0,0q�$	��Top=�
��������� -t   $��lblCount��$��Count��$
��Bold"�$��0��$��1��$��28��$��Center=�$��10,5,0,0q�$	��Top=����	#FF3016C1�� -u   $��lblTotal��$��	Total ($)��$
��Bold"�$��0��$��2��$��28��$��Center=�$��10,5,0,0q�$	��Top=�
��������� -v   $��
lblCash100��$��100.00��$��11��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -w   $��txtCount100��$��11��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -x   $��lblTotal100��$
��0.00��$��11��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -y   $��	lblCash50��$��50.00��$��10��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -z   $��
txtCount50��$��10��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -{   $��
lblTotal50��$
��0.00��$��10��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -|   $��	lblCash20��$��20.00��$��9��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -}   $��
txtCount20��$��9��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -~   $��
lblTotal20��$
��0.00��$��9��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -   $��	lblCash10��$��10.00��$��8��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��
txtCount10��$��8��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��
lblTotal10��$
��0.00��$��8��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��lblCash5��$
��5.00��$��7��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��	txtCount5��$��7��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��	lblTotal5��$
��0.00��$��7��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��lblCash2��$
��2.00��$��6��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��	txtCount2��$��6��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��	lblTotal2��$
��0.00��$��6��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��lblCash1��$
��1.00��$��5��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��	txtCount1��$��5��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��	lblTotal1��$
��0.00��$��5��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��
lblCashP50��$
��0.50��$��4��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��txtCountP50��$��4��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��lblTotalP50��$
��0.00��$��4��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��
lblCashP25��$
��0.20��$��3��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��txtCountP20��$��3��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��lblTotalP25��$
��0.00��$��3��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��
lblCashP10��$
��0.10��$��2��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��txtCountP10��$��2��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��lblTotalP10��$
��0.00��$��2��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��
lblCashP05��$
��0.05��$��1��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��txtCountP05��$��1��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��lblTotalP05��$
��0.00��$��1��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��lblCash1000��$��1000.00��$��12��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�
��������� -�   $��txtCount1000��$��12��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120���� -�   $��lblTotal1000��$
��0.00��$��12��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
��������� -�   $��lblCashTotal��$��Total��$��13��$��0��$��28��$��Center=�$��	ExtraBold"�$	��Top=�$��0,10,0,0q�
��������� -�   $��txtCountTotal��{�.  $��13��$��1��$��23��$��Center=�$��Right=�$	��Top=�$	��120�����	#FF1414E2$��0,10,0,0q��� -�   $��lblTotalTotal��$
��0.00��$��13��$��2��$��28��$	��120��$��Center=�$��	ExtraBold"�$��Right=�$	��Top=�
�������$��0,10,0,0q��� -�   $��btnSave��#��[ 
������ $��0,2,0,0q�
�������$��	ExtraBold"�$��20(�$��Submit��$��14��$��3��$��60��$
��Left=�$	��Top=�$	��420���� -�   $��pnlEndOfDayResult��$ Vertical=�$��5,0,20,0q�$y�Hidden=�.+��� -�   $��STPnl1��$ 
Horizontal=�$y�Visible=�$��0,5,0,0q�.+��� -�   #��[ $��Center=�
������ $��60��$��15(�
�������$	��198��$��10,0,0,0q�.���� $ Vertical=�$��Center=�.+��� $��0q�
�������$��Italic$�$��15(�.��Begin Cash Drawer�� -�   $��lblDisBeginCash��$��0q�
�������$��Center=�.��0.00�� #��[ $��Center=�
������ $��10,0,0,0q�$��60��$��15(�
�������$	��198��.���� $ Vertical=�$��Center=�.+��� $��0q�
�������$��Italic$�$��15(�.��End Cash Drawer�� -�   $��lblDisEndCash��$��0q�
�������$��Center=�.��0.00�� #��[ $��Center=�
������ $��10,0,0,0q�$��60��$��15(�
�������$	��198��.���� $ Vertical=�$��Center=�.+��� $��0q�
�������$��Italic$�$��15(�.��Cash Drawer Status�� -�   $��lblDisStatus��$��0q�
�������$��Center=�.��0.00�� #��[ $��Center=�
������ $��10,0,0,0q�$��60��$��15(�
�������$	��198��.���� $ Vertical=�$��Center=�.+��� $��0q�
�������$��Italic$�$��15(�.��Amount�� -�   $��lblDisRemaining��$��0q�
�������$��Center=�.��0.00�� -�   $��pnlPaymentReport��$	��700��
������ $ Vertical=�$	��Top=�$y�	Collapsed=�.+��� $ 
Horizontal=�.+�� -�   $��pnlCommonPayment��$	��480��) � Orientation$) Vertical=�.+��� -�   $��lblPaymentTitle��$��House Account Payment��$��45��$��Center=�$��Center=�$��20(�$��	ExtraBold"�
��� � ��� -�   $��pnlHouseACPayment��$ Vertical=�$y�	Collapsed=�.+��� $ 
Horizontal=�$��40��.+��� $��Account Name  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��
txtHACName��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Account Code  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��
txtHACCode��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� -�   $��btnAccountCodeLoad��$
��Type��$��16(�$��
ExtraBlack"�
������ 
��� � �$��40��$��85���� $ 
Horizontal=�$��40��.+��� $��Payment Amount: ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��txtHACPaymentAmt��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Account Limit  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��txtHACAccountLimit��
������ $��35��$	��200��{�. * �� 
IsReadOnly* . 
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Balance Due  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��txtHACBalanceDue��
������ $��35��$	��200��{�. * . 
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� .+��� $��Available Cr Limit:��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� $��(INC Openning) ��$	��190��$��25��$��Center=�$��	0,-15,0,0q�$��10(�$��	ExtraBold"�
��������� -�   $��txtHACAvailableCredit��
������ $��35��$	��200��{�. * . 
�������$��Center=�$��Center=�$��16(��� -�   $��pnlSupplierPayment��$ Vertical=�$y�Hidden=�$��0,-200q�.+��� $ 
Horizontal=�$��40��.+��� $��Supplier Name: ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��
txtSupName��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Supplier Code: ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��
txtSupCode��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� -�   $��btnSupplierCodeLoad��$
��Type��$��16(�$��
ExtraBlack"�
������ 
��� � �$��40��$��85���� $ 
Horizontal=�$��40��.+��� $��Payment Amount: ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��txtSupplierPaymentAmt��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Balance Due  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��txtSupplierBalanceDue��
������ $��35��$	��200��{�. * . 
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Balance Amount  : ��$	��190��$��35��$��Right=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $ ��txtSupplierAvailableCredit��
������ $��35��$	��200��{�. * . 
�������$��Center=�$��Center=�$��16(��� -�   $��pnlExpansesDisplay��$ Vertical=�$y�	Collapsed=�$	��380��$	��480��$��0,-240q�.+��� $ 
Horizontal=�$��40��.+��� $��Expencess Type  : ��$	��190��$��35��$
��Left=�$��Center=�$��20(�$��	ExtraBold"�
��������� -�   $��
txtExpType��
������ $��35��$	��200��{�. * . 
�������$��Center=�$��Center=�$��16(��� $ 
Horizontal=�$��40��.+��� $��Amount              : ��$	��190��$��35��$
��Left=�$��Stretch=�$��20(�$��	ExtraBold"�
��������� -�   $��
txtExptAmt��
������ $��35��$	��200��
�������$��Center=�$��Center=�$��16(��� $	��415��$	��185��$��Center=�.+��� $$��Counter Payment Amount Details��$��28��$��Center=�
���2�2�$��	ExtraBold"�$��16(��� $	��Top=�$
��Auto=�.���� -�   $��listDisplay1��$��Center=�$��5,5,5,0q�$��18(�$
��auto������   -�   $��windowsFormsHost2��$	��140��$	��Top=�$��Center=�$	��410��$ 17��.   -�   gridPayment�� . $ FullRowSelect=�$ EditOnEnter=�$ Single=�$ White $ Black $
 None=�$ 5�� .   .  $  Vertical=�! .  $
" None=�+   AutoSizeColumnsMode$
+ Fill=�,   ReadOnly, . ]� $	��470��.+��� -�   $��
btnHACPrev��$
��Left=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$
��PREV��$��70��$��60���� -�   $' svBtnHACLetter��$
��Left=�$��70��$	��345��$
��Left=�$��Hidden=�$��Hidden=�.���� -�   $��pnlPaymentListLetter��$ 
Horizontal=��� -�   $��
btnHACNext��$��Right=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$
��NEXT��$��70��$��60���� .+��� $ Vertical=�.+��� $ 
Horizontal=�.+��� .+��� -�   $��btnPaymentIn��#��[ 
������ $��Center=�$��Center=�$��0��$��Heavy"�$��0��$��60��$	��125��$��20(�$��Center=�
�������$��9��.���� $
��Wrap=�- �� TextAlignment$- Center=�$��20(�
Payment IN�� -�   $��btnPaymentOut��#��[ 
������ $��Center=�$��Center=�$��0��$��Heavy"�$��0��$��60��$	��125��$��20(�$��Center=�
�������$��9��.���� $
��Wrap=�$- Center=�$��20(�Payment Out�� -�   $��btnExpenses��#��[ 
������ $��Center=�$��Center=�$��0��$��Heavy"�$��0��$��60��$	��125��$��20(�$��Center=�
�������$��9��.���� $
��Wrap=�$- Center=�$��20(�
Expenses�� -�   $��btnPaymentPrint��#��[ 
������ $��Center=�$��Center=�$��0��$��Heavy"�$��0��$��60��$	��125��$��20(�$��Center=�
�������$��9��.���� $
��Wrap=�$- Center=�$��20(�Print]� .+��� -�   $��btnHACUp��$	��Top=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$��Up��$��60��$	��260���� -�   $' svBtnHAC��$	��Top=�$��0,5,0,0q�$	��118��$
��Left=�$��Hidden=�$��Hidden=�.���� -�   $��pnlPaymentList��$ Vertical=��� -�   $��
btnHACDown��$��Bottom=�#��[ 
���  ��$��2,0,0,0q�
�������$��	ExtraBold"�$��16(�$
��Down��$��60��� $	��390�����	#FF003232
 �� �� �� �� # �� �� �� �� .+��� -�   $��btnOne1��#��[ 
������ $��Center=�$��Stretch=�$��0��$��Heavy"�$��0��$��75��$��95��$��60(�$��1��$��Center=�
�������$��9���� -�   $��btnFour4��#��[ 
������ $��1��$��0��$��Center=�$��Heavy"�$��75��$��95��$��4��$��60(�$��Center=�
�������$��13���� -�   $��	btnSeven7��#��[ 
������ $��2��$��0��$��Center=�$��Heavy"�$��75��$��95��$��7��$��60(�
�������$��16���� -�   $��btnDot��#��[ 
������ $��3��$��0��$��Center=�$��Heavy"�$��75��$��95��$��.��$��60(�$��40,-40,40,0q�
�������$��19���� -�   $��btnTwo2��#��[ 
������ $��0��$��1��$��Center=�$��Heavy"�$��75��$��95��$��2��$��60(�
�������$��10���� -�   $
��Five��#��[ 
������ $��1��$��1��$��Center=�$��75��$��Heavy"�$��95��$��5��$��60(�
�������$��14���� -�   $��	btnEight8��#��[ 
������ $��2��$��1��$��Center=�$��75��$��Heavy"�$��95��$��8��$��60(�
�������$��17���� -�   $��btnZero0��#��[ 
������ $��3��$��1��$��Center=�$��75��$��95��$��Heavy"�$��0��$��60(�
�������$��20���� -�   $��	btnThree3��#��[ 
������ $��0��$��2��$��Heavy"�$��Center=�$��75��$��95��$��3��$��60(�
�������$��12���� -�   $	��Six��#��[ 
������ $��1��$��2��$��Heavy"�$��Center=�$��75��$��95��$��6��$��60(�
�������$��15���� -�   $��btnNine9��#��[ 
������ $��2��$��2��$��Heavy"�$��Center=�$��75��$��95��$��9��$��60(�
�������$��18���� -�   $��btnClearCls��#��[ 
������ $��3��$��2��$��Heavy"�$��Center=�$��75��$��95��$��C��$��60(�
�������$��21���� -�   $��btnCash��#��[ 
������ $��0��$��3��$��Heavy"�$��2��$��Center=�$
��Left=�$��75��$��95��
�������$��24(�$
��Cash��$��25���� -�   $��btnNETS��#��[ 
������ $��1��$��3��$��Heavy"�$��2��$��Center=�$
��Left=�$��75��$��95��
�������$��24(�$
��NETS��$��26���� -�   $��btnCreditCard��#��[ 
������ $��2��$��3��$��Heavy"�$��3��$��Center=�$
��Left=�$��75��$��95��
�������$��24(�$��27��.���� $
��Wrap=�$- Center=�$��20(�Cheque�� -�   $��btnHACEnter��#��[ $��3��
������ $��Heavy"�$��3��$��Center=�$
��Left=�$��75��$��95��
�������$��35(�$��Enter��{�. $y�Visible=�$��30��"
   SalesProject.UCfrmCommission
  -�   . 
 Name$. Uccommission��$��420,-585,0,0q�