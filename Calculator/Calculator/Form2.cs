using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Calculator
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            Form1 myform = new Form1();
            myform.ShowDialog();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            Form3 myform = new Form3();
            myform.ShowDialog();
        }
    }
}
