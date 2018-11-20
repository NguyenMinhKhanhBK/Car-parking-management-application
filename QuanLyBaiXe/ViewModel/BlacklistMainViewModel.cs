using QuanLyBaiXe.Model;
using QuanLyBaiXe.Resource.BlackListPanel;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyBaiXe.ViewModel
{
    public class BlacklistMainViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand AddBlackListCommand { get; set; }
        public ICommand EditBlackListCommand { get; set; }
        public ICommand DeleteBlackListCommand { get; set; }
        public ICommand BlackListSelectedCommand { get; set; }
        #endregion COMMAND

        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }
        private ObservableCollection<BlackListModel> _blackList;
        public ObservableCollection<BlackListModel> Blacklist { get => _blackList; set { _blackList = value; OnPropertyChanged(); } }

        private bool _IsEditButtonEnable;
        public bool IsEditButtonEnable { get => _IsEditButtonEnable; set { _IsEditButtonEnable = value; OnPropertyChanged(); } }

        private BlackListPerson _selectedPerson;
        public BlackListPerson SelectedPerson { get => _selectedPerson; set { _selectedPerson = value; OnPropertyChanged(); } }

       

        public BlacklistMainViewModel()
        {
            SelectedPerson = new BlackListPerson();
            Blacklist = new ObservableCollection<BlackListModel>();
           

            Blacklist = GetBlacklistData();
            IsEditButtonEnable = false;
            AddBlackListCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Button a = p as Button; OpenAddPanel(a); });
            EditBlackListCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Button a = p as Button; OpenEditPanel(a); });
            DeleteBlackListCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Button a = p as Button; OpenDeletePanel(a); });
            BlackListSelectedCommand = new RelayCommand<object>((p) => { return true; }, (p) => { ListView a = p as ListView; ListViewSelected(a); });

            EventSystem.Subscribe<BlackListPerson>(personChanged);
        }

        void OpenAddPanel(Button a)
        {
            a.Opacity = 0.5;
            BlacklistPanel panel = new BlacklistPanel();
            var point = a.PointToScreen(Mouse.GetPosition(a));
            panel.Left = point.X - panel.Width;
            panel.Top = point.Y;
            panel.ShowDialog();
            a.Opacity = 1;
            Blacklist = GetBlacklistData();
        }

        void OpenEditPanel(Button a)
        {
            a.Opacity = 0.5;
            BlacklistEditPanel panel = new BlacklistEditPanel(SelectedPerson);
            var point = a.PointToScreen(Mouse.GetPosition(a));
            panel.Left = point.X - panel.Width;
            panel.Top = point.Y;
            panel.ShowDialog();
            a.Opacity = 1;
            Blacklist = GetBlacklistData();
        }

        void OpenDeletePanel(Button a)
        {
            a.Opacity = 0.5;
            BlackListDeletePanel panel = new BlackListDeletePanel(SelectedPerson.ID);
            var point = a.PointToScreen(Mouse.GetPosition(a));
            panel.Left = point.X - panel.Width;
            panel.Top = point.Y;
            panel.ShowDialog();
            a.Opacity = 1;
            Blacklist = GetBlacklistData();
        }

        void ListViewSelected(ListView a)
        {
            
            var _tempSelectedPerson = a.SelectedItem as BlackListModel;
            if(_tempSelectedPerson!=null)
            {
                SelectedPerson.ID = _tempSelectedPerson.ID;
                SelectedPerson.Name = _tempSelectedPerson.Name;
                SelectedPerson.LicensePlate = _tempSelectedPerson.LicensePlate;
                SelectedPerson.PhoneNumber = _tempSelectedPerson.PhoneNumber;
                if (!IsEditButtonEnable) IsEditButtonEnable = true;
            }
            
            

        }


        public void personChanged(BlackListPerson msg)
        {
            using (CarParkingLotEntities data = new CarParkingLotEntities())
            {
                switch (msg.CommandType)
                {
                    case 1: //Add command
                        {
                            data.BlackLists.Add(new BlackList() { DisplayName = msg.Name, LicensePlate = msg.LicensePlate, PhoneNumber = msg.PhoneNumber });
                            data.SaveChanges();
                            break;
                        }
                    case 2:
                        {
                            var a = data.BlackLists.Where(p => p.ID == msg.ID).FirstOrDefault();
                            if (a!=null)
                            {
                                a.DisplayName = msg.Name;
                                a.LicensePlate = msg.LicensePlate;
                                a.PhoneNumber = msg.PhoneNumber;
                                data.SaveChanges();
                            }
                            
                            break;
                        }
                    case 3:
                        {
                            var a = data.BlackLists.Where(p => p.ID == msg.ID).FirstOrDefault();
                            if(a!=null)
                            {
                                data.BlackLists.Remove(a);
                                data.SaveChanges();
                            }
                            break;
                        }
                }
            }

        }


        ObservableCollection<BlackListModel> GetBlacklistData()
        {
            ObservableCollection<BlackListModel> templist = new ObservableCollection<BlackListModel>();
            using (CarParkingLotEntities data = new CarParkingLotEntities())
            {
                var rawdata = data.BlackLists.ToList();
                int index = 1;
                foreach (var item in rawdata)
                {
                    var model = new BlackListModel();
                    model.STT = index++;
                    model.ID = item.ID;
                    model.Name = item.DisplayName;
                    model.PhoneNumber = item.PhoneNumber;
                    model.LicensePlate = item.LicensePlate;
                    templist.Add(model);
                }
                return templist;
            }
        }




    }
}

