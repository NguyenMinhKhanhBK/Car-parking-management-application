using QuanLyBaiXe.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Threading;

namespace QuanLyBaiXe.ViewModel
{
    public class MainViewModel : BaseViewModel
    {
        public CurrentCustomerViewModel CustomerList { get; set; }
        private CurrentStatus _positionStatus;
        public CurrentStatus PositionStatus { get=>_positionStatus; set { _positionStatus = value;OnPropertyChanged(); } }


        private List<ParkingLayout> _parkingLayout;
        public List<ParkingLayout> parkingLayout { get => _parkingLayout; set { _parkingLayout = value; OnPropertyChanged(); } }

        

        //Timer to update data periodly
        DispatcherTimer Timer = new DispatcherTimer();

        #region COMMAND
        public ICommand MainTabControlSelectionChanged { get; set; }
        #endregion COMMAND


        public MainViewModel()
        {
            CustomerList = new CurrentCustomerViewModel();
            parkingLayout = new List<ParkingLayout>();
            PositionStatus = new CurrentStatus();

            CustomerList.CurrentPossionInfoList =  GetDataFromSQL();
            PositionStatus = GetCurrentPositionStatus(CustomerList.CurrentPossionInfoList);
            parkingLayout = GetParkingLayout(CustomerList.CurrentPossionInfoList);
            EventSystem.Subscribe<ShareMemory>(ShowNews);

            MainTabControlSelectionChanged = new RelayCommand<object>((p) => { return true; }, (p) => { TabControl a = p as TabControl; TabControlSelectionChanged(a); });

            //Setup timer to expire each two seconds
            Timer.Interval = new TimeSpan(0, 0, 2);
            Timer.Tick += TimerISR;
            Timer.Start();
        }




        //Timer interrupt subroutine
        private void TimerISR(object sender, EventArgs e)
        {
            if (IsItemChanged())
            {
                CustomerList.CurrentPossionInfoList = GetDataFromSQL();
                PositionStatus = GetCurrentPositionStatus(CustomerList.CurrentPossionInfoList);
                parkingLayout = GetParkingLayout(CustomerList.CurrentPossionInfoList);
            }
        }



        

       



        //Return TRUE if SQL data has changed, else return FALSE
        bool IsItemChanged()
        {
            var temp = GetDataFromSQL();
            foreach (var item in temp)
            {
                var a = CustomerList.CurrentPossionInfoList.Where(p => p.PosID == item.PosID).FirstOrDefault();
                if (a.Status != item.Status) return true; 
            }
            return false;
        }

        //Get data from SQL
        //Return:
        //         ObservableCollection currentCustomerList

        ObservableCollection<CurrentPositionInfo> GetDataFromSQL()
        {
            ObservableCollection<CurrentPositionInfo> tempCollection = new ObservableCollection<CurrentPositionInfo>();
            using (CarParkingLotEntities SQLData = new CarParkingLotEntities())
            {
                var DataList = SQLData.CarParkingLayouts.Where(p => p.BuildingID == CurrentBlockPosition.BuildingID && p.BlockID == CurrentBlockPosition.BlockID).ToList();
                int index = 1;
                foreach (var item in DataList)
                {
                    CurrentPositionInfo temp = new CurrentPositionInfo();
                    temp.STT = index;
                    temp.PosID = (int)item.PositionID;
                    temp.Status = SQLData.PositionStatus.Where(p => p.ID == item.StatusID).FirstOrDefault().PositionStatus;
                    if (item.ReservedTime != null) temp.ReservedTime = item.ReservedTime;
                    if (item.ArrivalTime != null) temp.ArrivalTime = item.ArrivalTime;

                    if (item.UserID != null)
                    {
                        var UserInfo = SQLData.Users.Where(p => p.ID == item.UserID).FirstOrDefault();
                        temp.DisplayName = UserInfo.DisplayName;
                        temp.LicensePlate = item.LicensePlate;
                        temp.PhoneNumber = UserInfo.Username;
                    }
                    index++;
                    tempCollection.Add(temp);
                }

                return tempCollection;
            }

        }

        CurrentStatus GetCurrentPositionStatus(ObservableCollection<CurrentPositionInfo> collection)
        {
            CurrentStatus temp = new CurrentStatus();
            temp.Available = collection.Where(p => p.Status == "Available").ToList().Count;
            temp.Booked = collection.Where(p => p.Status == "Booked").ToList().Count;
            temp.Occupied = collection.Where(p => p.Status == "Occupied").ToList().Count;
            temp.Maintenance = collection.Where(p => p.Status == "Maintance").ToList().Count;

            return temp;
        }


