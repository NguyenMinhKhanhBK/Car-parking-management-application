using QuanLyBaiXe.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Threading;

namespace QuanLyBaiXe.ViewModel
{
    public class CurrentCustomerViewModel : BaseViewModel
    {
        private ObservableCollection<CurrentPositionInfo> _currentPossionInfoList;
        public ObservableCollection<CurrentPositionInfo> CurrentPossionInfoList
        {
            get => _currentPossionInfoList;
            set
            {
                _currentPossionInfoList = value;
                OnPropertyChanged();
            }
        }

        //DispatcherTimer timerCus = new DispatcherTimer();
        // private ObservableCollection<CurrentCustomer> _currentCustomerList;
        //  public ObservableCollection<CurrentCustomer> currentCustomerList { get => _currentCustomerList; set { _currentCustomerList = value; OnPropertyChanged(); } }

        public CurrentCustomerViewModel()
        {
            //timerCus.Interval = new TimeSpan(0, 0, 3);
            //timerCus.Tick += UpdateData;
            //timerCus.Start();
            //currentCustomerList = GetDataFromSql();
        }

        

        //private void UpdateData(object sender, EventArgs e)
        //{
        //    var temp = GetDataFromSql();
        //    if (currentCustomerList != temp)
        //    {
        //        currentCustomerList = temp;
        //        RaisePropertyChanged("currentCustomerList");
        //    }
        //}

        //ObservableCollection<CurrentCustomer> GetDataFromSql()
        //{
        //    //DataProvider.Ins.Data.Dispose();
        //    //DataProvider.Ins.Data = new CarParkingLotEntities1();

        //    //ObservableCollection<CurrentCustomer> currentCustomerList1 = new ObservableCollection<CurrentCustomer>();
        //    //var LayoutTableList = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID != 1);
        //    //int i = 0;
        //    //foreach (var item in LayoutTableList)
        //    //{

        //    //    i++;
        //    //    var STT = i;
        //    //    var DisplayName = "";
        //    //    var LicensePlate = "";
        //    //    var Status = DataProvider.Ins.Data.PositionStatus.Where(p => p.ID == item.StatusID).FirstOrDefault().PositionStatus;
        //    //    var Position = item.ID;
        //    //    var PhoneNumber = "";
        //    //    Nullable<DateTime> ReservedTime = null;
        //    //    Nullable<DateTime> ArrivalTime = null;

        //    //    if (item.ReservedTime != null) ReservedTime = (DateTime)item.ReservedTime;
        //    //    if (item.ArrivalTime != null) ArrivalTime = (DateTime)item.ArrivalTime;

        //    //    if (item.UserID != null)
        //    //    {
        //    //        var UserInfo = DataProvider.Ins.Data.Users.Where(p => p.ID == item.UserID).FirstOrDefault();
        //    //        DisplayName = UserInfo.DisplayName;
        //    //        LicensePlate = item.LicensePlate;
        //    //        PhoneNumber = UserInfo.Username;
        //    //    }

        //    //    CurrentCustomer currentItem = new CurrentCustomer();
        //    //    currentItem.STT = STT;
        //    //    currentItem.PosID = Position;
        //    //    currentItem.DisplayName = DisplayName;
        //    //    currentItem.LicensePlate = LicensePlate;
        //    //    currentItem.Status = Status;
        //    //    currentItem.PhoneNumber = PhoneNumber;
        //    //    currentItem.ReservedTime = ReservedTime;
        //    //    currentItem.ArrivalTime = ArrivalTime;

        //    //    currentCustomerList1.Add(currentItem);
        //    //}
        //    //return currentCustomerList1;
        //    return null;
            
        //}

    }
}
