using QuanLyBaiXe.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyBaiXe.Resource.FeeEditPanel
{
   public class FeeMessageBoxViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand MoveCommand { get; set; }
        public ICommand ExitCommand { get; set; }
        #endregion

        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }

        public FeeMessageBoxViewModel()
        {
            MoveCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.DragMove(); });
            ExitCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.Close(); });
        }

       

    }
}
