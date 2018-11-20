using QuanLyBaiXe.Model;
using QuanLyBaiXe.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyBaiXe.Resource.BlackListPanel
{
    public class BlackListEditPanelViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand MoveCommand { get; set; }
        public ICommand AcceptCommand { get; set; }
        public ICommand CancelCommand { get; set; }
        #endregion

        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }

        private BlackListPerson _selectedPerson;
        public BlackListPerson SelectedPerson { get => _selectedPerson; set { _selectedPerson = value; OnPropertyChanged(); } }

        public BlackListEditPanelViewModel()
        {
            SelectedPerson = new BlackListPerson();
            MoveCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.DragMove(); });
            AcceptCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Accept(p as Window); });
            CancelCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.Close(); });
        }

        void Accept(Window a)
        {
            EventSystem.Publish<BlackListPerson>(new BlackListPerson() { CommandType = 2, Name = SelectedPerson.Name, LicensePlate = SelectedPerson.LicensePlate, PhoneNumber = SelectedPerson.PhoneNumber,ID=SelectedPerson.ID });
            a.Close();
        }

    }
}
