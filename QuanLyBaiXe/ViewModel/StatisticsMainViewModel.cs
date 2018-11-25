using LiveCharts;
using LiveCharts.Wpf;
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

        private string _selectedViewTypeName;
        public string SelectedViewTypeName { get => _selectedViewTypeName; set { _selectedViewTypeName = value; OnPropertyChanged(); } }

        private DateTime _selectedBeginDate;
        public DateTime SelectedBeginDate { get => _selectedBeginDate; set { _selectedBeginDate = value; OnPropertyChanged(); } }
    
        private DateTime _selectedEndDate;
        public DateTime SelectedEndDate { get => _selectedEndDate; set { _selectedEndDate = value; OnPropertyChanged(); } }

        private string _customRevenue;
        public string CustomRevenue { get=> _customRevenue; set { _customRevenue = value;OnPropertyChanged(); } }

        private string _customSumIn;
        public string CustomSumIn { get => _customSumIn; set { _customSumIn = value; OnPropertyChanged(); } }

        
        public List<Revenues> RevenueList { get; set; }
        public List<SumIns> SumInList { get; set; }

        //CHART
        public SeriesCollection RevenueSeriesCollection { get; set; }
        public SeriesCollection SumInSeriesCollection { get; set; }
        public List<string> RevenueLabels { get; set; }
        public List<string> SumInLabels { get; set; }
        public Func<decimal, string> Formatter { get; set; }

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
            IsStatisticEnable = false;
            SelectedViewType = -1;
            RevenueList = new List<Revenues>();
            SumInList = new List<SumIns>();

            RevenueSeriesCollection = new SeriesCollection();
            SumInSeriesCollection = new SeriesCollection();
            RevenueLabels = new List<string>();
            SumInLabels = new List<string>();

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
                var result = data.DataLoggings.Where(p=>p.BuildingID == MainViewModel.currentBuildingID &&  p.BlockID == MainViewModel.currentBlockID).ToList();
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

                    //    var result = data.DataLoggings.Where(p => p.LoggedTime >= SelectedBeginDate && p.LoggedTime <= SelectedEndDate).ToList();
                    var result = data.DataLoggings.Where(p => p.BuildingID == MainViewModel.currentBuildingID && p.BlockID == MainViewModel.currentBlockID).ToList();

                    //Daily 
                    if (SelectedViewType == 0)
                    {
                        //Renew variable
                        RevenueList = new List<Revenues>();
                        SumInList = new List<SumIns>();
                        var tempIn = new SumIns();
                        var tempRevenues = new Revenues();
                        foreach (var item in result)
                        {
                            if (DateTime.Parse(item.ArrivalTime.Value.ToShortDateString()) >= SelectedBeginDate && DateTime.Parse(item.ArrivalTime.Value.ToShortDateString()) <= SelectedEndDate)
                            {
                                if(tempIn.Time == null) //True if new variable
                                {
                                    tempIn.Time = item.ArrivalTime.Value.ToShortDateString();
                                    tempIn.SumIn = 1;
                                }
                                else //old variable, needing to check if the date is changed
                                {
                                    if (tempIn.Time != item.ArrivalTime.Value.ToShortDateString()) //Pass old date
                                    {
                                        SumInList.Add(tempIn);
                                        tempIn = new SumIns();
                                        tempIn.Time = item.ArrivalTime.Value.ToShortDateString();
                                        tempIn.SumIn = 1;
                                    }
                                    else //Old date not changed
                                    {
                                        tempIn.SumIn += 1;
                                    }
                                }
                            }

                            if (DateTime.Parse(item.LeavingTime.Value.ToShortDateString()) >= SelectedBeginDate && DateTime.Parse(item.LeavingTime.Value.ToShortDateString()) <= SelectedEndDate)
                            {
                                if (tempRevenues.Time == null) //True if new variable
                                {
                                    tempRevenues.Time = item.LeavingTime.Value.ToShortDateString();
                                    tempRevenues.Revenue = (decimal) item.Charge;
                                }
                                else //old variable, needing to check if the date is changed
                                {
                                    if (tempRevenues.Time != item.LeavingTime.Value.ToShortDateString()) //Pass old date
                                    {
                                        if ( RevenueList.Where(p => p.Time == item.LeavingTime.Value.ToShortDateString()).Count() == 0) //Not old date
                                        {
                                            RevenueList.Add(tempRevenues);
                                            tempRevenues = new Revenues();
                                            tempRevenues.Time = item.LeavingTime.Value.ToShortDateString();
                                            tempRevenues.Revenue = (decimal)item.Charge;
                                        }
                                        else //existing date
                                        {
                                            RevenueList.Where(p => p.Time == item.LeavingTime.Value.ToShortDateString()).FirstOrDefault().Revenue += (decimal)item.Charge;
                                        }
                                        
                                    }
                                    else //Old date not changed
                                    {
                                        tempRevenues.Revenue += (decimal)item.Charge;
                                    }
                                }
                            }
                            //if (item.LeavingTime.Value >= SelectedBeginDate && item.LeavingTime.Value <= SelectedEndDate) tempRevenue += (decimal)item.Charge;

                        }

                        if (SumInList.Where(p => p.Time == tempIn.Time).Count() == 0) //No duplicate
                            SumInList.Add(tempIn);
                        else SumInList.Where(p => p.Time == tempIn.Time).FirstOrDefault().SumIn += tempIn.SumIn;

                        if (RevenueList.Where(p => p.Time == tempRevenues.Time).Count() == 0) //No duplicate
                            RevenueList.Add(tempRevenues);
                        else RevenueList.Where(p => p.Time == tempRevenues.Time).FirstOrDefault().Revenue += tempRevenues.Revenue;
                        SelectedViewTypeName = "Ngày";
                    }

                    //Monthly
                    else
                    {
                        //Renew variable
                        RevenueList = new List<Revenues>();
                        SumInList = new List<SumIns>();
                        var tempIn = new SumIns();
                        var tempRevenues = new Revenues();
                        foreach (var item in result)
                        {
                            if (DateTime.Parse(item.ArrivalTime.Value.ToShortDateString()) >= SelectedBeginDate && DateTime.Parse(item.ArrivalTime.Value.ToShortDateString()) <= SelectedEndDate)
                            {
                                if (tempIn.Time == null) //True if new variable
                                {
                                    tempIn.Time = item.ArrivalTime.Value.ToString("MM/yyyy");
                                    tempIn.SumIn = 1;
                                }
                                else //old variable, needing to check if the date is changed
                                {
                                    if (tempIn.Time != item.ArrivalTime.Value.ToString("MM/yyyy")) //Pass old date
                                    {
                                        SumInList.Add(tempIn);
                                        tempIn = new SumIns();
                                        tempIn.Time = item.ArrivalTime.Value.ToString("MM/yyyy");
                                        tempIn.SumIn = 1;
                                    }
                                    else //Old date not changed
                                    {
                                        tempIn.SumIn += 1;
                                    }
                                }
                            }

                            if (DateTime.Parse(item.LeavingTime.Value.ToShortDateString()) >= SelectedBeginDate && DateTime.Parse(item.LeavingTime.Value.ToShortDateString()) <= SelectedEndDate)
                            {
                                if (tempRevenues.Time == null) //True if new variable
                                {
                                    tempRevenues.Time = item.LeavingTime.Value.ToString("MM/yyyy");
                                    tempRevenues.Revenue = (decimal)item.Charge;
                                }
                                else //old variable, needing to check if the date is changed
                                {
                                    if (tempRevenues.Time != item.LeavingTime.Value.ToShortDateString()) //Pass old date
                                    {
                                        if (RevenueList.Where(p => p.Time == item.LeavingTime.Value.ToString("MM/yyyy")).Count() == 0) //Not old date
                                        {
                                            RevenueList.Add(tempRevenues);
                                            tempRevenues = new Revenues();
                                            tempRevenues.Time = item.LeavingTime.Value.ToString("MM/yyyy");
                                            tempRevenues.Revenue = (decimal)item.Charge;
                                        }
                                        else //existing date
                                        {
                                            RevenueList.Where(p => p.Time == item.LeavingTime.Value.ToString("MM/yyyy")).FirstOrDefault().Revenue += (decimal)item.Charge;
                                        }

                                    }
                                    else //Old date not changed
                                    {
                                        tempRevenues.Revenue += (decimal)item.Charge;
                                    }
                                }
                            }
                            //if (item.LeavingTime.Value >= SelectedBeginDate && item.LeavingTime.Value <= SelectedEndDate) tempRevenue += (decimal)item.Charge;

                        }

                        if (SumInList.Where(p => p.Time == tempIn.Time).Count() == 0) //No duplicate
                            SumInList.Add(tempIn);
                        else SumInList.Where(p => p.Time == tempIn.Time).FirstOrDefault().SumIn += tempIn.SumIn;

                        if (RevenueList.Where(p => p.Time == tempRevenues.Time).Count() == 0) //No duplicate
                            RevenueList.Add(tempRevenues);
                        else RevenueList.Where(p => p.Time == tempRevenues.Time).FirstOrDefault().Revenue += tempRevenues.Revenue;
                        SelectedViewTypeName = "Tháng";
                    }

                    int totalSumIn = 0;
                    foreach (var item in SumInList)
                    {
                        totalSumIn += item.SumIn;
                    }
                    CustomSumIn = totalSumIn.ToString();

                    decimal totalRevenue = 0;
                    foreach (var item in RevenueList)
                    {
                        totalRevenue += item.Revenue;
                    }

                    CustomRevenue = FormatNumber(Convert.ToInt64(totalRevenue));

                    //Prepare point for charts
                    
                    
                    var RevenueColumn = new ColumnSeries();
                    var RevenueChartValue = new ChartValues<decimal>();
                    var SumInColumn = new ColumnSeries();
                    var SumInChartValues = new ChartValues<int>();
                    RevenueLabels.Clear();
                    SumInLabels.Clear();

                    if (SelectedViewType==0)
                    {
                        foreach (var item in RevenueList)
                        {
                            if(item.Time!=null)
                            {
                                RevenueChartValue.Add(item.Revenue / 1000000);
                                RevenueLabels.Add(DateTime.Parse(item.Time).ToString("dd/MM/yyyy"));
                            }
                            
                        }
                        foreach (var item in SumInList)
                        {
                            if(item.Time!=null)
                            {
                                SumInChartValues.Add(item.SumIn);
                                SumInLabels.Add(DateTime.Parse(item.Time).ToString("dd/MM/yyyy"));
                            }
                            
                        }

                    }
                    else
                    {
                        foreach (var item in RevenueList)
                        {
                            RevenueChartValue.Add(item.Revenue / 1000000);
                            RevenueLabels.Add(item.Time);
                        }
                        foreach (var item in SumInList)
                        {
                            SumInChartValues.Add(item.SumIn);
                            SumInLabels.Add(item.Time);
                        }
                    }

                    

                    RevenueColumn.Values = RevenueChartValue;
                    RevenueSeriesCollection.Clear();
                    RevenueSeriesCollection.Add(RevenueColumn);

                    SumInColumn.Values = SumInChartValues;
                    SumInSeriesCollection.Clear();
                    SumInSeriesCollection.Add(SumInColumn);
                      Formatter = value => value.ToString("N0");
                    IsStatisticEnable = true;

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

    public class Revenues
    {
        public string  Time { get; set; }
        public decimal Revenue { get; set; }
    }

    public class SumIns
    {
        public string Time { get; set; }
        public int SumIn { get; set; }
    }

    
}
