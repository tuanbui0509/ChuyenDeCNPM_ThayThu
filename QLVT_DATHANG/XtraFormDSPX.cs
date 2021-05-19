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

namespace QLVT_DATHANG
{
    public partial class XtraFormDSPX : DevExpress.XtraEditors.XtraForm
    {

        private bool isEditingPS = false;

        public XtraFormDSPX()
        {
            InitializeComponent();
        }

        private void changeStatusInit(bool enable)
        {
            groupBoxCTPN.Enabled = groupBoxPN.Enabled = enable;
            pHATSINHGridControl.Enabled = cT_PHATSINHGridControl.Enabled = btnExit.Enabled = !enable;
            btnCancelPS.Enabled = btnEdit.Enabled = btnDelete.Enabled = btnSave.Enabled = enable;
            btnSaveCTPS.Enabled = btnCancelCTPS.Enabled = btnEditCTPS.Enabled = enable;
            btnAdd.Enabled = btnAddCTPS.Enabled = !enable;
            if (bdsPS.Count > 0)
            {
                btnEdit.Enabled = btnDelete.Enabled = !enable;
            }
        }

        private void changeStatusCTPS(bool enable)
        {
            txtCT_MAPX.ReadOnly = enable;
            btnDeleteCTPS.Enabled = btnCancelCTPS.Enabled = btnSaveCTPS.Enabled = groupBoxCTPN.Enabled = enable;
            txtCT_SL.Enabled = txtCT_MAVT.Enabled = txtCT_DG.Enabled = enable;
            txtCT_MAVT.Focus();
            pHATSINHGridControl.Enabled = cT_PHATSINHGridControl.Enabled = !enable;
            btnCancelPS.Enabled = btnAdd.Enabled = btnEdit.Enabled = btnExit.Enabled = btnDelete.Enabled = !enable;
            btnAddCTPS.Enabled = !enable;
        }

        private void changeStatusPS(bool enable)
        {
            btnDeleteCTPS.Enabled = btnSaveCTPS.Enabled = btnAddCTPS.Enabled = btnEditCTPS.Enabled = btnCancelCTPS.Enabled = !enable;
            txtHTKH.Enabled = txtMANV.Enabled = txtMAPX.Enabled = txtNgay.Enabled = groupBoxPN.Enabled = enable;
            btnSave.Enabled = btnCancelPS.Enabled = enable;
            txtMAPX.Focus();
            pHATSINHGridControl.Enabled = cT_PHATSINHGridControl.Enabled = !enable;
            btnAdd.Enabled = btnEdit.Enabled = btnDelete.Enabled = !enable;
            txtLoai.Enabled = enable;
        }

        private void XtraFormDSPX_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dS.VATTU' table. You can move, or remove it, as needed.
            this.vATTUTableAdapter.Fill(this.dS.VATTU);
            // TODO: This line of code loads data into the 'dS.GET_VATTU' table. You can move, or remove it, as needed.
            this.gET_VATTUTableAdapter.Fill(this.dS.GET_VATTU);

            dS.EnforceConstraints = false;
            this.cT_PHATSINHTableAdapter.Fill(this.dS.CT_PHATSINH);
            try
            {
                // fill danh sách hóa đơn xuất
                this.pHATSINHTableAdapter.FillBy2(this.dS.PHATSINH);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
            changeStatusInit(false);
            if (bdsCTPS.Count > 0)
            {
                //txtCT_MAVT.Text = gridView2.GetRowCellValue(bdsCTPS.Position, "MAVT").ToString().Trim();
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = true;
            }
            else
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = false;
            }

            if (bdsPS.Count > 0)
            {
                btnAdd.Enabled = btnEdit.Enabled = btnExit.Enabled = btnDelete.Enabled = true;
            }
            else
            {
                btnEdit.Enabled = btnExit.Enabled = btnDelete.Enabled = false;
            }
            txtLoai.ReadOnly = true;



        }

