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
        public FeeEditPanel(int _FeeType,string selectedSession, double selectedPrice)
        {
            InitializeComponent();
            var editVM = new FeeEditPanelViewModel();
            this.DataContext = editVM;
            editVM.feeType = _FeeType;

            if (selectedSession == "Buổi sáng") editVM.session = 0;
            else if (selectedSession == "Buổi chiều") editVM.session = 1;
            else if (selectedSession == "Buổi tối") editVM.session = 2;
            else editVM.session = -1;

            if (selectedPrice != 0) editVM.Fee = selectedPrice.ToString();
            else editVM.Fee = null;
            

        }
    }
}
