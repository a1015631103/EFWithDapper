using System;
using System.Collections.Generic;

namespace EFWithDapper.DB
{
    public partial class SysRoleInUser
    {
        /// <summary>
        /// 用户角色表
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 角色表Id
        /// </summary>
        public int? RoleId { get; set; }
        /// <summary>
        /// 用户表Id
        /// </summary>
        public Guid? UserGuid { get; set; }
    }
}
