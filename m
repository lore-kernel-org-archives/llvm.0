Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCBF79CB;
	Wed, 30 Aug 2023 20:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693426307; x=1724962307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1DEFSLixb588Ug3zRlJXrkJ7xnE7obgDoc+jX8nBkA=;
  b=afMCNXU7DCbs2UktWjJSOplFisyI2dwZa7v3i0yEXJh0priEItnjkYH1
   D2Uh8leU+/0k12R+uqz+VoGc3AM408n4735kgE+2QB2hMZfc+vsioOmSt
   9hlwslIXYL1gKgLgIMdKYjLzI600/GIiVC13XUWO6id+gEX61qXfA+cL/
   DSHaaCl/uMUzoYZ9ibnr8dF6VOARwAKmB13KsAb4V1DONEsvt0DktA1sc
   4Zpi0MkJDxJJfiraQyq7iDCLQso8KLbRJDAlth7k07t1Cq5zSR0CvcX5D
   sdFSNmHb+8OTWnwNz4/lLN30jdmYqqcW71Z88vRr52M8lSZnShdPJBcYW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="375692241"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="375692241"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 13:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809281968"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="809281968"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2023 13:11:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbRXS-000ABj-1Y;
	Wed, 30 Aug 2023 20:11:42 +0000
Date: Thu, 31 Aug 2023 04:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctl-next 1/5] kernel/bpf/cgroup.c:1686: warning: Function
 parameter or member 'file' not described in '__cgroup_bpf_run_filter_sysctl'
Message-ID: <202308310424.VGkxiGAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctl-next
head:   5db649a3f876dee97af2da8462e4314424a04675
commit: b3d9978143d4fa8d26fb6efee0a4e615ad987715 [1/5] sysctl: API extension for handling sysctl
config: i386-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310424.VGkxiGAT-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310424.VGkxiGAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310424.VGkxiGAT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/cgroup.c:795: warning: Function parameter or member 'new_prog' not described in '__cgroup_bpf_replace'
   kernel/bpf/cgroup.c:795: warning: Excess function parameter 'type' description in '__cgroup_bpf_replace'
   kernel/bpf/cgroup.c:1359: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_skb'
   kernel/bpf/cgroup.c:1359: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_skb'
   kernel/bpf/cgroup.c:1439: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sk'
   kernel/bpf/cgroup.c:1439: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sk'
   kernel/bpf/cgroup.c:1467: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sock_addr'
   kernel/bpf/cgroup.c:1467: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sock_addr'
   kernel/bpf/cgroup.c:1512: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sock_ops'
   kernel/bpf/cgroup.c:1512: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sock_ops'
>> kernel/bpf/cgroup.c:1686: warning: Function parameter or member 'file' not described in '__cgroup_bpf_run_filter_sysctl'
   kernel/bpf/cgroup.c:1686: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sysctl'
   kernel/bpf/cgroup.c:1686: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sysctl'


vim +1686 kernel/bpf/cgroup.c

