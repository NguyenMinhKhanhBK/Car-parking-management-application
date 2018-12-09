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

namespace QuanLyBaiXe.Resource.BuildingPanel
{
    /// <summary>
    /// Interaction logic for BuildingPanel.xaml
    /// </summary>
    public partial class BuildingPanel : Window
    {
        public BuildingPanel(string station,int building)
        {
            InitializeComponent();
            var vm = new BuildingPanelViewModel();
            vm.StationName = station;
            vm.buildingID = building;
            this.DataContext = vm;
        }
    }
}
