using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Canva.Models
{
    public static class ModelHelper
    {
        public static string ProfessionDropdown(List<Profession> professionList, int? id)
        {
            string html = string.Empty;
            try
            {
                html = "<select name=\"registerModel.ProfessionId\" id=\"registerModel.ProfessionId\" class=\"select\">";
                html += "<option value=\"0\">--select profession--</option>";
                if (professionList != null && professionList.Count > 0)
                {
                    foreach (var item in professionList)
                    {
                        if (id != null && id.Value > 0 && id.Value == item.Id)
                        {
                            html += "<option value=\"" + item.Id + "\" selected>" + item.Name + "</option>";
                        }
                        html += "<option value=\"" + item.Id + "\">" + item.Name + "</option>";
                    }
                }
                html += "</select>";
                return html;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public static void SendEmail(string _to, string _subject, string _body)
        {
            try
            {
                string from = "hassamsherazi05@gmail.com"; //Replace this with your own correct Gmail Address
                string[] tempfrom = from.Split('@');

                string to = _to; //Replace this with the Email Address to whom you want to send the mail
                string body = _body;
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.To.Add(to);
                mail.From = new MailAddress(from, "AdCreator", System.Text.Encoding.UTF8);
                mail.Subject = _subject;
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = body;
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;

                SmtpClient client = new SmtpClient();
                //Add the Creddentials- use your own email id and password

                client.Credentials = new System.Net.NetworkCredential(from, "Umt_078000");

                // Gmail works on this port
                if (tempfrom[1] == "gmail.com")
                {
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                }
                else if (tempfrom[1] == "yahoo.com")
                {
                    client.Port = 465;
                    client.Host = "smtp.mail.yahoo.com";
                }
                else
                {
                    client.Host = "mail.Messagemuse.com";
                    client.Port = 25;
                }
                client.EnableSsl = true; //Gmail works on Server Secured Layer
                client.Send(mail);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
