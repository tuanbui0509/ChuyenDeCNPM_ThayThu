using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using System.Data.SqlClient;
using System.Security.Permissions;

namespace QLVT_DATHANG
{
    public partial class XtraFormDSVATTU : DevExpress.XtraEditors.XtraForm
    {
        //string connectionString = ConfigurationManager.ConnectionStrings["QLVT_DATHANG_Trigger"].ConnectionString;
        DataTable dt = new DataTable();
        //kt xem dich vu broker da hoat dong voi user
        public XtraFormDSVATTU()
        {
            InitializeComponent();
        }

        private bool DoesUserHavePermission()
        {
            try
            {
                SqlClientPermission ss = new SqlClientPermission(PermissionState.Unrestricted);
                ss.Demand();
                return true;
            }
            catch
            {
                return false;
            }
        }
        private void LoadData()
        {
            if (!DoesUserHavePermission())
            {
                return;
            }
            dt.Clear();
            //ket noi dich vu
            SqlDependency.Stop(Program.connstr);
            SqlDependency.Start(Program.connstr);
            //tao ket noi
            using (SqlConnection connection = new SqlConnection(Program.connstr))
            {
                //thực thi lệnh
                using (SqlCommand command = new SqlCommand("GET_VATTU", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    //bao dam k ton tai thong bao voi command
                    command.Notification = null;
                    //create dependency ung voi command
                    SqlDependency dependency = new SqlDependency(command);
                    //Create event onchange
                    dependency.OnChange += new OnChangeEventHandler(Dependency_OnChange);
                    //mo ket noi
                    connection.Open();
                    //read data
                    dt.Load(command.ExecuteReader());
                    gridControl1.DataSource = dt;
                }
            }
        }

        private void Dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {
            //sự kiện này được chạy không đồng bộ, cần phải gọi để chạy // trên nhiều luồng
            ISynchronizeInvoke i = (ISynchronizeInvoke)this;
            if (i.InvokeRequired)
            {
                OnChangeEventHandler temp = new OnChangeEventHandler(Dependency_OnChange);
                object[] args = { sender, e };
                i.BeginInvoke(temp, args);
                return;
            }
            //loại bỏ trình xử lý sự kiện vì sự phụ thuộc chỉ dành cho một thông báo
            SqlDependency de = sender as SqlDependency;
            de.OnChange -= Dependency_OnChange;
            /*listboxResult.Items.Clear();
            listboxResult.Items.Add("Trạng thái gần nhất:");
            listboxResult.Items.Add("info: " + e.Info.ToString());
            listboxResult.Items.Add("Source: " + e.Source.ToString());
            listboxResult.Items.Add("Type: " + e.Type.ToString());*/
            LoadData();
        }




        private void XtraFormDSVATTU_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qLVT_DATHANGDataSet.VATTU' table. You can move, or remove it, as needed.
            this.vATTUTableAdapter.Fill(this.ds.VATTU);
            LoadData();
        }

        private void btnThoat_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void btnRefesh_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.vATTUTableAdapter.Fill(this.ds.VATTU);
        }
    }
}