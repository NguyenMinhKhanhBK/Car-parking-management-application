   M S B A M L   `   `   `  ����F  BQuanLyBaiXe, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullS.clr-namespace:QuanLyBaiXe.Resource.NotifyPanel QuanLyBaiXe.Resource.NotifyPanel  5      6    0QuanLyBaiXe.Resource.NotifyPanel.CannotFindPanel   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      :local.clr-namespace:QuanLyBaiXe.Resource.NotifyPanel  5      V RMaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=nullFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      -   5        $��CannotFindMessageBox��5      $	��400��5
      $	��140��5        � AllowsTransparency  . 
������  � Title$ AvailablePanel��5       � WindowStyle$
 None=�5       � 
ResizeMode$ NoResize=�6    � WindowStartupLocation$ CenterScreen=�6.   .  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ MouseLeftButtonDown��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *MoveCommand+	   CommandParameter	 6D   �� 
 �� ElementName$
 CannotFindMessageBox��5      .��5      �� 
������� �� CornerRadius$ 15��6$   ._�5   
   �� $��
10 10 10 5q�6   .+�5      �� $��Center=�6    �� Orientation$ 
Horizontal=�66   .+�5      '  !MaterialDesignThemes.Wpf.PackIcon  $��30��5      $��30��5      $��0 0 5 0q�5       $��Center=�5!      $��Center=�5"      $
��Left=�5#      
��� ����  �ControlzEx.PackIconBase`1[[MaterialDesignThemes.Wpf.PackIconKind, MaterialDesignThemes.Wpf, Version=2.5.0.1205, Culture=neutral, PublicKeyToken=null]]   Kind$ Error=�5%      �� 5&      $
��0 20q�5'      $��Center=�5(      $��Center=�5)      $
��Left=�5*      $��20(�5+      $$��Không tìm thấy dữ liệu��5,      5-      �� 5.      $	��130��5/      $��Center=�50      
��� ������	#FFFFA200 "  MaterialDesignRaisedDarkButton#��[  55       � ToolTip$8 2Resource name: MaterialDesignRaisedLightDarkButton��56      ��53      �� *ExitCommand+��54      �� $
 CannotFindMessageBox��.��56   N   Đóng58      59      5:      5<      