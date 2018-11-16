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

namespace QuanLyBaiXe.Resource.Grid_Booked
{
    /// <summary>
    /// Interaction logic for BookedPanel.xaml
    /// </summary>
    public partial class BookedPanel : Window
    {
        public BookedPanel(string posid, string CustomerPhoneNum, string plateNum)
        {
            InitializeComponent();
            BookedPanelViewModel vm = new BookedPanelViewModel();
            this.DataContext = vm;
            vm.posID = posid;
            vm.customerPhoneNumber = CustomerPhoneNum;
            vm.plateNumber = plateNum;
        }
    }
}
