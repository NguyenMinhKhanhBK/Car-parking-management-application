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
    /// Interaction logic for FeeMessageBox.xaml
    /// </summary>
    public partial class FeeMessageBox : Window
    {
        public FeeMessageBox()
        {
            InitializeComponent();
            this.DataContext = new FeeMessageBoxViewModel();
        }
    }
}
