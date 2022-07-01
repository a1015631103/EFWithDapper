using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.Model.User
{
    public class SysUserInfo
    {
        public Guid Guid { get; set; }
        /// <summary>
        /// 登录名
        /// </summary>
        public string LoginName { get; set; }
        /// <summary>
        /// 昵称
        /// </summary>
        public string NickName { get; set; }
        /// <summary>
        /// 启用/禁用
        /// </summary>
        public int Enabled { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        public DateTime CreateTime { get; set; }
        /// <summary>
        /// 注册邮箱
        /// </summary>
        public string RegEmail { get; set; }
        /// <summary>
        /// 注册手机
        /// </summary>
        public string RegPhone { get; set; }

    }
}
