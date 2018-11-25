using QuanLyBaiXe.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyBaiXe.Resource.BuildingPanel
{
  public  class BuildingPanelViewModel : BaseViewModel
    {
        #region PROPERTY
        private string _stationName;
        public string StationName { get => _stationName; set { _stationName = value; OnPropertyChanged(); } }

        private bool _isBlock1Selected;
        public bool IsBlock1Selected { get => _isBlock1Selected; set { _isBlock1Selected = value; OnPropertyChanged(); } }

        private bool _isBlock2Selected;
        public bool IsBlock2Selected { get => _isBlock2Selected; set { _isBlock2Selected = value; OnPropertyChanged(); } }

        #endregion PROPERTY

        #region COMMAND
        public ICommand MoveCommand { get; set; }
        public ICommand AcceptCommand { get; set; }
        public ICommand CancelCommand { get; set; }
      
        #endregion


        public BuildingPanelViewModel()
        {

            MoveCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.DragMove(); });
            AcceptCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Accept(p as Window); });
            CancelCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; EventSystem.Publish<BuildingPanelStatus>(new BuildingPanelStatus() { IsClosed = true }); ; a.Close(); });
           


        }

        void Accept(Window a)
        {
            int _buildingID, _blockID, temp;
            var strList = StationName.Split(' ').ToList();

            if (int.TryParse(strList[1], out temp)) _buildingID = temp;
            else _buildingID = 1;

            if (IsBlock1Selected) _blockID = 1;
            else _blockID = 2;


            a.Close();
            MainWindow wd = new MainWindow(_buildingID,_blockID);
            wd.Show();

        }

        void CheckFee(CheckBox a)
        {
            //double fee;
            //if (string.IsNullOrWhiteSpace(Fee) || !double.TryParse(Fee, out fee) || (session < 0))
            //{
            // //   FeeMessageBox panel = new FeeMessageBox();
            //    var point = a.PointToScreen(Mouse.GetPosition(a));
            //    panel.Left = point.X - panel.Width;
            //    panel.Top = point.Y;
            //    panel.ShowDialog();
            //    a.IsChecked = false;
            //}

        }
    }
}
