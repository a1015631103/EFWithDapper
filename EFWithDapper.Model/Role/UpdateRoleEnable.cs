using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFWithDapper.Model.Role
{
    public class UpdateRoleEnable
    {
        public List<int>? RoleIdList { get; set; }

        public int Enable { get; set; }
    }
}
