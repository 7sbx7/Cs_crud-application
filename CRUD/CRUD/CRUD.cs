using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CRUD
{
    public partial class CRUD : Form
    {

        string conString = "Data Source=DESKTOP-L35R0MK\\MSSQLSERVER01;Initial Catalog = computerCaseShop; Integrated Security = True";
        SqlConnection sqlCon;

        public DateTime saleDate
        {
            get;set;
        }

        public CRUD()
        {
            InitializeComponent();
            sqlCon = new SqlConnection(conString);
            sqlCon.Open();

        }



        private void CRUD_Load(object sender, EventArgs e)
        {
            loadData();
            gridView.ClearSelection();
        }

        private void loadData()
        {
            DataTable dataTable = new DataTable();
            using (SqlCommand sqlComm = new SqlCommand("exec selectAll", sqlCon))
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    SqlDataReader reader = sqlComm.ExecuteReader();
                    dataTable.Load(reader);
                    gridView.DataSource = dataTable;
                    
                }
            }
        }

        private void deleteData()
        {
            using (SqlCommand sqlComm = new SqlCommand("deleteSale", sqlCon))
            {
                if(sqlCon.State == ConnectionState.Open)
                {
                    SqlParameter parameter = new SqlParameter();
                    parameter.ParameterName = "@saleid";
                    parameter.SqlDbType = SqlDbType.Int;
                    parameter.Value = int.Parse(gridView.SelectedRows[0].Cells[0].Value.ToString());
                    sqlComm.Parameters.Add(parameter);
                    sqlComm.CommandType = CommandType.StoredProcedure;
                    sqlComm.ExecuteNonQuery();
                }
            }
        }

   
        private void insertData()
        {
            using (SqlCommand sqlComm = new SqlCommand("insertSale", sqlCon))
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    try
                    {
                            SqlParameter clientid = new SqlParameter();
                            clientid.ParameterName = "@clientid";
                            clientid.SqlDbType = SqlDbType.Int;
                            clientid.Value = int.Parse(klient_id.Text);
                            sqlComm.Parameters.Add(clientid);
                       
                      
                            SqlParameter caseid = new SqlParameter();
                            caseid.ParameterName = "@caseid";
                            caseid.SqlDbType = SqlDbType.Int;
                            caseid.Value = int.Parse(obudowa_id.Text);
                            sqlComm.Parameters.Add(caseid);
                       

                     
                            SqlParameter workerid = new SqlParameter();
                            workerid.ParameterName = "@workerid";
                            workerid.SqlDbType = SqlDbType.Int;
                            workerid.Value = int.Parse(sprzedawca_id.Text);
                            sqlComm.Parameters.Add(workerid);
                      

                            SqlParameter shipperid = new SqlParameter();
                            shipperid.ParameterName = "@shipperid";
                            shipperid.SqlDbType = SqlDbType.Int;
                            shipperid.Value = int.Parse(dostawca_id.Text);
                            sqlComm.Parameters.Add(shipperid);
                    

                            SqlParameter saledate = new SqlParameter();
                            saledate.ParameterName = "@saledate";
                            saledate.SqlDbType = SqlDbType.DateTime;
                            saledate.Value = new DateTime(saleDate.Year, saleDate.Month, saleDate.Day);
                            sqlComm.Parameters.Add(saledate);

                            sqlComm.CommandType = CommandType.StoredProcedure;
                            sqlComm.ExecuteNonQuery();
                    }
                    catch (FormatException format)
                    {
                        MessageBox.Show(format.Message);
                    }
                    catch (SqlException sqlexc)
                    {
                        MessageBox.Show(sqlexc.Message);
                    }

                }
            }
        }

        private void updateData()
        {
            using (SqlCommand sqlComm = new SqlCommand("updateSale", sqlCon))
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    try
                    {
                        SqlParameter saleid = new SqlParameter();
                        saleid.ParameterName = "@saleid";
                        saleid.SqlDbType = SqlDbType.Int;
                        saleid.Value = int.Parse(gridView.SelectedRows[0].Cells[0].Value.ToString());
                        sqlComm.Parameters.Add(saleid);


                        SqlParameter clientid = new SqlParameter();
                        clientid.ParameterName = "@clientid";
                        clientid.SqlDbType = SqlDbType.Int;
                        clientid.Value = int.Parse(klient_id.Text);
                        sqlComm.Parameters.Add(clientid);


                        SqlParameter caseid = new SqlParameter();
                        caseid.ParameterName = "@caseid";
                        caseid.SqlDbType = SqlDbType.Int;
                        caseid.Value = int.Parse(obudowa_id.Text);
                        sqlComm.Parameters.Add(caseid);



                        SqlParameter workerid = new SqlParameter();
                        workerid.ParameterName = "@workerid";
                        workerid.SqlDbType = SqlDbType.Int;
                        workerid.Value = int.Parse(sprzedawca_id.Text);
                        sqlComm.Parameters.Add(workerid);


                        SqlParameter shipperid = new SqlParameter();
                        shipperid.ParameterName = "@shipperid";
                        shipperid.SqlDbType = SqlDbType.Int;
                        shipperid.Value = int.Parse(dostawca_id.Text);
                        sqlComm.Parameters.Add(shipperid);


                        SqlParameter saledate = new SqlParameter();
                        saledate.ParameterName = "@saledate";
                        saledate.SqlDbType = SqlDbType.DateTime;
                        saledate.Value = new DateTime(saleDate.Year, saleDate.Month, saleDate.Day);
                        sqlComm.Parameters.Add(saledate);

                        sqlComm.CommandType = CommandType.StoredProcedure;
                        sqlComm.ExecuteNonQuery();
                    }
                    catch (FormatException format)
                    {
                        MessageBox.Show(format.Message);
                    }
                    catch (SqlException sqlexc)
                    {
                        MessageBox.Show(sqlexc.Message);
                    }

                }
            }
        }
        private void CRUD_FormClosing(object sender, FormClosingEventArgs e)
        {
            sqlCon.Close();
        }
        private void delete_btn_Click(object sender, EventArgs e)
        {
            if(gridView.SelectedRows.Count == 0)
            {
                MessageBox.Show("Nie wybrano rekordu!");
            }
            else
            {
                try 
                {
                    deleteData();
                    loadData();
                }
                catch (FormatException format)
                {
                    MessageBox.Show(format.Message);
                }
                catch (NullReferenceException nullRef)
                {
                    MessageBox.Show(nullRef.Message);
                }

            }
        }

        private void gridView_SelectionChanged(object sender, EventArgs e)
        {
           
            if (gridView.SelectedRows.Count != 0)
            {
                try
                {
                    klient_TB.Text = gridView.SelectedRows[0].Cells[1].Value.ToString();
                    case_TB.Text = gridView.SelectedRows[0].Cells[2].Value.ToString();
                    sprzedawca_TB.Text = gridView.SelectedRows[0].Cells[3].Value.ToString();
                    dostawca_TB.Text = gridView.SelectedRows[0].Cells[4].Value.ToString();
                    date_calendar.SetDate(DateTime.Parse(gridView.SelectedRows[0].Cells[5].Value.ToString()));
                    saleDate = DateTime.Parse(gridView.SelectedRows[0].Cells[5].Value.ToString());



                    using (SqlCommand sqlComm = new SqlCommand("idList", sqlCon))
                    {
                        SqlParameter saleid = new SqlParameter();
                        saleid.ParameterName = "@id";
                        saleid.SqlDbType = SqlDbType.Int;
                        saleid.Value = int.Parse(gridView.SelectedRows[0].Cells[0].Value.ToString());
                        sqlComm.Parameters.Add(saleid);
                        sqlComm.CommandType = CommandType.StoredProcedure;
                        sqlComm.ExecuteNonQuery();
                        SqlDataReader reader = sqlComm.ExecuteReader();
                        DataTable table = new DataTable();
                        table.Load(reader);
                        klient_id.Text = table.Rows[0][0].ToString();
                        obudowa_id.Text = table.Rows[0][1].ToString();
                        sprzedawca_id.Text = table.Rows[0][2].ToString();
                        dostawca_id.Text = table.Rows[0][3].ToString();

                    }
                }
                catch (FormatException format)
                {
                    MessageBox.Show(format.Message);
                }
                catch (NullReferenceException nullRef)
                {
                    MessageBox.Show(nullRef.Message);
                }
                catch (ArgumentOutOfRangeException rangeExc)
                {
                    MessageBox.Show(rangeExc.Message);
                }



            }
        }

        private void insert_btn_Click(object sender, EventArgs e)
        {
            insertData();
            loadData();
        }

        private void date_calendar_DateSelected(object sender, DateRangeEventArgs e)
        {
            saleDate = e.Start;
        }

   

        private void klient_podpowiedz_TextChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand sqlComm = new SqlCommand("clientIdToName", sqlCon))
                {
                    if (sqlCon.State == ConnectionState.Open)
                    {
                        if(klient_id.Text == "")
                        {
                            
                        }
                        else
                        {
                            SqlParameter parameter = new SqlParameter();
                            parameter.ParameterName = "@id";
                            parameter.SqlDbType = SqlDbType.Int;
                            parameter.Value = int.Parse(klient_id.Text.ToString());
                            sqlComm.Parameters.Add(parameter);
                            sqlComm.CommandType = CommandType.StoredProcedure;
                            sqlComm.ExecuteNonQuery();
                            SqlDataReader reader = sqlComm.ExecuteReader();
                            DataTable table = new DataTable();
                            table.Load(reader);
                            klient_TB.Text = table.Rows[0][0].ToString();
                        }
                       


                    }
                }

            }
            catch (SqlException sqlExc)
            {
                MessageBox.Show(sqlExc.Message);
            }
            catch (FormatException formatexc)
            {
                MessageBox.Show(formatexc.Message);
            }
        }

        private void obudowa_id_TextChanged(object sender, EventArgs e)
        {
            try
            {
            using (SqlCommand sqlComm = new SqlCommand("caseIdToName", sqlCon))
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    if (obudowa_id.Text == "")
                    {

                    }
                    else
                    {
                        SqlParameter parameter = new SqlParameter();
                        parameter.ParameterName = "@id";
                        parameter.SqlDbType = SqlDbType.Int;
                        parameter.Value = int.Parse(obudowa_id.Text.ToString());
                        sqlComm.Parameters.Add(parameter);
                        sqlComm.CommandType = CommandType.StoredProcedure;
                        sqlComm.ExecuteNonQuery();
                        SqlDataReader reader = sqlComm.ExecuteReader();
                        DataTable table = new DataTable();
                        table.Load(reader);
                        case_TB.Text = table.Rows[0][0].ToString();
                    }



                }
            }
            }
            catch (SqlException sqlExc)
            {
                MessageBox.Show(sqlExc.Message);
            }
            catch (FormatException formatexc)
            {
                MessageBox.Show(formatexc.Message);
            }

        }

        private void sprzedawca_id_TextChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand sqlComm = new SqlCommand("workerIdToName", sqlCon))
                {
                    if (sqlCon.State == ConnectionState.Open)
                    {
                        if (sprzedawca_id.Text == "")
                        {

                        }
                        else
                        {
                            SqlParameter parameter = new SqlParameter();
                            parameter.ParameterName = "@id";
                            parameter.SqlDbType = SqlDbType.Int;
                            parameter.Value = int.Parse(sprzedawca_id.Text.ToString());
                            sqlComm.Parameters.Add(parameter);
                            sqlComm.CommandType = CommandType.StoredProcedure;
                            sqlComm.ExecuteNonQuery();
                            SqlDataReader reader = sqlComm.ExecuteReader();
                            DataTable table = new DataTable();
                            table.Load(reader);
                            sprzedawca_TB.Text = table.Rows[0][0].ToString();
                        }



                    }
                }
            }
            catch (SqlException sqlExc)
            {
                MessageBox.Show(sqlExc.Message);
            }
            catch (FormatException formatexc)
            {
                MessageBox.Show(formatexc.Message);
            }
        }

        private void dostawca_id_TextChanged(object sender, EventArgs e)
        {
            try
            {
                using (SqlCommand sqlComm = new SqlCommand("shipperIdToName", sqlCon))
                {
                    if (sqlCon.State == ConnectionState.Open)
                    {
                        if (dostawca_id.Text == "")
                        {

                        }
                        else
                        {
                            SqlParameter parameter = new SqlParameter();
                            parameter.ParameterName = "@id";
                            parameter.SqlDbType = SqlDbType.Int;
                            parameter.Value = int.Parse(dostawca_id.Text.ToString());
                            sqlComm.Parameters.Add(parameter);
                            sqlComm.CommandType = CommandType.StoredProcedure;
                            sqlComm.ExecuteNonQuery();
                            SqlDataReader reader = sqlComm.ExecuteReader();
                            DataTable table = new DataTable();
                            table.Load(reader);
                            dostawca_TB.Text = table.Rows[0][0].ToString();
                        }



                    }
                }
            }
            catch (SqlException sqlExc)
            {
                MessageBox.Show(sqlExc.Message);
            }
            catch (FormatException formatexc)
            {
                MessageBox.Show(formatexc.Message);
            }
        }

        private void klienci_rb_CheckedChanged(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            using (SqlCommand sqlComm = new SqlCommand("exec clientIdAndName", sqlCon))
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    SqlDataReader reader = sqlComm.ExecuteReader();
                    dataTable.Load(reader);
                    helperGrid.DataSource = dataTable;

                }
            }
        }

        private void sprzedawcy_rb_CheckedChanged(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            using (SqlCommand sqlComm = new SqlCommand("exec workerIdAndName", sqlCon))
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    SqlDataReader reader = sqlComm.ExecuteReader();
                    dataTable.Load(reader);
                    helperGrid.DataSource = dataTable;

                }
            }
        }

        private void obudowy_rb_CheckedChanged(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            using (SqlCommand sqlComm = new SqlCommand("exec productIdAndName", sqlCon))
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    SqlDataReader reader = sqlComm.ExecuteReader();
                    dataTable.Load(reader);
                    helperGrid.DataSource = dataTable;

                }
            }
        }

        private void dostawcy_rb_CheckedChanged(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            using (SqlCommand sqlComm = new SqlCommand("exec shipperIdAndName", sqlCon))
            {
                if (sqlCon.State == ConnectionState.Open)
                {
                    SqlDataReader reader = sqlComm.ExecuteReader();
                    dataTable.Load(reader);
                    helperGrid.DataSource = dataTable;

                }
            }
        }

        private void update_BTN_Click(object sender, EventArgs e)
        {
            if (gridView.SelectedRows.Count == 0)
            {
                MessageBox.Show("Nie wybrano rekordu!");
            }
            else
            {
                try
                {
                    updateData();
                    loadData();
                }
                catch (FormatException format)
                {
                    MessageBox.Show(format.Message);
                }
                catch (NullReferenceException nullRef)
                {
                    MessageBox.Show(nullRef.Message);
                }

            }
        }
    }
}
