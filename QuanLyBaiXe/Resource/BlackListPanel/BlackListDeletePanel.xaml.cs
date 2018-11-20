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

namespace QuanLyBaiXe.Resource.BlackListPanel
{
    /// <summary>
    /// Interaction logic for BlackListDeletePanel.xaml
    /// </summary>
    public partial class BlackListDeletePanel : Window
    {
        public BlackListDeletePanel(long personID)
        {
            InitializeComponent();
            var deleteVM = new BlackListDeletePanelViewModel();
            deleteVM.PersonID = personID;
            this.DataContext = deleteVM;

        }
    }
}
