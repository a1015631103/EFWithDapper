using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.Model
{
    public class PageParam
    {
        /// <summary>
        /// 1为第一页，2为第二页，以此类推
        /// </summary>
        public int PageIndex { get; set; }
        /// <summary>
        /// 一页有多少条记录
        /// </summary>
        public int PageSize { get; set; }
    }
}
