using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QLVT_DATHANG
{
    public partial class main : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        public main()
        {
            InitializeComponent();
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void btnDSPX_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(XtraFormDSPX));
            if (frm != null) frm.Activate();
            else
            {
                XtraFormDSPX f = new XtraFormDSPX();
                f.Show();
            }
        }

        private void btnDSPN_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(XtraFormDSPN));
            if (frm != null) frm.Activate();
            else
            {
                XtraFormDSPN f = new XtraFormDSPN();
                f.Show();
            }
        }

        private void btnDSVatTu_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Form frm = this.CheckExists(typeof(XtraFormDSVATTU));
            if (frm != null) frm.Activate();
            else
            {
                XtraFormDSVATTU f = new XtraFormDSVATTU();
                f.Show();
            }
        }
        private Form CheckExists(Type ftype)
        {
            foreach (Form f in this.MdiChildren)
                if (f.GetType() == ftype)
                    return f;
            return null;
        }
    }
}
