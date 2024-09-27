using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace de1.UserControl
{
    public partial class ucManageBeverage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAddNew_Click(object sender, EventArgs e)
        {
            string filename = "";
            if (FileUploadPicture.HasFile)
            {
                filename = FileUploadPicture.FileName;
                FileUploadPicture.SaveAs(Server.MapPath("~/images/Beverages/" + filename));
            }

            QLDoUongEntities1 context = new QLDoUongEntities1();
            Beverage b = new Beverage();
            // Không cần gán giá trị cho ProductID nếu nó là cột tự động tăng (identity)
            b.Name = TextBoxName.Text;
            b.Price = decimal.Parse(TextBoxPrice.Text);
            b.Description = TextBoxDescription.Text;
            b.CatID = int.Parse(DropDownListCategory.SelectedValue);
            b.ImageFilePath = filename;

            context.Beverages.Add(b);
            context.SaveChanges();

            //BindGridView(); // Cập nhật lại dữ liệu trong GridView
            Page.Master.DataBind();
        }
    }
}