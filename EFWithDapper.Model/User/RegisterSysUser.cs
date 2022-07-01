using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.Model.User
{
    public class RegisterSysUser
    {
        /// <summary>
        /// 登录名
        /// </summary>
        public string LoginName { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        public string Password { get; set; }
        /// <summary>
        /// 昵称
        /// </summary>
        public string NickName { get; set; }
        /// <summary>
        /// 注册邮箱
        /// </summary>
        public string RegEmail { get; set; }
        /// <summary>
        /// 注册手机
        /// </summary>
        public string RegPhone { get; set; }
        /// <summary>
        /// 角色Id
        /// </summary>
        public int RoleId { get; set; }
        /// <summary>
        /// 1代表男，2代表女，3代表保密
        /// </summary>
        public int Sex { get; set; }
        /// <summary>
        /// 出生日期
        /// </summary>
        public string BorthDay { get; set; }
        /// <summary>
        /// 1代表小学2代表初中，3代表高中，4代表大专5代表本科，6代表硕士研究生，7代表博士研究生以上
        /// </summary>
        public int EducationBackground { get; set; }
        /// <summary>
        /// 1代表学生，2代表在职
        /// </summary>
        public int Employment { get; set; }
    }
}
