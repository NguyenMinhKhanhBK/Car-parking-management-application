using Microsoft.Maps.MapControl.WPF;
using QuanLyBaiXe.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QuanLyBaiXe
{
    /// <summary>
    /// Interaction logic for BingMap.xaml
    /// </summary>
    public partial class BingMap : Window
    {
        public BingMap()
        {
            InitializeComponent();
            Bingmap.Focus();
            this.DataContext = new BingMapViewModel();
           
        }

       
        
    }
}
