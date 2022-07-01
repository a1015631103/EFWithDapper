using System;
using System.Collections.Generic;

namespace EFWithDapper.DB
{
    public partial class SysRole
    {
        /// <summary>
        /// 角色表
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 角色名称
        /// </summary>
        public string? Name { get; set; }
        /// <summary>
        /// 描述
        /// </summary>
        public string? Description { get; set; }
        /// <summary>
        /// 等级
        /// </summary>
        public int? Level { get; set; }
        /// <summary>
        /// 类型
        /// </summary>
        public int? Type { get; set; }
        /// <summary>
        /// 禁用/启用
        /// </summary>
        public int? Enabled { get; set; }
    }
}
