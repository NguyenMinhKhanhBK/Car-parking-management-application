﻿using System;
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

namespace QuanLyBaiXe.Resource.NotifyPanel
{
    /// <summary>
    /// Interaction logic for CannotFindPanel.xaml
    /// </summary>
    public partial class CannotFindPanel : Window
    {
        public CannotFindPanel()
        {
            InitializeComponent();
            this.DataContext = new CannotFindPanelViewModel();
        }
    }
}
