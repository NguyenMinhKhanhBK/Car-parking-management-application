   M S B A M L   `   `   `  ����F  BQuanLyBaiXe, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullW0clr-namespace:QuanLyBaiXe.Resource.Grid_Occupied"QuanLyBaiXe.Resource.Grid_Occupied  5   	   6    0QuanLyBaiXe.Resource.Grid_Occupied.OccupiedPanel   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5   
   :d2http://schemas.microsoft.com/expression/blend/2008  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   <local0clr-namespace:QuanLyBaiXe.Resource.Grid_Occupied  5   	   -   5        $��occupiedPanel��5      $	��400��5   	   $	��250��5	        � AllowsTransparency  . 
������  � Title$ AvailablePanel��5       � WindowStyle$
 None=�5      .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ MouseLeftButtonDown��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *MoveCommand+   CommandParameter 6D   ��  �� ElementName$ occupiedPanel��5      .��5      �� ���	#FFAAAAAA	 �� CornerRadius$	 15��6$   ._�5   
   �� $��
10 10 10 5q�6   .+�5      ]� .+�5      �� $
��Left=�5      $��25(�5      $��	Vị trí��5      �� 5      $��Right=�5       $��Right=�5!      $��25(�5"      ���	#FF4B00FF��5#      �� 
 �� Path$
 posID�61   5$      ]� 5%      .+�5&      �� $
��Left=�5'      $��25(�5(      $��Trạng thái��5)      �� 5*      $��Right=�5+      $��Right=�5,      $��25(�5-      $��Đang có xe��5.      ���	#FF4B00FF6'   5/      ]� 50      .+�51      �� $
��Left=�52      $��25(�53      $��Khách hàng��54      �� 55      $��Right=�56      $��Right=�57      $��25(�58      ���	#FF4B00FF��59      �� *customerPhoneNumber+6:   5:      ]� 5;      .+�5<      �� $
��Left=�5=      $��25(�5>      $��Biển số��5?      �� 5@      $��Right=�5A      $��Right=�5B      $��25(�5C      ���	#FF4B00FF��5D      �� *plateNumber+62   5E      �� 5F      $��0 10 0 5q�6   
�������
�������6>   �� 5G      -   5        $��checkboxBaoTri��5G      $��25(�6-      MaterialDesignCheckBox#��[  6;   $��Center=�6k   .��6�   
Xe ra bãi6�   A� 5H      $	��0 7q�6    A� Rows$ 1��6'    A� Columns$ 2��60   .+�5I      �� $��Center=�6   $	��130��5K       " MaterialDesignRaisedDarkButton#��[ 5L       � ToolTip$8 2Resource name: MaterialDesignRaisedLightDarkButton��5O      {�5J      �� $ checkboxBaoTri��$
 	IsChecked���5M      �� *AcceptCommand+��5N      �� $ occupiedPanel��.��5O   R   
Đồng ý5Q      �� 5R      $��Center=�6   $	��130��5S      #��[ 5T      $8 2Resource name: MaterialDesignRaisedLightDarkButton��5W      ���	#FFFFA200���	#FFFFA200��5U      �� *CancelCommand+��5V      �� $ occupiedPanel��.��5W   �   Huỷ5Y      5[      5\      5]      5_      