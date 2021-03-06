﻿using QuanLyBaiXe.Model;
using QuanLyBaiXe.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyBaiXe.Resource.Grid_Maintenance
{
    public class MaintenancePanelViewModel : BaseViewModel
    {
        #region COMMAND
        public ICommand MoveCommand { get; set; }
        public ICommand AcceptCommand { get; set; }
        public ICommand CancelCommand { get; set; }
        #endregion

        private string _posID;
        public string posID { get => _posID; set { _posID = value; OnPropertyChanged(); } }

        public MaintenancePanelViewModel()
        {
            MoveCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.DragMove(); });
            AcceptCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Accept(p as Window); });
            CancelCommand = new RelayCommand<object>((p) => { return true; }, (p) => { Window a = p as Window; a.Close(); });
        }

        void Accept(Window a)
        {
            try
            {
                int posid = int.Parse(posID);
                EventSystem.Publish<ShareMemory>(new ShareMemory { FinishMaintenancePosition= posid });
            }
            catch
            {
                MessageBox.Show("Có lỗi xảy ra");
            }
           
               // var b = DataProvider.Ins.Data.CarParkingLayouts.Where(p => p.BlockID == MainViewModel.currentBlockID && p.BuildingID == MainViewModel.currentBuildingID && p.ID == posid).FirstOrDefault();
               // b.StatusID = 1;
               // DataProvider.Ins.Data.SaveChanges();
            a.Close();
            }

        }
    }

