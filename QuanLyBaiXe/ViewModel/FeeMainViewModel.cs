using QuanLyBaiXe.Resource.FeeEditPanel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyBaiXe.ViewModel
{
    public class FeeMainViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand EditFeeCommand { get; set; }
        

        #endregion

        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }

        public FeeMainViewModel()
        {
            EditFeeCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Button a = p as Button; OpenEditFeePanel(a); });
        }

        void OpenEditFeePanel(Button a)
        {
            a.Opacity = 0.5;
            FeeEditPanel panel = new FeeEditPanel();
            var point = a.PointToScreen(Mouse.GetPosition(a));
            panel.Left = point.X - panel.Width;
            panel.Top = point.Y;
            panel.ShowDialog();
            a.Opacity = 1;
        }

       



    }
}

