   M S B A M L   `   `   `  ����R  NTimerzyanov_autoservice, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:Timerzyanov_autoserviceTimerzyanov_autoservice  5      )    #Timerzyanov_autoservice.ServicePage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      7local%clr-namespace:Timerzyanov_autoservice     5        N� Title$  ServicePage��5	      .��5      � .+�5   
   �� -   5        $��ServiceListView��5      ��5      �� 5      .R�5      �  � ColumnDefinitions 5      �� 5      61   �� 5      61    � RowDefinitions 5      �� 5      $��50 �6,   �� 5      $��* �6,   �� 5      $��* �6,   �� 5      $��* �6,   5      5      5      �� 5   
   $	��100��6   $��0��6   $��UniformToFill=�6,   $��Center=�6D   ��5       �� 5!       �� Path$ MainImagePath�6    �� TargetNullValue 5"      ��5#      Resources/service_logo.png��5%      5'      5)      �� 5*   
   $��1��6+   $��0��6;   $
��Left=�6H   $��20(�6c   $
��Wrap=�6q   ��6   �� *Title+6�   �� 5+   
   $��1��6*   $��1��6:   $
��Left=�6G   $��20(�6b   ��6   �� *Cost+6r   �� 5,   
   $��1��6.   $��1��6>   $��Right=�6K   $��20(�6g   ��6   �� *
Duration+6w   �� 5-   
   $��1��6.   $��2��6>   $
��Left=�6K   $��16(�6f   ��6   �� *
Discount+6v   5.      5/      