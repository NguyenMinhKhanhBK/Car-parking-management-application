using QuanLyBaiXe.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyBaiXe.Resource.NotifyPanel
{
   public class MissingParameterPanelViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand MoveCommand { get; set; }
        public ICommand ExitCommand { get; set; }
        #endregion



        public MissingParameterPanelViewModel()
        {
            MoveCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.DragMove(); });
            ExitCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.Close(); });
        }
    }
}