        List<ParkingLayout> GetParkingLayout(ObservableCollection<CurrentPositionInfo> collection)
        {
            List<ParkingLayout> temp = new List<ParkingLayout>();
            foreach (var item in collection)
            {
                var tempStatus = new ParkingLayout();
                switch(item.Status)
                {
                    case "Available":
                            {
                            tempStatus.IsAvailable = true;
                            tempStatus.IsBooked = tempStatus.IsMaintenance = tempStatus.IsOccupied = false;
                            break;
                            }
                    case "Booked":
                        {
                            tempStatus.IsBooked = true;
                            tempStatus.IsAvailable = tempStatus.IsMaintenance = tempStatus.IsOccupied = false;
                            break;
                        }
                    case "Occupied":
                        {
                            tempStatus.IsOccupied = true;
                            tempStatus.IsAvailable = tempStatus.IsMaintenance = tempStatus.IsBooked = false;
                            break;
                        }
                    case "Maintance":
                        {
                            tempStatus.IsMaintenance = true;
                            tempStatus.IsAvailable = tempStatus.IsOccupied = tempStatus.IsBooked = false;
                            break;
                        }
                }

                temp.Add(tempStatus);
            }
            return temp;
        }

        public void ShowNews(ShareMemory msg)
        {
           if(msg.AvailableToMaintenancePosition>=1 && msg.AvailableToMaintenancePosition<=12)
            {
                using (CarParkingLotEntities data = new CarParkingLotEntities())
                {
                    parkingLayout[msg.AvailableToMaintenancePosition - 1] = new ParkingLayout() { IsAvailable = false, IsBooked = false, IsMaintenance = true, IsOccupied = false };
                    OnPropertyChanged("parkingLayout");
                    var temp = data.CarParkingLayouts.Where(p => p.PositionID == msg.AvailableToMaintenancePosition).FirstOrDefault();
                    if (temp.StatusID == 1) temp.StatusID = 4;
                    data.SaveChanges();
                }
            }

            else if (msg.CancelBookedPosition >= 1 && msg.CancelBookedPosition <= 12)
            {
                using (CarParkingLotEntities data = new CarParkingLotEntities())
                {
                    parkingLayout[msg.CancelBookedPosition - 1] = new ParkingLayout() { IsAvailable = true, IsBooked = false, IsMaintenance = false, IsOccupied = false };
                    OnPropertyChanged("parkingLayout");
                    var temp = data.CarParkingLayouts.Where(p => p.PositionID == msg.CancelBookedPosition).FirstOrDefault();
                    if (temp.StatusID == 2) temp.StatusID = 1;
                    data.SaveChanges();
                }
            }

            else if (msg.FinishMaintenancePosition >= 1 && msg.FinishMaintenancePosition <= 12)
            {
                using (CarParkingLotEntities data = new CarParkingLotEntities())
                {
                    parkingLayout[msg.FinishMaintenancePosition - 1] = new ParkingLayout() { IsAvailable = true, IsBooked = false, IsMaintenance = false, IsOccupied = false };
                    OnPropertyChanged("parkingLayout");
                    var temp = data.CarParkingLayouts.Where(p => p.PositionID == msg.FinishMaintenancePosition).FirstOrDefault();
                    if (temp.StatusID == 4) temp.StatusID = 1;
                    data.SaveChanges();
                    
                }
            }

            else if (msg.OccupiedToAvailablePosition >= 1 && msg.OccupiedToAvailablePosition <= 12)
            {
                using (CarParkingLotEntities data = new CarParkingLotEntities())
                {
                    parkingLayout[msg.OccupiedToAvailablePosition - 1] = new ParkingLayout() { IsAvailable = true, IsBooked = false, IsMaintenance = false, IsOccupied = false };
                    OnPropertyChanged("parkingLayout");
                    var temp = data.CarParkingLayouts.Where(p => p.PositionID == msg.OccupiedToAvailablePosition).FirstOrDefault();
                    if (temp.StatusID == 3) temp.StatusID = 1;
                    data.SaveChanges();

                }
            }
        }

        void TabControlSelectionChanged(TabControl x)
        {
            if (x.SelectedIndex != 0)  Timer.Stop();
            else Timer.Start();
        }
    }
}
