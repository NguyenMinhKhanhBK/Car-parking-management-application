using MaterialDesignThemes.Wpf;
using Microsoft.Maps.MapControl.WPF;
using QuanLyBaiXe.Model;
using QuanLyBaiXe.Resource.BuildingPanel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Interactivity;
using System.Windows.Media;

namespace QuanLyBaiXe.ViewModel
{
    public class BingMapViewModel : BaseViewModel
    {


        Map bingMap = new Map();
        private bool _isPanelClosed;
        public bool IsPanelClosed { get=> _isPanelClosed; set { _isPanelClosed = value;OnPropertyChanged(); } }
        private ListViewItem _selectedItem;
        public ListViewItem selectedItem { get=> _selectedItem; set { _selectedItem = value;OnPropertyChanged(); } }

        public ICommand ShowPanelCommand { get; set; }
        public ICommand SelectionChangedCommand { get; set; }
        public ICommand BingMapLoaded { get; set; }
        public ICommand CenterCommand { get; set; }

        public BingMapViewModel()
        {

            selectedItem = new ListViewItem();
         
           
            BingMapLoaded = new RelayCommand<object>((p) => { return true; }, (p) => { Grid a = p as Grid; BingMapLoadedCommand(a); });
            CenterCommand = new RelayCommand<object>((p) => { return true; }, (p) => { SetMapCenterLocation(); });

        }

       void SetMapCenterLocation()
        {
            var center = new Location(10.762622, 106.660172);
            var zoomLevel = 12.5;
            bingMap.SetView(center, zoomLevel);

        }


       

     public   void PushpinLeftButtonClicked(object s, MouseButtonEventArgs e)
        {
            e.Handled = true;
            Pushpin a = s as Pushpin;
            if (a!=null)
            {
                var stringData  = a.Tag.ToString().Split('/').ToList();
                string Station = stringData[0];
                string location = stringData[1];
                string Url = stringData[2];

                int buildingID = 0;
                int.TryParse(Regex.Match(a.Name, @"\d+").Value, out buildingID);

                BuildingPanel panel = new BuildingPanel(Station, buildingID);

                var point = a.PointToScreen(Mouse.GetPosition(a));
                panel.Left = point.X - panel.Width;
                panel.Top = point.Y;

                a.Background = Brushes.Green;
                panel.ShowDialog();

                a.Background = (Brush)new BrushConverter().ConvertFrom("#FFE56910");
            }
        }


        public void BingMapLoadedCommand (Grid x)
        {
            using (CarParkingLotEntities data = new CarParkingLotEntities())
            {
                //Read building list 
                var buildingList = data.BuildingInfoes.ToList();

                if (x != null)
                {
                    foreach (var item in x.Children)
                    {
                        //Add station list
                        if (item.GetType() == typeof(StackPanel))
                        {
                            ListView buildingListView = new ListView();
                            buildingListView.SelectionChanged += BuildingListView_SelectionChanged;
                            foreach (var _building in buildingList)
                            {

                                //Stack panel
                                StackPanel panel = new StackPanel();
                                panel.Margin = new Thickness(10,10,10,10);
                                panel.Orientation = Orientation.Horizontal;
                                panel.Tag = "Station"+_building.ID.ToString();
                                //PackIcon
                                PackIcon icon = new PackIcon();
                                icon.Margin = new Thickness(10, 0, 10, 0);
                                icon.VerticalAlignment = VerticalAlignment.Center;
                                icon.Foreground = Brushes.Black;
                                icon.Kind = PackIconKind.CityVariantOutline;

                                //Textblock
                                TextBlock txt = new TextBlock();
                                txt.VerticalAlignment = VerticalAlignment.Center;
                                txt.FontFamily = new FontFamily("Calibri Light");
                                txt.FontSize = 20;
                                txt.Foreground = Brushes.Black;
                                txt.Text = _building.DisplayName;
                                panel.Children.Add(icon);
                                panel.Children.Add(txt);

                                buildingListView.Items.Add(panel);

                            }
                            var _stackPanel = item as StackPanel;
                            _stackPanel.Children.Add(buildingListView);
                        }

                        //Add bing map
                        else if (item.GetType() == typeof(Grid))
                        {
                            Grid bingMapGrid = item as Grid;
                            
                            //  bingMap.CredentialsProvider = new Credentials("NpUDtwXs2DMPzRGfTlQh~mruqYE6mAGHQV5IcMc2LJA~Anzr3pk0HmIGXm8zyikNlzY0zYGdnoMgiQdMkNUqVXXuuvv9vv88o8E_AzOlY9_7");
                            bingMap.CredentialsProvider = new ApplicationIdCredentialsProvider("NpUDtwXs2DMPzRGfTlQh~mruqYE6mAGHQV5IcMc2LJA~Anzr3pk0HmIGXm8zyikNlzY0zYGdnoMgiQdMkNUqVXXuuvv9vv88o8E_AzOlY9_7");
                            bingMap.Background = (Brush)new BrushConverter().ConvertFrom("#FF956363");
                            bingMap.BorderBrush = (Brush)new BrushConverter().ConvertFrom("#FF979797");
                            bingMap.BorderThickness = new Thickness(1);
                            bingMap.Center = new Location(10.762622, 106.660172);
                            bingMap.ZoomLevel = 12.5;
                            bingMapGrid.Children.Add(bingMap);
                            bingMap.Focus();

                            foreach (var _building in buildingList)
                            {
                                CustomPushpin pushpin = new CustomPushpin();
                                pushpin.Name = "Station" + _building.ID.ToString();
                                pushpin.Location = new Location((double)_building.Latitude, (double) _building.Longtitude);
                                pushpin.Tag = _building.DisplayName + '/' + _building.Location + '/' + _building.Url;
                                pushpin.MouseLeftButtonDown += PushpinLeftButtonClicked;
                                

                                //Set tooltip
                                pushpin.stationName = _building.DisplayName;
                                pushpin.location = _building.Location;
                                pushpin.url = _building.Url;

                                ToolTipService.SetToolTip(pushpin, new ToolTip()
                                {
                                    DataContext = pushpin,
                                    Style = Application.Current.Resources["PushPinToolTip"] as Style
                                });

                                bingMap.Children.Add(pushpin);

                                

                            }

                        }
                    }

                }
            }
                

        }

        private void BuildingListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var listView = sender as ListView;
            if(listView!=null)
            {
                var panel = listView.SelectedItem as StackPanel;
                if (panel!=null)
                {
                    foreach (var item in bingMap.Children)
                    {
                        var pushpin = item as CustomPushpin;
                        if (pushpin.Name == panel.Tag.ToString())
                        {
                            pushpin.Background = Brushes.Green;
                            bingMap.AnimationLevel = AnimationLevel.Full;
                            bingMap.SetView(pushpin.Location, 16);
                         //   tooltip.IsOpen = true;
                        }
                        else
                        {
                            pushpin.Background = (Brush)new BrushConverter().ConvertFrom("#FFE56910");
                            
                        }
                            
                    }
                }
            }

        }
    }

    



    public class CustomPushpin:Pushpin
    {
        public string stationName { get; set; }
        public string location { get; set; }
        public string url { get; set; }
    }

    public class BuildingPanelStatus
    {
        public bool IsClosed { get; set; }
    }


}
