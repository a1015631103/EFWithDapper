using System;
using System.Collections.Generic;

namespace EFWithDapper.DB
{
    public partial class SysUser
    {
        /// <summary>
        /// 用户表
        /// </summary>
        public Guid Guid { get; set; }
        /// <summary>
        /// 登录名
        /// </summary>
        public string? LoginName { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        public string? Password { get; set; }
        /// <summary>
        /// 昵称
        /// </summary>
        public string? Name { get; set; }
        /// <summary>
        /// 类型 0代表超级管理员，1代表其他用户
        /// </summary>
        public int? Type { get; set; }
        /// <summary>
        /// 状态,默认设置为1
        /// </summary>
        public int? Status { get; set; }
        /// <summary>
        /// 禁用/启用，1代表启用，2代表禁用
        /// </summary>
        public int? Enabled { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? CreateTime { get; set; }
        /// <summary>
        /// 1代表前台注册，2代表后台添加
        /// </summary>
        public int RegType { get; set; }
        /// <summary>
        /// 1代表已经删除，2代表没有删除
        /// </summary>
        public int IsDelete { get; set; }
        /// <summary>
        /// 注册邮箱
        /// </summary>
        public string? RegEmail { get; set; }
        /// <summary>
        /// 注册手机
        /// </summary>
        public string? RegPhone { get; set; }
    }
}