7b146cebe30cb4 Andrey Ignatov          2019-02-27  1659  
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1660  /**
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1661   * __cgroup_bpf_run_filter_sysctl - Run a program on sysctl
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1662   *
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1663   * @head: sysctl table header
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1664   * @table: sysctl table
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1665   * @write: sysctl is being read (= 0) or written (= 1)
32927393dc1ccd Christoph Hellwig       2020-04-24  1666   * @buf: pointer to buffer (in and out)
4e63acdff86465 Andrey Ignatov          2019-03-07  1667   * @pcount: value-result argument: value is size of buffer pointed to by @buf,
4e63acdff86465 Andrey Ignatov          2019-03-07  1668   *	result is size of @new_buf if program set new value, initial value
4e63acdff86465 Andrey Ignatov          2019-03-07  1669   *	otherwise
e1550bfe0de47e Andrey Ignatov          2019-03-07  1670   * @ppos: value-result argument: value is position at which read from or write
e1550bfe0de47e Andrey Ignatov          2019-03-07  1671   *	to sysctl is happening, result is new position if program overrode it,
e1550bfe0de47e Andrey Ignatov          2019-03-07  1672   *	initial value otherwise
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1673   * @type: type of program to be executed
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1674   *
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1675   * Program is run when sysctl is being accessed, either read or written, and
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1676   * can allow or deny such access.
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1677   *
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1678   * This function will return %-EPERM if an attached program is found and
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1679   * returned value != 1 during execution. In all other cases 0 is returned.
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1680   */
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1681  int __cgroup_bpf_run_filter_sysctl(struct ctl_table_header *head,
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1682  				   struct ctl_table *table, int write,
b3d9978143d4fa Alexey Gladkov          2022-05-16  1683  				   struct file *file,
4bd6a7353ee146 Matthew Wilcox (Oracle  2020-09-03  1684) 				   char **buf, size_t *pcount, loff_t *ppos,
6fc88c354f3af8 Dave Marchevsky         2021-08-19  1685  				   enum cgroup_bpf_attach_type atype)
7b146cebe30cb4 Andrey Ignatov          2019-02-27 @1686  {
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1687  	struct bpf_sysctl_kern ctx = {
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1688  		.head = head,
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1689  		.table = table,
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1690  		.write = write,
e1550bfe0de47e Andrey Ignatov          2019-03-07  1691  		.ppos = ppos,
1d11b3016cec4e Andrey Ignatov          2019-02-28  1692  		.cur_val = NULL,
1d11b3016cec4e Andrey Ignatov          2019-02-28  1693  		.cur_len = PAGE_SIZE,
4e63acdff86465 Andrey Ignatov          2019-03-07  1694  		.new_val = NULL,
4e63acdff86465 Andrey Ignatov          2019-03-07  1695  		.new_len = 0,
4e63acdff86465 Andrey Ignatov          2019-03-07  1696  		.new_updated = 0,
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1697  	};
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1698  	struct cgroup *cgrp;
32927393dc1ccd Christoph Hellwig       2020-04-24  1699  	loff_t pos = 0;
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1700  	int ret;
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1701  
1d11b3016cec4e Andrey Ignatov          2019-02-28  1702  	ctx.cur_val = kmalloc_track_caller(ctx.cur_len, GFP_KERNEL);
b3d9978143d4fa Alexey Gladkov          2022-05-16  1703  	if (ctx.cur_val) {
b3d9978143d4fa Alexey Gladkov          2022-05-16  1704  		ret = -EINVAL;
b3d9978143d4fa Alexey Gladkov          2022-05-16  1705  		if (table->fops.read)
b3d9978143d4fa Alexey Gladkov          2022-05-16  1706  			ret = table->fops.read(file, ctx.cur_val, &ctx.cur_len, &pos);
b3d9978143d4fa Alexey Gladkov          2022-05-16  1707  		else if (table->proc_handler)
b3d9978143d4fa Alexey Gladkov          2022-05-16  1708  			ret  = table->proc_handler(table, 0, ctx.cur_val, &ctx.cur_len, &pos);
b3d9978143d4fa Alexey Gladkov          2022-05-16  1709  		if (ret) {
1d11b3016cec4e Andrey Ignatov          2019-02-28  1710  			/* Let BPF program decide how to proceed. */
1d11b3016cec4e Andrey Ignatov          2019-02-28  1711  			ctx.cur_len = 0;
1d11b3016cec4e Andrey Ignatov          2019-02-28  1712  		}
b3d9978143d4fa Alexey Gladkov          2022-05-16  1713  	}
1d11b3016cec4e Andrey Ignatov          2019-02-28  1714  
32927393dc1ccd Christoph Hellwig       2020-04-24  1715  	if (write && *buf && *pcount) {
4e63acdff86465 Andrey Ignatov          2019-03-07  1716  		/* BPF program should be able to override new value with a
4e63acdff86465 Andrey Ignatov          2019-03-07  1717  		 * buffer bigger than provided by user.
4e63acdff86465 Andrey Ignatov          2019-03-07  1718  		 */
4e63acdff86465 Andrey Ignatov          2019-03-07  1719  		ctx.new_val = kmalloc_track_caller(PAGE_SIZE, GFP_KERNEL);
51356ac89b5a15 Andrey Ignatov          2019-04-12  1720  		ctx.new_len = min_t(size_t, PAGE_SIZE, *pcount);
32927393dc1ccd Christoph Hellwig       2020-04-24  1721  		if (ctx.new_val) {
32927393dc1ccd Christoph Hellwig       2020-04-24  1722  			memcpy(ctx.new_val, *buf, ctx.new_len);
32927393dc1ccd Christoph Hellwig       2020-04-24  1723  		} else {
4e63acdff86465 Andrey Ignatov          2019-03-07  1724  			/* Let BPF program decide how to proceed. */
4e63acdff86465 Andrey Ignatov          2019-03-07  1725  			ctx.new_len = 0;
4e63acdff86465 Andrey Ignatov          2019-03-07  1726  		}
32927393dc1ccd Christoph Hellwig       2020-04-24  1727  	}
4e63acdff86465 Andrey Ignatov          2019-03-07  1728  
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1729  	rcu_read_lock();
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1730  	cgrp = task_dfl_cgroup(current);
d9d31cf88702ae Stanislav Fomichev      2022-04-25  1731  	ret = bpf_prog_run_array_cg(&cgrp->bpf, atype, &ctx, bpf_prog_run, 0,
d9d31cf88702ae Stanislav Fomichev      2022-04-25  1732  				    NULL);
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1733  	rcu_read_unlock();
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1734  
1d11b3016cec4e Andrey Ignatov          2019-02-28  1735  	kfree(ctx.cur_val);
1d11b3016cec4e Andrey Ignatov          2019-02-28  1736  
4e63acdff86465 Andrey Ignatov          2019-03-07  1737  	if (ret == 1 && ctx.new_updated) {
32927393dc1ccd Christoph Hellwig       2020-04-24  1738  		kfree(*buf);
32927393dc1ccd Christoph Hellwig       2020-04-24  1739  		*buf = ctx.new_val;
4e63acdff86465 Andrey Ignatov          2019-03-07  1740  		*pcount = ctx.new_len;
4e63acdff86465 Andrey Ignatov          2019-03-07  1741  	} else {
4e63acdff86465 Andrey Ignatov          2019-03-07  1742  		kfree(ctx.new_val);
4e63acdff86465 Andrey Ignatov          2019-03-07  1743  	}
4e63acdff86465 Andrey Ignatov          2019-03-07  1744  
f10d059661968b YiFei Zhu               2021-12-16  1745  	return ret;
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1746  }
7b146cebe30cb4 Andrey Ignatov          2019-02-27  1747  

:::::: The code at line 1686 was first introduced by commit
:::::: 7b146cebe30cb481b0f70d85779da938da818637 bpf: Sysctl hook

:::::: TO: Andrey Ignatov <rdna@fb.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
