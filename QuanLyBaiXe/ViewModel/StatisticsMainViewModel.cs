using QuanLyBaiXe.Model;
using QuanLyBaiXe.Resource.NotifyPanel;
using System;
using System.Collections.Generic;
using System.Data.Entity.SqlServer;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyBaiXe.ViewModel
{
   public class StatisticsMainViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand FilterCommand { get; set; }
        public ICommand SelectedDateChangedCommand { get; set; }
        
        
        #endregion COMMAND


        #region DAILY STATISTICS
        private bool _IsFiltered;
        public bool IsFiltered { get=> _IsFiltered; set { _IsFiltered = value;OnPropertyChanged(); } }
        private bool _IsFilterButtonEnable;
        public bool IsFilterButtonEnable { get => _IsFilterButtonEnable; set { _IsFilterButtonEnable = value; OnPropertyChanged(); } }
        private string _SumIn;
        public string SumIn { get =>_SumIn; set { _SumIn = value;OnPropertyChanged(); } }
        private string _SumOut;
        public string SumOut { get => _SumOut; set { _SumOut = value; OnPropertyChanged(); } }
        private string _AvgHour;
        public string AvgHour { get => _AvgHour; set { _AvgHour = value; OnPropertyChanged(); } }
        private string _Revenue;
        public string Revenue { get => _Revenue; set { _Revenue = value; OnPropertyChanged(); } }
        #endregion STATISTICS

        #region CUSTOM STATISTICS
        private bool _IsBeginPickerEnable;
        public bool IsBeginPickerEnable { get=> _IsBeginPickerEnable; set { _IsBeginPickerEnable = value;OnPropertyChanged(); } }

        private bool _IsEndPickerEnable;
        public bool IsEndPickerEnable { get => _IsEndPickerEnable; set { _IsEndPickerEnable = value; OnPropertyChanged(); } }

        private bool _IsViewTypeChosen;
        public bool IsViewTypeChosen { get => _IsViewTypeChosen; set { _IsViewTypeChosen = value; OnPropertyChanged(); } }

        private bool _IsFilterButtonEnabled;
        public bool IsCustomFilterButtonEnabled { get => _IsFilterButtonEnabled; set { _IsFilterButtonEnabled = value; OnPropertyChanged(); } }

        private bool _IsStatisticEnable;
        public bool IsStatisticEnable { get => _IsStatisticEnable; set { _IsStatisticEnable = value; OnPropertyChanged(); } }

        private int _selectedViewType;
        public int SelectedViewType { get=> _selectedViewType; set { _selectedViewType = value;OnPropertyChanged(); } }

        private DateTime _selectedBeginDate;
        public DateTime SelectedBeginDate { get => _selectedBeginDate; set { _selectedBeginDate = value; OnPropertyChanged(); } }
    
        private DateTime _selectedEndDate;
        public DateTime SelectedEndDate { get => _selectedEndDate; set { _selectedEndDate = value; OnPropertyChanged(); } }

        private string _customRevenue;
        public string CustomRevenue { get=> _customRevenue; set { _customRevenue = value;OnPropertyChanged(); } }

        private string _customSumIn;
        public string CustomSumIn { get => _customSumIn; set { _customSumIn = value; OnPropertyChanged(); } }

        //COMMAND
        public ICommand CustomSelectedDateChangedCommand { get; set; }
        public ICommand CustomViewTypeCommand { get; set; }
        public ICommand CustomFilterCommand { get; set; }






        #endregion CUSTOM STATISTICS

        public StatisticsMainViewModel()
        {
            #region DAILY STATISTICS
            IsFiltered = false;
            IsFilterButtonEnable = false;
            FilterCommand = new RelayCommand<object>((p) => { return true; }, (p) => { DatePicker a = p as DatePicker; Filter(a);   });
            SelectedDateChangedCommand = new RelayCommand<object>
                (
                (p) => { return true; }, 
                (p) => 
                {
                    if (!IsFilterButtonEnable)
                    {
                        DatePicker a = p as DatePicker;
                        if (a.SelectedDate != null) IsFilterButtonEnable = true;
                    }
                }
                );

            #endregion DAILY STATISTICS


            #region CUSTOM STATISTICS

            //DISABLE after Test
            IsBeginPickerEnable = false;
            IsEndPickerEnable = false;
            IsViewTypeChosen = false;
            IsCustomFilterButtonEnabled = false;
            IsStatisticEnable = true;
            SelectedViewType = -1;
            
            CustomSelectedDateChangedCommand = new RelayCommand<object>((p) => { return true; }, (p) => { DatePicker a = p as DatePicker; CustomSelectedPicker(a); });
            CustomViewTypeCommand = new RelayCommand<object>((p) => { return true; }, (p) => 
            {
                ComboBox a = p as ComboBox;
                if (a!=null)
                {
                    if (a.SelectedIndex != -1) IsViewTypeChosen = true;
                    IsCustomFilterButtonEnabled = IsBeginPickerEnable && IsEndPickerEnable && IsViewTypeChosen;
                }
            });


            CustomFilterCommand = new RelayCommand<object>((p) => { return true; }, (p) => {  CustomFilter(); });
            #endregion CUSTOM STATISTICS

        }


        void Filter(DatePicker x)
        {

               using (CarParkingLotEntities data = new CarParkingLotEntities())
            {
                var pickedDate = x.SelectedDate.Value;
                var result = data.DataLoggings.Where(p => p.LoggedTime == pickedDate).ToList();
                if (result.Count == 0)
                {
                    CannotFindPanel panel = new CannotFindPanel();
                    panel.ShowDialog();
                    IsFiltered = false;
                }
                else
                {
                    int tempSumIn = 0;
                    int tempSumOut = 0;
                    long tempMins = 0;
                    decimal tempRevenue = 0;

                    foreach (var item in result)
                    {
                        if (item.ArrivalTime.Value.ToShortDateString() == pickedDate.ToShortDateString()) tempSumIn += 1;
                        if (item.LeavingTime.Value.ToShortDateString() == pickedDate.ToShortDateString())
                        {
                            tempSumOut += 1;
                            tempMins += (long)item.TotalServiceMinutes;
                            tempRevenue += (decimal)item.Charge;
                        }
                    }

                    SumIn = tempSumIn.ToString();
                    SumOut = tempSumOut.ToString();
                    AvgHour = (((double)tempMins / 60/tempSumOut)).ToString("#.##");
                    Revenue = tempRevenue.ToString("N0").Replace(",",".");
                    IsFiltered = true;
                }
            }
        }

        void CustomSelectedPicker(DatePicker x)
        {
            if (x!=null)
            {
                if (x.Name == "BeginCustomPicker")
                {
                    SelectedBeginDate = x.SelectedDate.Value;
                    IsBeginPickerEnable = true;
                }
                else if (x.Name == "EndCustomPicker")
                {
                    SelectedEndDate = x.SelectedDate.Value;
                    IsEndPickerEnable = true;
                }

            }
            IsCustomFilterButtonEnabled = IsBeginPickerEnable && IsEndPickerEnable && IsViewTypeChosen;
        }


        void CustomFilter()
        {
            if (SelectedBeginDate > SelectedEndDate )
            {
                MissingParameterPanel panel = new MissingParameterPanel();
                panel.ShowDialog();
            }
            else
            {
                int tempSumIn = 0;
                decimal tempRevenue = 0;

                using (CarParkingLotEntities data = new CarParkingLotEntities())
                {

                    var result = data.DataLoggings.Where(p => p.LoggedTime >= SelectedBeginDate && p.LoggedTime <= SelectedEndDate).ToList();
                    foreach (var item in result)
                    {
                        if (item.ArrivalTime.Value >= SelectedBeginDate && item.ArrivalTime.Value <= SelectedEndDate) tempSumIn += 1;
                        if (item.LeavingTime.Value >= SelectedBeginDate && item.LeavingTime.Value <= SelectedEndDate) tempRevenue +=(decimal) item.Charge;
                    }
                    CustomSumIn = tempSumIn.ToString("N0").Replace(",", ".");
                    CustomRevenue = FormatNumber(Convert.ToInt64(tempRevenue));
                   
                    
                }


            }


        }


        private static string FormatNumber(long num)
        {
            // Ensure number has max 3 significant digits (no rounding up can happen)
            long i = (long)Math.Pow(10, (int)Math.Max(0, Math.Log10(num) - 2));
            num = num / i * i;

            if (num >= 1000000000)
                return (num / 1000000000D).ToString("0.##") + "B";
            if (num >= 1000000)
                return (num / 1000000D).ToString("0.##") + "M";
            if (num >= 1000)
                return (num / 1000D).ToString("0.##") + "K";

            return num.ToString("#,0");
        }

    }
}
