namespace QLVT_DATHANG
{
    partial class main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(main));
            this.ribbonControl1 = new DevExpress.XtraBars.Ribbon.RibbonControl();
            this.btnDSVatTu = new DevExpress.XtraBars.BarButtonItem();
            this.btnDSPN = new DevExpress.XtraBars.BarButtonItem();
            this.btnDSPX = new DevExpress.XtraBars.BarButtonItem();
            this.btnThoat = new DevExpress.XtraBars.BarButtonItem();
            this.ribbonPage1 = new DevExpress.XtraBars.Ribbon.RibbonPage();
            this.ribbonPageGroup1 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup2 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup3 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            this.ribbonPageGroup4 = new DevExpress.XtraBars.Ribbon.RibbonPageGroup();
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl1)).BeginInit();
            this.SuspendLayout();
            // 
            // ribbonControl1
            // 
            this.ribbonControl1.ExpandCollapseItem.Id = 0;
            this.ribbonControl1.Items.AddRange(new DevExpress.XtraBars.BarItem[] {
            this.ribbonControl1.ExpandCollapseItem,
            this.ribbonControl1.SearchEditItem,
            this.btnDSVatTu,
            this.btnDSPN,
            this.btnDSPX,
            this.btnThoat});
            this.ribbonControl1.Location = new System.Drawing.Point(0, 0);
            this.ribbonControl1.MaxItemId = 5;
            this.ribbonControl1.Name = "ribbonControl1";
            this.ribbonControl1.Pages.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPage[] {
            this.ribbonPage1});
            this.ribbonControl1.Size = new System.Drawing.Size(1017, 143);
            // 
            // btnDSVatTu
            // 
            this.btnDSVatTu.Caption = "DS VẬT TƯ";
            this.btnDSVatTu.Id = 1;
            this.btnDSVatTu.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnDSVatTu.ImageOptions.Image")));
            this.btnDSVatTu.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("btnDSVatTu.ImageOptions.LargeImage")));
            this.btnDSVatTu.Name = "btnDSVatTu";
            this.btnDSVatTu.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnDSVatTu_ItemClick);
            // 
            // btnDSPN
            // 
            this.btnDSPN.Caption = "DS PHIẾU NHẬP";
            this.btnDSPN.Id = 2;
            this.btnDSPN.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnDSPN.ImageOptions.Image")));
            this.btnDSPN.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("btnDSPN.ImageOptions.LargeImage")));
            this.btnDSPN.Name = "btnDSPN";
            this.btnDSPN.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnDSPN_ItemClick);
            // 
            // btnDSPX
            // 
            this.btnDSPX.Caption = "DS PHIẾU XUẤT";
            this.btnDSPX.Id = 3;
            this.btnDSPX.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnDSPX.ImageOptions.Image")));
            this.btnDSPX.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("btnDSPX.ImageOptions.LargeImage")));
            this.btnDSPX.Name = "btnDSPX";
            this.btnDSPX.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnDSPX_ItemClick);
            // 
            // btnThoat
            // 
            this.btnThoat.Caption = "THOÁT";
            this.btnThoat.Id = 4;
            this.btnThoat.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("btnThoat.ImageOptions.Image")));
            this.btnThoat.ImageOptions.LargeImage = ((System.Drawing.Image)(resources.GetObject("btnThoat.ImageOptions.LargeImage")));
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.ItemClick += new DevExpress.XtraBars.ItemClickEventHandler(this.btnThoat_ItemClick);
            // 
            // ribbonPage1
            // 
            this.ribbonPage1.Groups.AddRange(new DevExpress.XtraBars.Ribbon.RibbonPageGroup[] {
            this.ribbonPageGroup1,
            this.ribbonPageGroup2,
            this.ribbonPageGroup3,
            this.ribbonPageGroup4});
            this.ribbonPage1.Name = "ribbonPage1";
            this.ribbonPage1.Text = "Quản Lý Vật Tư";
            // 
            // ribbonPageGroup1
            // 
            this.ribbonPageGroup1.ItemLinks.Add(this.btnDSVatTu);
            this.ribbonPageGroup1.Name = "ribbonPageGroup1";
            this.ribbonPageGroup1.Text = "DS VẬT TƯ";
            // 
            // ribbonPageGroup2
            // 
            this.ribbonPageGroup2.ItemLinks.Add(this.btnDSPN);
            this.ribbonPageGroup2.Name = "ribbonPageGroup2";
            this.ribbonPageGroup2.Text = "DS PHIẾU NHẬP";
            // 
            // ribbonPageGroup3
            // 
            this.ribbonPageGroup3.ImageOptions.Image = ((System.Drawing.Image)(resources.GetObject("ribbonPageGroup3.ImageOptions.Image")));
            this.ribbonPageGroup3.ItemLinks.Add(this.btnDSPX);
            this.ribbonPageGroup3.Name = "ribbonPageGroup3";
            this.ribbonPageGroup3.Text = "DS PHIẾU XUẤT";
            // 
            // ribbonPageGroup4
            // 
            this.ribbonPageGroup4.ItemLinks.Add(this.btnThoat);
            this.ribbonPageGroup4.Name = "ribbonPageGroup4";
            this.ribbonPageGroup4.Text = "THOÁT";
            // 
            // main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1017, 573);
            this.Controls.Add(this.ribbonControl1);
            this.Name = "main";
            this.Ribbon = this.ribbonControl1;
            this.Text = "QUẢN LÝ VẬT TƯ ĐẶT HÀNG";
            ((System.ComponentModel.ISupportInitialize)(this.ribbonControl1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private DevExpress.XtraBars.Ribbon.RibbonControl ribbonControl1;
        private DevExpress.XtraBars.Ribbon.RibbonPage ribbonPage1;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup1;
        private DevExpress.XtraBars.BarButtonItem btnDSVatTu;
        private DevExpress.XtraBars.BarButtonItem btnDSPN;
        private DevExpress.XtraBars.BarButtonItem btnDSPX;
        private DevExpress.XtraBars.BarButtonItem btnThoat;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup2;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup3;
        private DevExpress.XtraBars.Ribbon.RibbonPageGroup ribbonPageGroup4;
    }
}

