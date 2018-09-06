using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MembrRegister
{
    public partial class Member : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("txtName");
                dt.Columns.Add("txtEmailId");
                dt.Columns.Add("txtPhoneNo");
                dt.Columns.Add("txtAddress");
                dt.Rows.Add("Deepa", "deepabarhia@gmail.com", "0764146142", "Västerås");
                dt.Rows.Add("Sara", "sara@gmail.com", "0764146142", "Stockholm");
                dt.Rows.Add("Lisa", "lisa@gmail.com", "0764146142", "Uppsala");
                dt.Rows.Add("Michal", "michal@gmail.com", "0764146142", "Umeå");
                ViewState["dt"] = dt;
                BindGrid();
            }
        }
        protected void BindGrid()
        {
            GridView1.DataSource = ViewState["dt"] as DataTable;
            GridView1.DataBind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void OnUpdate(object sender, EventArgs e)
        {
            GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
            string memname = ((TextBox)row.Cells[0].Controls[0]).Text;
            string mememailid = ((TextBox)row.Cells[1].Controls[0]).Text;
            string memphone_no = ((TextBox)row.Cells[2].Controls[0]).Text;
            string memaddress = ((TextBox)row.Cells[3].Controls[0]).Text;

            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows[row.RowIndex]["txtName"] = memname;
            dt.Rows[row.RowIndex]["txtEmailId"] = mememailid;
            dt.Rows[row.RowIndex]["txtPhoneNo"] = memphone_no;
            dt.Rows[row.RowIndex]["txtAddress"] = memaddress;
            ViewState["dt"] = dt;
            GridView1.EditIndex = -1;
            BindGrid();
        }
        protected void OnCancel(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }
        protected void OnDelete(object sender, EventArgs e)
        {
            GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows.RemoveAt(row.RowIndex);
            ViewState["dt"] = dt;
            BindGrid();
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows.Add(txtName.Text, txtEmailId.Text, txtPhoneNo.Text, txtAddress.Text);
            ViewState["dt"] = dt;
            BindGrid();
            txtName.Text = string.Empty;
            txtEmailId.Text = string.Empty;
            txtPhoneNo.Text = string.Empty;
            txtAddress.Text = string.Empty;
        }
    }
}