using RestSharp;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;

namespace testws
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var client = new RestClient();
            client.Timeout = - 1;

            //client.Timeout = -1;
            IRestRequest request = new RestRequest("https://aswe.santafe.gov.ar/proxy.php/iapos/afiliados", Method.POST);
            request.AddHeader("Content-Type", "application/xml");
            var body = @"<soapenv:Envelope xmlns:soapenv=""http://schemas.xmlsoap.org/soap/envelope/"" xmlns:iap=""IAPOS_WS"">
" + "\n" +
            @"   <soapenv:Header/>
" + "\n" +
            @"   <soapenv:Body>
" + "\n" +
            @"      <iap:BEWsValidaAfi.Execute>
" + "\n" +
            @"         <iap:Usuario>ctobioqlitoralnorte</iap:Usuario>
" + "\n" +
            @"         <iap:Passwd>12345</iap:Passwd>
" + "\n" +
            @"         <iap:Nafiliado>22686435</iap:Nafiliado>
" + "\n" +
            @"         <iap:Badocnumdo></iap:Badocnumdo>
" + "\n" +
            @"         <iap:Tidocodigo_de_documento></iap:Tidocodigo_de_documento>
" + "\n" +
            @"         <iap:Ogorcodigo></iap:Ogorcodigo>
" + "\n" +
            @"         <iap:Fechpresta></iap:Fechpresta>
" + "\n" +
            @"      </iap:BEWsValidaAfi.Execute>
" + "\n" +
            @"   </soapenv:Body>
" + "\n" +
            @"</soapenv:Envelope>
" + "\n" +
            @"";
            request.AddParameter("application/xml", body, ParameterType.RequestBody);
            //var response = client.Execute(request);
            IRestResponse response = client.Execute(request);
            textBox1.Text = response.Content + " SSSS";
            /*
            XmlDocument xmlDoc = new XmlDocument(); // Create an XML document object
            xmlDoc.LoadXml(response.Content); // Load the XML document from the specified file

            // Get elements
            XmlNodeList apnom = xmlDoc.GetElementsByTagName("Apenom");
            XmlNodeList estado = xmlDoc.GetElementsByTagName("Estado");

            label1.Text = apnom[0].InnerText + " - " + estado[0].InnerText;

            */
            //Console.WriteLine(response.Content);
        }
    }
}
