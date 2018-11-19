using QuanLyBaiXe.Model;
using QuanLyBaiXe.Resource.FeeEditPanel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyBaiXe.ViewModel
{
    public class FeeMainViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand EditFeeCommand { get; set; }
    //    public ICommand SelectedItemChangedCommand { get; set; }
        #endregion COMMAND

        #region OBSERVABLE COLLECTION
        public ObservableCollection<FeeModel> NormalFeeCollection { get; set; }
        public ObservableCollection<FeeModel> FestivalFeeCollection { get; set; }
        public ObservableCollection<FeeModel> EventFeeCollection { get; set; }
        #endregion OBSERVABLE COLLECTION

        

        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }

        


        public FeeMainViewModel()
        {
            NormalFeeCollection = new ObservableCollection<FeeModel>();
            FestivalFeeCollection = new ObservableCollection<FeeModel>();
            EventFeeCollection = new ObservableCollection<FeeModel>();
            EventSystem.Subscribe<ChangedFee>(EditFee);

            EditFeeCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Button a = p as Button; OpenEditFeePanel(a); });
           // SelectedItemChangedCommand = new RelayCommand<object>((p) => { return true; }, (p) => { ListView a = p as ListView; SelectionChange(a); });

            NormalFeeCollection = GetFeeData(0);
            FestivalFeeCollection = GetFeeData(1);
            EventFeeCollection = GetFeeData(2);
        }

        void OpenEditFeePanel(Button a)
        {
            int feetype = 0;
            if(a!=null && a.Name!=null)
            {
                if (a.Name == "btnNormalFeeEdit") feetype = 1;
                else if (a.Name == "btnFestivalFeeEdit") feetype = 2;
                else if (a.Name == "btnEventFeeEdit") feetype = 3;
            }
            a.Opacity = 0.5;
            FeeEditPanel panel = new FeeEditPanel(feetype);
            var point = a.PointToScreen(Mouse.GetPosition(a));
            panel.Left = point.X - panel.Width;
            panel.Top = point.Y;
            panel.ShowDialog();
            a.Opacity = 1;
        }

       
        

        
        //Get Fee table from SQL
        //Parameter: int a (0 if normal fee, 1 if festival fee, 2 if event fee)
        //Return: ObservableCollection<FeeModel> 

        ObservableCollection<FeeModel> GetFeeData(int a)
        {
            
            ObservableCollection<FeeModel> tempCollection = new ObservableCollection<FeeModel>();

            using (CarParkingLotEntities data = new CarParkingLotEntities())
            {
                int index = 1;
                if (a == 0)
                {
                    var _normal = data.Fees.Where(p => p.TypeID == 1).ToList();
                    foreach (var item in _normal)
                    {
                        FeeModel model = new FeeModel();
                        model.STT = index;
                        model.Time = data.FeeSessions.Where(p => p.ID == item.SessionID).FirstOrDefault().SessionName;
                        model.Price = (double)item.Price;
                        tempCollection.Add(model);
                        index++;
                    }
                    return tempCollection;
                }
                else if (a == 1)
                {
                    var _festival = data.Fees.Where(p => p.TypeID == 2).ToList();
                    foreach (var item in _festival)
                    {
                        FeeModel model = new FeeModel();
                        model.STT = index;
                        model.Time = data.FeeSessions.Where(p => p.ID == item.SessionID).FirstOrDefault().SessionName;
                        model.Price = (double)item.Price;
                        tempCollection.Add(model);
                        index++;
                    }
                    return tempCollection;
                }
                else if (a == 2)
                {
                    var _event = data.Fees.Where(p => p.TypeID == 3).ToList();
                    foreach (var item in _event)
                    {
                        FeeModel model = new FeeModel();
                        model.STT = index;
                        model.Time = data.FeeSessions.Where(p => p.ID == item.SessionID).FirstOrDefault().SessionName;
                        model.Price = (double)item.Price;
                        tempCollection.Add(model);
                        index++;
                    }
                    return tempCollection;
                }
                else return null;
            }
               
        }

       
      public  void EditFee(ChangedFee msg)
        {
            using (CarParkingLotEntities data = new CarParkingLotEntities())
            {
                var a = data.Fees.Where(p => p.TypeID == msg.FeeType && p.SessionID == msg.Session).FirstOrDefault();
                a.Price = (float)msg.Price;
                data.SaveChanges();

                switch (msg.FeeType)
                {
                    case 1:
                        {
                           // var a = data.Fees.Where(p =>p.TypeID == msg.FeeType && p.SessionID == msg.Session).FirstOrDefault();
                            
                            NormalFeeCollection = GetFeeData(0);
                            OnPropertyChanged("NormalFeeCollection");
                            break;
                        }
                    case 2:
                        {
                            
                            
                            FestivalFeeCollection = GetFeeData(1);
                            OnPropertyChanged("FestivalFeeCollection");
                            break;
                        }
                    case 3:
                        {


                            EventFeeCollection = GetFeeData(2);
                            OnPropertyChanged("EventFeeCollection");
                            break;
                        }
                }
                
            }
        }


    }
}

