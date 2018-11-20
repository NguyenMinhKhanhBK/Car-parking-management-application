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
    public class BlacklistPanelViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand MoveCommand { get; set; }
        public ICommand AcceptCommand { get; set; }
        public ICommand CancelCommand { get; set; }
        #endregion COMMAND


        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }

        private BlackListPerson _person;
        public BlackListPerson Person { get=>_person; set { _person = value;OnPropertyChanged(); } }




        public BlacklistPanelViewModel()
        {
            Person = new BlackListPerson();
            MoveCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.DragMove(); });
            AcceptCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Accept(p as Window); });
            CancelCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.Close(); });
        }

        void Accept(Window a)
        {
            Person.CommandType = 1;
            EventSystem.Publish<BlackListPerson>(Person);
            a.Close();
        }

    }
}

