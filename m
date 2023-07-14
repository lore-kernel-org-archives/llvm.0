Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD37A6AB3;
	Fri, 14 Jul 2023 08:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689325050; x=1720861050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YOc8guDu4HREpgotIO4UY2eMC82OEQwrRb9USvM9KGQ=;
  b=SVNRAwgeYDYa0UEDFTQ5GZUOlznMO7g+TOoeyPKC4XNmUMiQ3N8WUcvR
   2cm3BojRQ/yYqmSXXFuxiyM3moPBsLO7fH1jh5RPfetdUsosswG1DpBFp
   OPw9MUMc4PLN9Y3UiAijeZnpLq8nbrmPxrlvlv8ArGp+FhZBSJzEhapU6
   v2VvS6hmneb3CyaOVqeuprn4ZoNF5lsZ6JyAw/Ra7qz9SNEy8THOrZiOx
   bFtbWU3A5tB9OuloKAhkE5OrUgtyWiVxniyp7KhyxLxGsI7pZaJlKbi5m
   bnAnBsuNzr9R9BeZ5gDN5Z4uRqCFtbYVWV9r7+T4dvfmPBPz1JV6PGXsX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451792995"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="451792995"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 01:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1052987999"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="1052987999"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 01:57:28 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKEcB-0007KH-2r;
	Fri, 14 Jul 2023 08:57:27 +0000
Date: Fri, 14 Jul 2023 16:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 48/57] arch/x86/kernel/cpu/debugfs.c:31:45:
 error: use of undeclared identifier '__amd_nodes_per_pkg'
Message-ID: <202307141656.eY6wouYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   39d1f9d6ad3d4b9bf9c298db5685f22d8fe6e2c0
commit: 15d4a8d9254f6947ad3f73cc3d2bf11d320864ff [48/57] x86/cpu: Provide an AMD/HYGON specific topology parser
config: i386-randconfig-i004-20230713 (https://download.01.org/0day-ci/archive/20230714/202307141656.eY6wouYJ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141656.eY6wouYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141656.eY6wouYJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/debugfs.c:31:45: error: use of undeclared identifier '__amd_nodes_per_pkg'
           seq_printf(m, "amd_nodes_per_pkg:   %u\n", __amd_nodes_per_pkg);
                                                      ^
   1 error generated.


vim +/__amd_nodes_per_pkg +31 arch/x86/kernel/cpu/debugfs.c

     9	
    10	static int cpu_debug_show(struct seq_file *m, void *p)
    11	{
    12		unsigned long cpu = (unsigned long)m->private;
    13		struct cpuinfo_x86 *c;
    14	
    15		if (!cpu_online(cpu))
    16			return -ENODEV;
    17	
    18		c = per_cpu_ptr(&cpu_info, cpu);
    19	
    20		seq_printf(m, "initial_apicid:      %x\n", c->topo.initial_apicid);
    21		seq_printf(m, "apicid:              %x\n", c->topo.apicid);
    22		seq_printf(m, "pkg_id:              %u\n", c->topo.pkg_id);
    23		seq_printf(m, "die_id:              %u\n", c->topo.die_id);
    24		seq_printf(m, "cu_id:               %u\n", c->topo.cu_id);
    25		seq_printf(m, "core_id:             %u\n", c->topo.core_id);
    26		seq_printf(m, "logical_pkg_id:      %u\n", c->topo.logical_pkg_id);
    27		seq_printf(m, "logical_die_id:      %u\n", c->topo.logical_die_id);
    28		seq_printf(m, "llc_id:              %u\n", c->topo.llc_id);
    29		seq_printf(m, "l2c_id:              %u\n", c->topo.l2c_id);
    30		seq_printf(m, "amd_node_id:         %u\n", c->topo.amd_node_id);
  > 31		seq_printf(m, "amd_nodes_per_pkg:   %u\n", __amd_nodes_per_pkg);
    32		seq_printf(m, "max_cores:           %u\n", c->x86_max_cores);
    33		seq_printf(m, "max_die_per_pkg:     %u\n", __max_die_per_package);
    34		seq_printf(m, "smp_num_siblings:    %u\n", smp_num_siblings);
    35		return 0;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
