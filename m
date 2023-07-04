Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6F6128;
	Tue,  4 Jul 2023 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688500448; x=1720036448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6H7Uav+540qIGXzUwwOKNXWwL6NrxClpdVBYfGRoUrs=;
  b=PoyYS67rCkYn13654QjoK4mYvNKDoBrVKISz2OC87hmDFVQ5uDyijHWE
   cutexg0Dgjn7h1RucNabEOcg/yHk6KP8wdTEu8OTeXuptYWJPbN+Mmup9
   258X63UZiXmqg3U76dT/ogp2pCVAF3qGUr1xp1bi4CHKXTRVYjrqVwJ3J
   GvEO80cvi0+CrFEpYs24WjD/RvLd0xUEBkYMfNS7d8TFXnN3x6Gv4ybWi
   rqOCFcwZX5so5KAAPF6uTOSj0Yr/1lpDT7lUzvn6cITr6M+Kx731pEOBh
   eyWeSHKa5WgwOLO5FKIOrmDD3EVD9v7DgrjXuqemn+pJlcbKkbMQon6kG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="365750835"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="365750835"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 12:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="712953150"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="712953150"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Jul 2023 12:54:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGm69-000IVP-2G;
	Tue, 04 Jul 2023 19:54:05 +0000
Date: Wed, 5 Jul 2023 03:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 9/39]
 arch/x86/kernel/cpu/mce/inject.c:437:28: error: no member named 'topo' in
 'struct cpuinfo_topology'
Message-ID: <202307050329.SJ4qd5hh-lkp@intel.com>
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
head:   3f2657ab54543fb9ee5894d239f8b7131a6ffac8
commit: ea35973627dfe1f61f68306a3664dcfea513d0c8 [9/39] x86/cpu: Move x86_max_cores into topology info
config: x86_64-randconfig-r003-20230704 (https://download.01.org/0day-ci/archive/20230705/202307050329.SJ4qd5hh-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050329.SJ4qd5hh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050329.SJ4qd5hh-lkp@intel.com/

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
