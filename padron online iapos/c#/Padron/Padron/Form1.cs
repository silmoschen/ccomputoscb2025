using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Padron
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();

            listBox1.Items.Add("update medicos set estado = 'S' where codos = '" + codos.Text + "';");

            string ubicacionArchivo = arch.Text;
            System.IO.StreamReader archivo = new System.IO.StreamReader(ubicacionArchivo);
            char separador = ';';
            string linea;
            // Si el archivo no tiene encabezado, elimina la siguiente línea
            archivo.ReadLine(); // Leer la primera línea pero descartarla porque es el encabezado
            while ((linea = archivo.ReadLine()) != null)
            {
                if (linea == "") break;

                string[] fila = linea.Split(separador);                
                string p0 = fila[0];
                string p1 = fila[1];
                string p2 = fila[2];
                string p3 = fila[3];
                string p4 = fila[4];
                string p5 = fila[5];

                string l1 = "insert ignore medicos values ('" + codos.Text + "','" + p0 + p1 + p2 + "\'" + "," + "\"" + p3 + "\",'" + p4 + "','" + p1 + "','" + p2 + "'" + "," + "'N');";
                string l2 = "update medicos set estado= 'N' where codos='" + codos.Text + "'  and idprof = " + p0 + p1 + p2 + "\";";
                listBox1.Items.Add(l1);
                listBox1.Items.Add(l2);              

            }

            string sPath = "z:\\prescriptores_" + codos.Text + ".sql";

            System.IO.File.WriteAllLines(sPath, listBox1.Items.Cast<string>().ToArray());


        }
    }
}
