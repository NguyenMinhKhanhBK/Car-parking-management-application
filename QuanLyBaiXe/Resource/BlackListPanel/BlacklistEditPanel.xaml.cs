﻿using QuanLyBaiXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace QuanLyBaiXe.Resource.BlackListPanel
{
    /// <summary>
    /// Interaction logic for BlacklistEditPanel.xaml
    /// </summary>
    public partial class BlacklistEditPanel : Window
    {
        public BlacklistEditPanel(BlackListPerson selectedPerson)
        {
            InitializeComponent();
            var VM = new BlackListEditPanelViewModel();
            this.DataContext = VM;
            VM.SelectedPerson.ID = selectedPerson.ID;
            VM.SelectedPerson.Name = selectedPerson.Name;
            VM.SelectedPerson.PhoneNumber = selectedPerson.PhoneNumber;
            VM.SelectedPerson.LicensePlate = selectedPerson.LicensePlate;

        }
    }
}
