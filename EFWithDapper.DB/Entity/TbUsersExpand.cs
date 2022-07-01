using System;
using System.Collections.Generic;

namespace EFWithDapper.DB
{
    /// <summary>
    /// 用户扩展表
    /// </summary>
    public partial class TbUsersExpand
    {
        public int Id { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? CreateDate { get; set; }
        /// <summary>
        /// 最近登录时间
        /// </summary>
        public DateTime? LastDate { get; set; }
        /// <summary>
        /// 最近登录IP
        /// </summary>
        public string? LastIp { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string? Remark { get; set; }
        /// <summary>
        /// 关联后台系统用户表ID
        /// </summary>
        public Guid? SysUserId { get; set; }
        /// <summary>
        /// 1代表男，2代表女，3代表保密
        /// </summary>
        public int? Sex { get; set; }
        /// <summary>
        /// 生日
        /// </summary>
        public DateTime? BorthDay { get; set; }
        /// <summary>
        /// 1代表小学2代表初中，3代表高中，4代表大专5代表本科，6代表硕士研究生，7代表博士研究生以上
        /// </summary>
        public int? EducationBackground { get; set; }
        /// <summary>
        /// 1代表学生，2代表在职
        /// </summary>
        public int? Employment { get; set; }
        public string? PersonPhotoPath { get; set; }
        public double? BlueMoney { get; set; }
    }
}
