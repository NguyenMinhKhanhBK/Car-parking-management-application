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

namespace QuanLyBaiXe.Resource.FeeEditPanel
{
    /// <summary>
    /// Interaction logic for FeeEditPanel.xaml
    /// </summary>
    public partial class FeeEditPanel : Window
    {
        public FeeEditPanel(int _FeeType)
        {
            InitializeComponent();
            var editVM = new FeeEditPanelViewModel();
            this.DataContext = editVM;
            editVM.feeType = _FeeType;

        }
    }
}