        private void fillBy2ToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.pHATSINHTableAdapter.FillBy2(this.dS.PHATSINH);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }


        private void btnExit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.Close();
        }

        private void btnAdd_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            bdsPS.AddNew();
            changeStatusPS(true);
            txtLoai.Text = "X";
        }

        private void btnEdit_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            changeStatusPS(true);
            txtMANV.Focus();
            txtMAPX.ReadOnly = true;
            isEditingPS = true;
        }

        private void btnDelete_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xoá phiếu nhập này?", "", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (bdsCTPS.Count > 0)
                {
                    MessageBox.Show("Phiếu nhập này đã có CT phiếu nhập không thể xóa!");
                    return;
                }

                try
                {
                    bdsPS.RemoveCurrent();
                    this.pHATSINHTableAdapter.Update(this.dS.PHATSINH);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erorr delete!\n" + ex.Message, "", MessageBoxButtons.OK);
                }
            }
        }

        private void btnSave_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int position = bdsCTPS.Position;
            if (!isEditingPS)
            {
                if (txtMAPX.Text.Trim() == "")
                {
                    MessageBox.Show("Mã phiếu nhập không được rỗng");
                    txtMAPX.Focus();
                    return;
                }
                if (CheckMAPN(txtMAPX.Text.Trim()) == 1)
                {
                    MessageBox.Show("Không được trùng mã phiếu xuất");
                    txtCT_MAPX.Focus();
                    return;
                }
                if (txtHTKH.Text.Trim() == "")
                {
                    MessageBox.Show("Họ tên khách hàng không được rỗng");
                    txtHTKH.Focus();
                    return;
                }
                if (txtMANV.Text.Trim() == "")
                {
                    MessageBox.Show("MANV không được rỗng");
                    txtMANV.Focus();
                    return;
                }

                if (txtNgay.Text.Trim() == "")
                {
                    MessageBox.Show("Ngày không được rỗng");
                    txtNgay.Focus();
                    return;
                }
            }

            try
            {
                txtLoai.Text = "X";
                bdsPS.EndEdit();
                bdsPS.ResetCurrentItem();
                this.pHATSINHTableAdapter.Update(this.dS.PHATSINH);

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error\n" + ex.Message, "", MessageBoxButtons.OK);
                return;
            }
            txtCT_MAPX.ReadOnly = true;
            changeStatusInit(false);
        }
        private Form CheckExists(Type ftype)
        {
            foreach (Form f in this.MdiChildren)
                if (f.GetType() == ftype)
                    return f;
            return null;
        }
        private void btnRefesh_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            this.pHATSINHTableAdapter.Fill(this.dS.PHATSINH);
        }


        private void fillBy11ToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.pHATSINHTableAdapter.FillBy11(this.dS.PHATSINH);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void fillBy11ToolStrip_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            try
            {
                this.pHATSINHTableAdapter.FillBy1(this.dS.PHATSINH);
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }
        }

        private void btnAddCTPS_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            bdsCTPS.AddNew();
            bdsCTPS.ResetCurrentItem();
            changeStatusCTPS(true);
            btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = false;
        }

        private void btnDeleteCTPS_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn xoá chi tiết phiếu này không?", "", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                try
                {
                    bdsCTPS.RemoveCurrent();
                    this.cT_PHATSINHTableAdapter.Update(this.dS.CT_PHATSINH);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erorr delete!\n" + ex.Message, "", MessageBoxButtons.OK);
                }
            }
        }

        private void btnEditCTPS_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            changeStatusCTPS(true);
            btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = false;
        }

        private void btnSaveCTPS_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int position = bdsCTPS.Position;

            if (txtCT_MAVT.Text.Trim() == "")
            {
                MessageBox.Show("Mã vật tư không được rỗng");
                txtCT_MAVT.Focus();
                return;
            }
            if (txtCT_SL.Text.Trim() == "")
            {
                MessageBox.Show("Số lượng không được rỗng");
                txtCT_SL.Focus();
                return;
            }

            if (txtCT_DG.Text.Trim() == "")
            {
                MessageBox.Show("Đơn giá không được rỗng");
                txtCT_DG.Focus();
                return;
            }

            if (bdsCTPS.Count > 1)
            {
                for (int i = 0; i < bdsCTPS.Count - 1; i++)
                {
                    if (gridView2.GetRowCellValue(i, "MAVT").ToString().Trim() == txtCT_MAVT.Text.Trim() && position != i)
                    {
                        MessageBox.Show("Mã vật tư đã tồn tại trong phiếu!");
                        return;
                    }
                }
            }

            try
            {
                bdsCTPS.EndEdit();
                bdsCTPS.ResetCurrentItem();
                this.cT_PHATSINHTableAdapter.Update(this.dS.CT_PHATSINH);

            }
            catch (Exception ex)
            {
                MessageBox.Show(" Vật tư không đủ số lượng", "", MessageBoxButtons.OK);
                return;
            }
            changeStatusInit(false);
        }


        private void cT_PHATSINHGridControl_Click(object sender, EventArgs e)
        {
            if (bdsCTPS.Count > 0)
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = true;
            }
            else
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = false;
            }
        }

        private void pHATSINHGridControl_Click(object sender, EventArgs e)
        {
            if (bdsPS.Count > 0)
            {
                btnAdd.Enabled = btnEdit.Enabled = btnExit.Enabled = btnDelete.Enabled = true;
            }
            else
            {
                btnEdit.Enabled = btnExit.Enabled = btnDelete.Enabled = false;
            }
            if (bdsCTPS.Count > 0)
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = true;
            }
            else
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = false;
            }

        }


        private int CheckMAPN(string phieu)
        {
            SqlConnection sqlConnection2 = new SqlConnection(Program.connstr);
            SqlCommand sqlCommand2 = sqlConnection2.CreateCommand();
            this.pHATSINHTableAdapter.Connection = sqlConnection2;
            sqlCommand2.CommandType = System.Data.CommandType.StoredProcedure;
            sqlCommand2.CommandText = "KTRA_TRUNGPHIEU";
            sqlCommand2.Parameters.Add(new SqlParameter("@PHIEU", phieu));
            SqlParameter sqlParameter2 = new SqlParameter("@return", System.Data.SqlDbType.Int, sizeof(int));
            sqlParameter2.Direction = System.Data.ParameterDirection.ReturnValue;
            sqlCommand2.Parameters.Add(sqlParameter2);
            sqlConnection2.Open();
            sqlCommand2.ExecuteNonQuery();
            int result = (int)sqlCommand2.Parameters["@return"].Value;
            //Console.WriteLine(result);
            sqlConnection2.Close();
            return result;
        }

        private void btnCancelCTPS_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            bdsCTPS.CancelEdit();
            this.cT_PHATSINHTableAdapter.Fill(this.dS.CT_PHATSINH);
            changeStatusInit(false);
            if (bdsCTPS.Count > 0)
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = true;
            }
            else
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = false;
            }
        }

        private void btnCancelPS_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            bdsPS.CancelEdit();
            this.pHATSINHTableAdapter.FillBy2(this.dS.PHATSINH);
            changeStatusInit(false);
            if (bdsCTPS.Count > 0)
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = true;
            }
            else
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = false;
            }
            if (bdsCTPS.Count > 0)
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = true;
            }
            else
            {
                btnDeleteCTPS.Enabled = btnEditCTPS.Enabled = false;
            }
        }
    }
}