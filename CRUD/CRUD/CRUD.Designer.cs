namespace CRUD
{
    partial class CRUD
    {
        /// <summary>
        /// Wymagana zmienna projektanta.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Wyczyść wszystkie używane zasoby.
        /// </summary>
        /// <param name="disposing">prawda, jeżeli zarządzane zasoby powinny zostać zlikwidowane; Fałsz w przeciwnym wypadku.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Kod generowany przez Projektanta formularzy systemu Windows

        /// <summary>
        /// Metoda wymagana do obsługi projektanta — nie należy modyfikować
        /// jej zawartości w edytorze kodu.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CRUD));
            this.gridView = new System.Windows.Forms.DataGridView();
            this.klient_TB = new System.Windows.Forms.TextBox();
            this.sprzedawca_TB = new System.Windows.Forms.TextBox();
            this.dostawca_TB = new System.Windows.Forms.TextBox();
            this.case_TB = new System.Windows.Forms.TextBox();
            this.date_calendar = new System.Windows.Forms.MonthCalendar();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.insert_btn = new System.Windows.Forms.Button();
            this.update_BTN = new System.Windows.Forms.Button();
            this.delete_btn = new System.Windows.Forms.Button();
            this.klient_id = new System.Windows.Forms.TextBox();
            this.obudowa_id = new System.Windows.Forms.TextBox();
            this.sprzedawca_id = new System.Windows.Forms.TextBox();
            this.dostawca_id = new System.Windows.Forms.TextBox();
            this.klienci_rb = new System.Windows.Forms.RadioButton();
            this.sprzedawcy_rb = new System.Windows.Forms.RadioButton();
            this.obudowy_rb = new System.Windows.Forms.RadioButton();
            this.dostawcy_rb = new System.Windows.Forms.RadioButton();
            this.helperGrid = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.helperGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // gridView
            // 
            this.gridView.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gridView.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.gridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridView.Location = new System.Drawing.Point(60, 290);
            this.gridView.MultiSelect = false;
            this.gridView.Name = "gridView";
            this.gridView.ReadOnly = true;
            this.gridView.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridView.Size = new System.Drawing.Size(1276, 313);
            this.gridView.TabIndex = 0;
            this.gridView.SelectionChanged += new System.EventHandler(this.gridView_SelectionChanged);
            // 
            // klient_TB
            // 
            this.klient_TB.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.klient_TB.Location = new System.Drawing.Point(207, 31);
            this.klient_TB.Name = "klient_TB";
            this.klient_TB.ReadOnly = true;
            this.klient_TB.Size = new System.Drawing.Size(222, 29);
            this.klient_TB.TabIndex = 1;
            // 
            // sprzedawca_TB
            // 
            this.sprzedawca_TB.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.sprzedawca_TB.Location = new System.Drawing.Point(207, 120);
            this.sprzedawca_TB.Name = "sprzedawca_TB";
            this.sprzedawca_TB.ReadOnly = true;
            this.sprzedawca_TB.Size = new System.Drawing.Size(222, 29);
            this.sprzedawca_TB.TabIndex = 1;
            // 
            // dostawca_TB
            // 
            this.dostawca_TB.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.dostawca_TB.Location = new System.Drawing.Point(207, 164);
            this.dostawca_TB.Name = "dostawca_TB";
            this.dostawca_TB.ReadOnly = true;
            this.dostawca_TB.Size = new System.Drawing.Size(222, 29);
            this.dostawca_TB.TabIndex = 1;
            // 
            // case_TB
            // 
            this.case_TB.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.case_TB.Location = new System.Drawing.Point(207, 76);
            this.case_TB.Name = "case_TB";
            this.case_TB.ReadOnly = true;
            this.case_TB.Size = new System.Drawing.Size(222, 29);
            this.case_TB.TabIndex = 1;
            // 
            // date_calendar
            // 
            this.date_calendar.Location = new System.Drawing.Point(584, 31);
            this.date_calendar.MaxSelectionCount = 1;
            this.date_calendar.Name = "date_calendar";
            this.date_calendar.TabIndex = 2;
            this.date_calendar.DateSelected += new System.Windows.Forms.DateRangeEventHandler(this.date_calendar_DateSelected);
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.SystemColors.Info;
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label1.Font = new System.Drawing.Font("Arial Narrow", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label1.Location = new System.Drawing.Point(82, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(107, 29);
            this.label1.TabIndex = 3;
            this.label1.Text = "Klient";
            // 
            // label2
            // 
            this.label2.BackColor = System.Drawing.SystemColors.Info;
            this.label2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label2.Font = new System.Drawing.Font("Arial Narrow", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label2.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label2.Location = new System.Drawing.Point(82, 76);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(107, 29);
            this.label2.TabIndex = 3;
            this.label2.Text = "Obudowa";
            // 
            // label3
            // 
            this.label3.BackColor = System.Drawing.SystemColors.Info;
            this.label3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label3.Font = new System.Drawing.Font("Arial Narrow", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label3.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label3.Location = new System.Drawing.Point(82, 120);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(107, 29);
            this.label3.TabIndex = 3;
            this.label3.Text = "Sprzedawca";
            // 
            // label4
            // 
            this.label4.BackColor = System.Drawing.SystemColors.Info;
            this.label4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label4.Font = new System.Drawing.Font("Arial Narrow", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.label4.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label4.Location = new System.Drawing.Point(82, 164);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(107, 29);
            this.label4.TabIndex = 3;
            this.label4.Text = "Dostawca";
            // 
            // insert_btn
            // 
            this.insert_btn.Font = new System.Drawing.Font("Arial Narrow", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.insert_btn.Location = new System.Drawing.Point(84, 224);
            this.insert_btn.Name = "insert_btn";
            this.insert_btn.Size = new System.Drawing.Size(105, 38);
            this.insert_btn.TabIndex = 4;
            this.insert_btn.Text = "INSERT";
            this.insert_btn.UseVisualStyleBackColor = true;
            this.insert_btn.Click += new System.EventHandler(this.insert_btn_Click);
            // 
            // update_BTN
            // 
            this.update_BTN.Font = new System.Drawing.Font("Arial Narrow", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.update_BTN.Location = new System.Drawing.Point(262, 224);
            this.update_BTN.Name = "update_BTN";
            this.update_BTN.Size = new System.Drawing.Size(105, 38);
            this.update_BTN.TabIndex = 4;
            this.update_BTN.Text = "UPDATE";
            this.update_BTN.UseVisualStyleBackColor = true;
            this.update_BTN.Click += new System.EventHandler(this.update_BTN_Click);
            // 
            // delete_btn
            // 
            this.delete_btn.Font = new System.Drawing.Font("Arial Narrow", 14.25F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.delete_btn.Location = new System.Drawing.Point(443, 224);
            this.delete_btn.Name = "delete_btn";
            this.delete_btn.Size = new System.Drawing.Size(105, 38);
            this.delete_btn.TabIndex = 4;
            this.delete_btn.Text = "DELETE";
            this.delete_btn.UseVisualStyleBackColor = true;
            this.delete_btn.Click += new System.EventHandler(this.delete_btn_Click);
            // 
            // klient_id
            // 
            this.klient_id.Font = new System.Drawing.Font("Arial Narrow", 14.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.klient_id.Location = new System.Drawing.Point(448, 31);
            this.klient_id.Name = "klient_id";
            this.klient_id.Size = new System.Drawing.Size(100, 29);
            this.klient_id.TabIndex = 5;
            this.klient_id.TextChanged += new System.EventHandler(this.klient_podpowiedz_TextChanged);
            // 
            // obudowa_id
            // 
            this.obudowa_id.Font = new System.Drawing.Font("Arial Narrow", 14.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.obudowa_id.Location = new System.Drawing.Point(448, 76);
            this.obudowa_id.Name = "obudowa_id";
            this.obudowa_id.Size = new System.Drawing.Size(100, 29);
            this.obudowa_id.TabIndex = 5;
            this.obudowa_id.TextChanged += new System.EventHandler(this.obudowa_id_TextChanged);
            // 
            // sprzedawca_id
            // 
            this.sprzedawca_id.Font = new System.Drawing.Font("Arial Narrow", 14.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.sprzedawca_id.Location = new System.Drawing.Point(448, 120);
            this.sprzedawca_id.Name = "sprzedawca_id";
            this.sprzedawca_id.Size = new System.Drawing.Size(100, 29);
            this.sprzedawca_id.TabIndex = 5;
            this.sprzedawca_id.TextChanged += new System.EventHandler(this.sprzedawca_id_TextChanged);
            // 
            // dostawca_id
            // 
            this.dostawca_id.Font = new System.Drawing.Font("Arial Narrow", 14.25F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.dostawca_id.Location = new System.Drawing.Point(448, 164);
            this.dostawca_id.Name = "dostawca_id";
            this.dostawca_id.Size = new System.Drawing.Size(100, 29);
            this.dostawca_id.TabIndex = 5;
            this.dostawca_id.TextChanged += new System.EventHandler(this.dostawca_id_TextChanged);
            // 
            // klienci_rb
            // 
            this.klienci_rb.AutoSize = true;
            this.klienci_rb.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.klienci_rb.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.klienci_rb.Location = new System.Drawing.Point(1053, 224);
            this.klienci_rb.Name = "klienci_rb";
            this.klienci_rb.Size = new System.Drawing.Size(72, 24);
            this.klienci_rb.TabIndex = 6;
            this.klienci_rb.TabStop = true;
            this.klienci_rb.Text = "Klienci";
            this.klienci_rb.UseVisualStyleBackColor = false;
            this.klienci_rb.CheckedChanged += new System.EventHandler(this.klienci_rb_CheckedChanged);
            // 
            // sprzedawcy_rb
            // 
            this.sprzedawcy_rb.AutoSize = true;
            this.sprzedawcy_rb.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.sprzedawcy_rb.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.sprzedawcy_rb.Location = new System.Drawing.Point(1185, 224);
            this.sprzedawcy_rb.Name = "sprzedawcy_rb";
            this.sprzedawcy_rb.Size = new System.Drawing.Size(113, 24);
            this.sprzedawcy_rb.TabIndex = 6;
            this.sprzedawcy_rb.TabStop = true;
            this.sprzedawcy_rb.Text = "Sprzedawcy";
            this.sprzedawcy_rb.UseVisualStyleBackColor = false;
            this.sprzedawcy_rb.CheckedChanged += new System.EventHandler(this.sprzedawcy_rb_CheckedChanged);
            // 
            // obudowy_rb
            // 
            this.obudowy_rb.AutoSize = true;
            this.obudowy_rb.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.obudowy_rb.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.obudowy_rb.Location = new System.Drawing.Point(1053, 254);
            this.obudowy_rb.Name = "obudowy_rb";
            this.obudowy_rb.Size = new System.Drawing.Size(93, 24);
            this.obudowy_rb.TabIndex = 6;
            this.obudowy_rb.TabStop = true;
            this.obudowy_rb.Text = "Obudowy";
            this.obudowy_rb.UseVisualStyleBackColor = false;
            this.obudowy_rb.CheckedChanged += new System.EventHandler(this.obudowy_rb_CheckedChanged);
            // 
            // dostawcy_rb
            // 
            this.dostawcy_rb.AutoSize = true;
            this.dostawcy_rb.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.dostawcy_rb.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.dostawcy_rb.Location = new System.Drawing.Point(1185, 257);
            this.dostawcy_rb.Name = "dostawcy_rb";
            this.dostawcy_rb.Size = new System.Drawing.Size(96, 24);
            this.dostawcy_rb.TabIndex = 6;
            this.dostawcy_rb.TabStop = true;
            this.dostawcy_rb.Text = "Dostawcy";
            this.dostawcy_rb.UseVisualStyleBackColor = false;
            this.dostawcy_rb.CheckedChanged += new System.EventHandler(this.dostawcy_rb_CheckedChanged);
            // 
            // helperGrid
            // 
            this.helperGrid.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.helperGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.helperGrid.Location = new System.Drawing.Point(1002, 31);
            this.helperGrid.Name = "helperGrid";
            this.helperGrid.ReadOnly = true;
            this.helperGrid.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.helperGrid.Size = new System.Drawing.Size(334, 187);
            this.helperGrid.TabIndex = 7;
            // 
            // CRUD
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(1391, 632);
            this.Controls.Add(this.helperGrid);
            this.Controls.Add(this.dostawcy_rb);
            this.Controls.Add(this.obudowy_rb);
            this.Controls.Add(this.sprzedawcy_rb);
            this.Controls.Add(this.klienci_rb);
            this.Controls.Add(this.dostawca_id);
            this.Controls.Add(this.sprzedawca_id);
            this.Controls.Add(this.obudowa_id);
            this.Controls.Add(this.klient_id);
            this.Controls.Add(this.delete_btn);
            this.Controls.Add(this.update_BTN);
            this.Controls.Add(this.insert_btn);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.date_calendar);
            this.Controls.Add(this.case_TB);
            this.Controls.Add(this.dostawca_TB);
            this.Controls.Add(this.sprzedawca_TB);
            this.Controls.Add(this.klient_TB);
            this.Controls.Add(this.gridView);
            this.Name = "CRUD";
            this.Text = "CRUD";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.CRUD_FormClosing);
            this.Load += new System.EventHandler(this.CRUD_Load);
            ((System.ComponentModel.ISupportInitialize)(this.gridView)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.helperGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView gridView;
        private System.Windows.Forms.TextBox klient_TB;
        private System.Windows.Forms.TextBox sprzedawca_TB;
        private System.Windows.Forms.TextBox dostawca_TB;
        private System.Windows.Forms.TextBox case_TB;
        private System.Windows.Forms.MonthCalendar date_calendar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button insert_btn;
        private System.Windows.Forms.Button update_BTN;
        private System.Windows.Forms.Button delete_btn;
        private System.Windows.Forms.TextBox klient_id;
        private System.Windows.Forms.TextBox obudowa_id;
        private System.Windows.Forms.TextBox sprzedawca_id;
        private System.Windows.Forms.TextBox dostawca_id;
        private System.Windows.Forms.RadioButton klienci_rb;
        private System.Windows.Forms.RadioButton sprzedawcy_rb;
        private System.Windows.Forms.RadioButton obudowy_rb;
        private System.Windows.Forms.RadioButton dostawcy_rb;
        private System.Windows.Forms.DataGridView helperGrid;
    }
}

