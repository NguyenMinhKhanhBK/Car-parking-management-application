using QuanLyBaiXe.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyBaiXe.Resource.Grid_Booked
{
    public class gridBookedViewModel : BaseViewModel
    {
        public ICommand GridClickCommand { get; set; }
        private string _positionID;
        public string positionID { get => _positionID; set { _positionID = value; OnPropertyChanged(); } }
        public gridBookedViewModel()
        {
            GridClickCommand = new RelayCommand<System.Windows.Controls.UserControl>((p) => { return p == null ? false : true; }, (p) =>
            {
                var parent = GetParent(p) as Grid;
                string _customerPhoneNum = "";
                string _plateNum = "";

                try
                {
                    var a = parent.Name;
                    int location = GetPosition(a);
                    positionID = location.ToString();

                    // var item = DataProvider.Ins.Data.CarParkingLayouts.Where(x => x.BuildingID == MainViewModel.currentBuildingID && x.BlockID == MainViewModel.currentBlockID && x.ID == location).FirstOrDefault();
                    //_customerPhoneNum = DataProvider.Ins.Data.Users.Where(x => x.ID == item.UserID).FirstOrDefault().Username;


                    // _plateNum = item.LicensePlate;
                }

                catch
                {
                    System.Windows.MessageBox.Show("Có lỗi xảy ra");
                }

                p.Opacity = 0.5;
                BookedPanel panel = new BookedPanel(positionID, _customerPhoneNum, _plateNum);
                var point = p.PointToScreen(Mouse.GetPosition(p));
                panel.Left = point.X;
                panel.Top = point.Y;
                panel.ShowDialog();
                p.Opacity = 1;

            });
        }


    private FrameworkElement GetParent(System.Windows.Controls.UserControl p)
        {
            FrameworkElement parent = p;

            if (parent.Parent != null)
            {
                parent = parent.Parent as FrameworkElement;
            }

            return parent;
        }

        int GetPosition(string s)
        {
            switch (s)
            {
                case "pos1": return 1;
                case "pos2": return 2;
                case "pos3": return 3;
                case "pos4": return 4;
                case "pos5": return 5;
                case "pos6": return 6;
                case "pos7": return 7;
                case "pos8": return 8;
                case "pos9": return 9;
                case "pos10": return 10;
                case "pos11": return 11;
                case "pos12": return 12;
                default: return 0;
            }


        }


    }
}
