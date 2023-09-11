Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507BDC8C3;
	Mon, 11 Sep 2023 11:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694431503; x=1725967503;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mQ18HF8CxAHMvt6q6+349EE7f3bgZdnvZXZpld8oC/Y=;
  b=SxuAzOegGD3yZXLxZhH3gpmNqNzQ5Ybz+pId+sDMWtzCEF+2THA7vxU4
   tEBagF7qj+bPn5SEh39qZOcPfYR9Ra7m9I54sTbJAs2RwRIR5ZfZLvANQ
   INSkJJy5ZPYQ/32A035E0kqKkLZ/c6buagAJ4H3GqfuS2EqPghj0exLQh
   lwxMVRcZqqe3rX02NqI67wpafjyObcNF/i4E3NosnbYxEghK5l+8pQzMx
   oqi+6TT7oi2/wsrUx58UzgXgNI/2mdFHBWu4MVS7kuhVqlSftydny3ae4
   o77LjN0QAlnHqS0eUgS7fg0RvqZLdExpNRiKN1VYVlHp9Uwg1meiElU7K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="363078869"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="363078869"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 04:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="719958933"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="719958933"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Sep 2023 04:25:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qff2I-00068z-0F;
	Mon, 11 Sep 2023 11:24:58 +0000
Date: Mon, 11 Sep 2023 19:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Yakunin, Dmitry (Nebius)" <zeil@nebius.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] cgroup: list all subsystem states in debugfs
 files
Message-ID: <202309111928.paKg0L1X-lkp@intel.com>
References: <20230911075437.74027-2-zeil@nebius.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911075437.74027-2-zeil@nebius.com>

Hi Dmitry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6-rc1 next-20230911]
[cannot apply to tj-cgroup/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yakunin-Dmitry-Nebius/cgroup-list-all-subsystem-states-in-debugfs-files/20230911-155716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230911075437.74027-2-zeil%40nebius.com
patch subject: [RFC PATCH 1/3] cgroup: list all subsystem states in debugfs files
config: hexagon-randconfig-002-20230911 (https://download.01.org/0day-ci/archive/20230911/202309111928.paKg0L1X-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111928.paKg0L1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111928.paKg0L1X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/cgroup/cgroup.c:31:
   In file included from kernel/cgroup/cgroup-internal.h:5:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from kernel/cgroup/cgroup.c:31:
   In file included from kernel/cgroup/cgroup-internal.h:5:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from kernel/cgroup/cgroup.c:31:
   In file included from kernel/cgroup/cgroup-internal.h:5:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> kernel/cgroup/cgroup.c:7078:7: warning: no previous prototype for function 'css_debugfs_seqfile_start' [-Wmissing-prototypes]
    7078 | void *css_debugfs_seqfile_start(struct seq_file *m, loff_t *pos)
         |       ^
   kernel/cgroup/cgroup.c:7078:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7078 | void *css_debugfs_seqfile_start(struct seq_file *m, loff_t *pos)
         | ^
         | static 
>> kernel/cgroup/cgroup.c:7090:7: warning: no previous prototype for function 'css_debugfs_seqfile_next' [-Wmissing-prototypes]
    7090 | void *css_debugfs_seqfile_next(struct seq_file *m, void *v, loff_t *pos)
         |       ^
   kernel/cgroup/cgroup.c:7090:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7090 | void *css_debugfs_seqfile_next(struct seq_file *m, void *v, loff_t *pos)
         | ^
         | static 
>> kernel/cgroup/cgroup.c:7101:6: warning: no previous prototype for function 'css_debugfs_seqfile_stop' [-Wmissing-prototypes]
    7101 | void css_debugfs_seqfile_stop(struct seq_file *m, void *v)
         |      ^
   kernel/cgroup/cgroup.c:7101:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7101 | void css_debugfs_seqfile_stop(struct seq_file *m, void *v)
         | ^
         | static 
>> kernel/cgroup/cgroup.c:7106:5: warning: no previous prototype for function 'css_debugfs_seqfile_show' [-Wmissing-prototypes]
    7106 | int css_debugfs_seqfile_show(struct seq_file *m, void *v)
         |     ^
   kernel/cgroup/cgroup.c:7106:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    7106 | int css_debugfs_seqfile_show(struct seq_file *m, void *v)
         | ^
         | static 
   10 warnings generated.


vim +/css_debugfs_seqfile_start +7078 kernel/cgroup/cgroup.c

  7076	
  7077	#ifdef CONFIG_DEBUG_FS
> 7078	void *css_debugfs_seqfile_start(struct seq_file *m, loff_t *pos)
  7079	{
  7080		struct cgroup_subsys *ss = m->private;
  7081		struct cgroup_subsys_state *css;
  7082		int id = *pos;
  7083	
  7084		rcu_read_lock();
  7085		css = idr_get_next(&ss->css_idr, &id);
  7086		*pos = id;
  7087		return css;
  7088	}
  7089	
> 7090	void *css_debugfs_seqfile_next(struct seq_file *m, void *v, loff_t *pos)
  7091	{
  7092		struct cgroup_subsys *ss = m->private;
  7093		struct cgroup_subsys_state *css;
  7094		int id = *pos + 1;
  7095	
  7096		css = idr_get_next(&ss->css_idr, &id);
  7097		*pos = id;
  7098		return css;
  7099	}
  7100	
> 7101	void css_debugfs_seqfile_stop(struct seq_file *m, void *v)
  7102	{
  7103		rcu_read_unlock();
  7104	}
  7105	
> 7106	int css_debugfs_seqfile_show(struct seq_file *m, void *v)
  7107	{
  7108		struct cgroup_subsys *ss = m->private;
  7109		struct cgroup_subsys_state *css = v;
  7110		/* data is NULL for root cgroup_subsys_state */
  7111		struct percpu_ref_data *data = css->refcnt.data;
  7112		size_t buflen;
  7113		char *buf;
  7114		int len;
  7115	
  7116		seq_printf(m, "css=%pK cgroup=%pK id=%d ino=%lu flags=%#x refcnt=%lu path=",
  7117			   css, css->cgroup, css->id, cgroup_ino(css->cgroup),
  7118			   css->flags, data ? atomic_long_read(&data->count) : 0);
  7119	
  7120		buflen = seq_get_buf(m, &buf);
  7121		if (buf) {
  7122			len = cgroup_path(css->cgroup, buf, buflen);
  7123			seq_commit(m, len < buflen ? len : -1);
  7124		}
  7125	
  7126		if (ss->css_dump) {
  7127			seq_puts(m, " -- ");
  7128			ss->css_dump(css, m);
  7129		}
  7130	
  7131		seq_putc(m, '\n');
  7132		return 0;
  7133	}
  7134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
