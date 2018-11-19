using QuanLyBaiXe.Model;
using QuanLyBaiXe.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyBaiXe.Resource.Grid_Occupied
{
    public class OccupiedPanelViewModel:BaseViewModel
    {
        #region COMMAND
        public ICommand MoveCommand { get; set; }
        public ICommand AcceptCommand { get; set; }
        public ICommand CancelCommand { get; set; }
        #endregion

        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }

        private string _customerPhoneNumber;
        public string customerPhoneNumber { get => _customerPhoneNumber; set { _customerPhoneNumber = value; OnPropertyChanged(); } }
        private string _plateNumber;
        public string plateNumber { get => _plateNumber; set { _plateNumber = value; OnPropertyChanged(); } }

        public OccupiedPanelViewModel()
        {
            MoveCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.DragMove(); });
            AcceptCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Accept(p as Window); });
            CancelCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.Close(); });
        }

        void Accept(Window a)
        {
            try
            {
                int posid = int.Parse(posID);
                EventSystem.Publish<ShareMemory>(new ShareMemory { OccupiedToAvailablePosition = posid });
            }
            catch
            {
                MessageBox.Show("Có lỗi xảy ra");
            }
            a.Close();
        }
    }
}
