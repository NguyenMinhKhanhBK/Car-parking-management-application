using Microsoft.Maps.MapControl.WPF;
using QuanLyBaiXe.Resource.BuildingPanel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;

namespace QuanLyBaiXe.ViewModel
{
    public class BingMapViewModel : BaseViewModel
    {

     

        private bool _isPanelClosed;
        public bool IsPanelClosed { get=> _isPanelClosed; set { _isPanelClosed = value;OnPropertyChanged(); } }
        private ListViewItem _selectedItem;
        public ListViewItem selectedItem { get=> _selectedItem; set { _selectedItem = value;OnPropertyChanged(); } }

        public ICommand ShowPanelCommand { get; set; }
        public ICommand SelectionChangedCommand { get; set; }

        public BingMapViewModel()
        {

            selectedItem = new ListViewItem();
            ShowPanelCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Pushpin a = p as Pushpin;  if (a != null) ShowPanel(a);  });
            SelectionChangedCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Map a = p as Map; if (a != null) ShowPanelListView(a); });

        }

       void ShowPanel(Pushpin a)
        {
           
            string Station = a.Tag.ToString();
            BuildingPanel panel = new BuildingPanel(Station);

            var point = a.PointToScreen(Mouse.GetPosition(a));
            panel.Left = point.X - panel.Width;
            panel.Top = point.Y;

            a.Background = Brushes.Green;
            panel.ShowDialog();
          
            a.Background = (Brush) new BrushConverter().ConvertFrom("#FFE56910");
           
           
        }
         
       void ShowPanelListView(Map a)
        {
            
            //string Station = a.Tag.ToString();
            //BuildingPanel panel = new BuildingPanel(Station);

            //var point = a.PointToScreen(Mouse.GetPosition(a));
            //panel.Left = point.X - panel.Width;
            //panel.Top = point.Y;

            //a.Background = Brushes.Green;
            //panel.ShowDialog();

            //a.Background = (Brush)new BrushConverter().ConvertFrom("#FFE56910");
            var pushPinList = a.Children;
            foreach (var item in pushPinList)
            {
                Pushpin temp = item as Pushpin;
                if(temp.Tag.ToString() == selectedItem.Tag.ToString())
                {
                    //BuildingPanel panel = new BuildingPanel(temp.Tag.ToString());
                    //Point point = temp.TransformToAncestor(Application.Current.MainWindow).Transform(new Point(0, 0));
                    //panel.Left = point.X;
                    //panel.Top = point.Y+70;
                    temp.Background = Brushes.Green;
                    //panel.ShowDialog();
                    //temp.Background = (Brush)new BrushConverter().ConvertFrom("#FFE56910");
                }
                else temp.Background = (Brush)new BrushConverter().ConvertFrom("#FFE56910");
            }
        }


     public   void PushpinLeftButtonClicked(object s, MouseButtonEventArgs e)
        {
            e.Handled = true;
            Pushpin a = s as Pushpin;
            if (a!=null)
            {
                string Station = a.Tag.ToString();
                BuildingPanel panel = new BuildingPanel(Station);

                var point = a.PointToScreen(Mouse.GetPosition(a));
                panel.Left = point.X - panel.Width;
                panel.Top = point.Y;

                a.Background = Brushes.Green;
                panel.ShowDialog();

                a.Background = (Brush)new BrushConverter().ConvertFrom("#FFE56910");
            }
        }





    }

    



    public class SelectedLocation
    {
       
    }

    public class BuildingPanelStatus
    {
        public bool IsClosed { get; set; }
    }
}
