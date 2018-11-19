using QuanLyBaiXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Threading;

namespace QuanLyBaiXe.ViewModel
{
    public class CurrentPositionStatusViewModel : BaseViewModel
    {
        private System.Collections.ObjectModel.ObservableCollection<CurrentStatus> _currentStatusList;

        public System.Collections.ObjectModel.ObservableCollection<CurrentStatus> CurrentStatusList { get=> _currentStatusList; set { _currentStatusList = value;OnPropertyChanged(); } }



        // DispatcherTimer timerPos = new DispatcherTimer();
        //private int _Available, _Booked, _Occupied, _Maintenance;
        //private int _preAvailable, _preBooked, _preOccupied, _preMaintenance;

        //private ChartValues<ObservableValue> _currentAvailable;
        //public ChartValues<ObservableValue> currentAvailable { get => _currentAvailable; set { _currentAvailable = value; OnPropertyChanged("available"); } }

        //private ChartValues<ObservableValue> _currentBooked;
        //public ChartValues<ObservableValue> currentBooked { get => _currentBooked; set { _currentBooked = value; OnPropertyChanged(); } }

        //private ChartValues<ObservableValue> _currentOccupied;
        //public ChartValues<ObservableValue> currentOccupied { get => _currentOccupied; set { _currentOccupied = value; OnPropertyChanged(); } }

        //private ChartValues<ObservableValue> _currentMaintenance;
        //public ChartValues<ObservableValue> currentMaintenance { get => _currentMaintenance; set { _currentMaintenance = value; OnPropertyChanged(); } }


        public CurrentPositionStatusViewModel()
        {
                    //_Available = _preAvailable = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID == 1).ToList().Count;
                    //currentAvailable = new ChartValues<ObservableValue> { new ObservableValue(_Available) };

                    //_Booked = _preBooked = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID == 2).ToList().Count;
                    //currentBooked = new ChartValues<ObservableValue> { new ObservableValue(_Booked) };

                    //_Occupied = _preOccupied = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID == 3).ToList().Count;
                    //currentOccupied = new ChartValues<ObservableValue> { new ObservableValue(_Occupied) };

                    //_Maintenance = _preMaintenance = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID == 4).ToList().Count;
                    //currentMaintenance = new ChartValues<ObservableValue> { new ObservableValue(_Maintenance) };

            //timerPos.Interval = new TimeSpan(0, 0, 3);
            //timerPos.Tick += UpdateData;
            //timerPos.Start();

        }

        
        private void UpdateData(object sender, EventArgs e)
        {
            
                //DataProvider.Ins.Data.Dispose();
                //DataProvider.Ins.Data = new CarParkingLotEntities1();

                //_Available = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID == 1).ToList().Count;
                //_Booked = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID == 2).ToList().Count;
                //_Occupied = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID == 3).ToList().Count;
                //_Maintenance = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.StatusID == 4).ToList().Count;

                //if (_Available != _preAvailable)
                //{
                //    _preAvailable = _Available;
                //    currentAvailable = new ChartValues<ObservableValue> { new ObservableValue(_Available) };
                //    RaisePropertyChanged("currentAvailable");
                //}

                //if (_Booked != _preBooked)
                //{
                //    _preBooked = _Booked;
                //    currentBooked = new ChartValues<ObservableValue> { new ObservableValue(_Booked) };
                //    RaisePropertyChanged("_currentBooked");
                //}

                //if (_Occupied != _preOccupied)
                //{
                //    _preOccupied = _Occupied;
                //    currentOccupied = new ChartValues<ObservableValue> { new ObservableValue(_Occupied) };
                //    RaisePropertyChanged("_currentOccupied");
                //}

                //if (_Maintenance != _preMaintenance)
                //{
                //    _preMaintenance = _Maintenance;
                //    currentMaintenance = new ChartValues<ObservableValue> { new ObservableValue(_Maintenance) };
                //    RaisePropertyChanged("_currentMaintenance");
                //}
            


        }
    }
}
