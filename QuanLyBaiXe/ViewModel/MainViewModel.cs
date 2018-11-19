using QuanLyBaiXe.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
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


        public MainViewModel()
        {
            CustomerList = new CurrentCustomerViewModel();
            parkingLayout = new List<ParkingLayout>();
            PositionStatus = new CurrentStatus();

            CustomerList.CurrentPossionInfoList =  GetDataFromSQL();
            PositionStatus = GetCurrentPositionStatus(CustomerList.CurrentPossionInfoList);
            parkingLayout = GetParkingLayout(CustomerList.CurrentPossionInfoList);
            
            
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



    }
}
