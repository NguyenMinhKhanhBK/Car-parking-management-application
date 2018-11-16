using QuanLyBaiXe.Resource.BlackListPanel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyBaiXe.ViewModel
{
    class BlacklistMainViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand AddBlackListCommand { get; set; }
        public ICommand EditBlackListCommand { get; set; }
        public ICommand DeleteBlackListCommand { get; set; }

        #endregion

        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }

        public BlacklistMainViewModel()
        {
            AddBlackListCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Button a = p as Button; OpenAddPanel(a); });
            EditBlackListCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Button a = p as Button; OpenEditPanel(a); });
            DeleteBlackListCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Button a = p as Button; OpenDeletePanel(a); });
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
        }

        void OpenEditPanel(Button a)
        {
            a.Opacity = 0.5;
            BlacklistEditPanel panel = new BlacklistEditPanel();
            var point = a.PointToScreen(Mouse.GetPosition(a));
            panel.Left = point.X - panel.Width;
            panel.Top = point.Y;
            panel.ShowDialog();
            a.Opacity = 1;
        }

        void OpenDeletePanel(Button a)
        {
            a.Opacity = 0.5;
            BlackListDeletePanel panel = new BlackListDeletePanel();
            var point = a.PointToScreen(Mouse.GetPosition(a));
            panel.Left = point.X - panel.Width;
            panel.Top = point.Y;
            panel.ShowDialog();
            a.Opacity = 1;
        }



    }
}

