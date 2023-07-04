Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050182575;
	Tue,  4 Jul 2023 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688476018; x=1720012018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/q1XZVR+Y92hsgPODDFiBN8q/O6MsPRoQbOmEUK7ts=;
  b=LhLlHt8ETe5gF8rDtixaGpF9sstZ8txqx2ZGgeVf73QYtTeM4E+fB1RG
   Ab+fWihmiUcAFoPekqVqbbYbczWn/ckIKDgQgj48UisV3JZxXzvvuDwiC
   sqIU7I0CZXNs2NqwA5t2gDLr0b4ynl9hVIJkiGiYBt/8mD9bABxDXTe54
   MgNvr7I8qxACbBXyG9rva3zskT5VHtyMU3Vi+twtHLUM1efmTwA6fJpoP
   Yzx3mDqPyQ3r0IYyRPt4TDxS2mAj/Wnx9iJWNykc3NL77jKG0nYke5vyQ
   4Xy6D9KA5YnW7Di87NTNI5kBk7ocLMhMQDVkKcwi83zl0sENmJ6QIaqhs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343451284"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="343451284"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 06:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="842988024"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="842988024"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Jul 2023 06:06:53 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGfk4-000IGT-2E;
	Tue, 04 Jul 2023 13:06:52 +0000
Date: Tue, 4 Jul 2023 21:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 9/37]
 arch/x86/kernel/cpu/mce/inject.c:437:28: error: no member named 'topo' in
 'struct cpuinfo_topology'
Message-ID: <202307042007.RqEO152e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   53cee0c91c9944ef2e6b784edaea5df7d6ba5648
commit: 1f177511c113ba6edd3963a1a52180f6df4845b1 [9/37] x86/cpu: Move x86_max_cores into topology info
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230704/202307042007.RqEO152e-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042007.RqEO152e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307042007.RqEO152e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mce/inject.c:437:28: error: no member named 'topo' in 'struct cpuinfo_topology'
           cores_per_node = (c->topo.topo.num_cores_per_pkg * smp_num_siblings) /
                             ~~~~~~~ ^
   1 error generated.


vim +437 arch/x86/kernel/cpu/mce/inject.c

   431	
   432	static u32 get_nbc_for_node(int node_id)
   433	{
   434		struct cpuinfo_x86 *c = &boot_cpu_data;
   435		u32 cores_per_node;
   436	
 > 437		cores_per_node = (c->topo.topo.num_cores_per_pkg * smp_num_siblings) /
   438			amd_get_nodes_per_socket();
   439	
   440		return cores_per_node * node_id;
   441	}
   442	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
