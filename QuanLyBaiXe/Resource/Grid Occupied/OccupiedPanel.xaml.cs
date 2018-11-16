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

namespace QuanLyBaiXe.Resource.Grid_Occupied
{
    /// <summary>
    /// Interaction logic for OccupiedPanel.xaml
    /// </summary>
    public partial class OccupiedPanel : Window
    {
        public OccupiedPanel(string posid, string CustomerPhoneNum, string plateNum)
        {
            InitializeComponent();
            OccupiedPanelViewModel vm = new OccupiedPanelViewModel();
            this.DataContext = vm;
            vm.posID = posid;
            vm.customerPhoneNumber = CustomerPhoneNum;
            vm.plateNumber = plateNum;
        }
    }
}
